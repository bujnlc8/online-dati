# coding=utf-8

import time
from datetime import datetime, timedelta

user_name = {
    '1': '小王',
    '2': '小晨',
    '3': '小凌',
    '4': '小海',
    '5': '小辉'
}

answers = {
    '1': 'B',
    '2': 'A',
    '3': 'A',
    '4': 'B',
    '5': 'A',
    '6': 'C',
    '7': 'A',
    '8': 'C',
    '9': 'C',
    '10': 'A',
    '11': 'A',
    '12': 'B',
}

questions = {
    # '1': {'timu': '我爱我家桂林？', 'A': '是的', 'B': '很爱', 'C': '很爱很爱'},
    '1': {'timu': '自然界中，有“智慧元素”之称的是?', 'A': '铁', 'B': '碘', 'C': '钙'},
    '2': {'timu': '缺乏维生素D，缺钙会引起', 'A': '佝偻病', 'B': '坏血病', 'C': '贫血病'},
    '3': {'timu': '人体细胞中含量最高的是?', 'A': '水', 'B': '蛋白质', 'C': '脂肪'},
    '4': {'timu': '下列等重量营养素产能最多的是?', 'A': '蛋白质', 'B': '脂肪', 'C': '糖类'},
    '5': {'timu': 'X型腿、鸡胸常见于下列哪种物质的缺乏？', 'A': '维生素D', 'B': '维生素B', 'C': '维生素E'},
    '6': {'timu': '人的眼睛为了看清远近物体，起调节作用的是', 'A': '房水', 'B': '玻璃体', 'C': '晶状体'},
    '7': {'timu': '沙眼主要通过什么传播?', 'A': '接触', 'B': '空气', 'C': '血液'},
    '8': {'timu': '流行性感冒的高发季节为？', 'A': '夏秋季', 'B': '秋冬季', 'C': '冬春季'},
    '9': {'timu': '真性近视是指？', 'A': '视力低于5.0', 'B': '调节性近视', 'C': '眼轴变长'},
    '10': {'timu': '火灾使人致命的最主要的原因是什么？', 'A': '窒息', 'B': '烧死', 'C': '跳楼'},
    '11': {'timu': '扑救电气火灾应首先做什么?', 'A': '切断电源', 'B': '泡沫灭火器灭火', 'C': '寻找水源'},
    '12': {'timu': '每年（   ）为我国“防灾减灾日”。', 'A': '4月20日', 'B': '5月12日', 'C': '9月11日'},
}


class Main(object):

    def __init__(self, socketio):
        self.yes_ids = set()
        self.start_time = datetime(2018, 2, 2, 1, 23)
        self.socketio = socketio
        self.rooms = set()
        self.user_map = {}
        self.q_no = 0
        self.total_money = 50000
        self.timu_daojishi = 10
        self.timu_total = 12
        self.submit_sids = set()  # 提交答案的用户
        self.live_sids = set()
        self.on_going = False

    def clear(self):
        self.yes_ids = set()
        self.q_no = 0
        self.submit_sids = set()
        self.live_sids = set()
        self.on_going = False

    def start(self):
        now = datetime.now()
        while now < self.start_time:
            self.socketio.sleep(1)
            now = datetime.now()
        # 发送开始答题指令，其他人无法加入
        for num in range(0, self.timu_total):
            # 发送题目开始指令，倒计时10s
            for i in range(0, self.timu_daojishi):
                self.send_message('daojishi', {'num': self.timu_daojishi - i})
                self.socketio.sleep(1)
            self.on_going = True
            self.q_no = num + 1
            self.send_message('timu', {'timu': questions.get(str(self.q_no)), 'num': num + 1})
            self.yes_ids = set()
            self.submit_sids = set()
            # 派发题目, 开始答题, 答题持续6秒
            self.socketio.sleep(6)
            # self.send_message('timeout')
            # 统计答案，等待结果
            self.send_message('wait_for_result')
            fail_sids = self.rooms - self.yes_ids
            for sid in fail_sids:
                submit = True if sid in self.submit_sids.union(self.live_sids) else False
                self.live_sids.discard(sid)
                self.send_message('answer_result', {'yes': False, 'submit': submit}, room=sid)
            self.socketio.sleep(2)
            self.send_message('correct_answer', {'answer': answers.get(str(self.q_no))})
            self.socketio.sleep(3)
            # 最后一题 给出通关人数
            if num == self.timu_total - 1:
                for sid in self.yes_ids:
                    user_id = self.user_map.get(sid)
                    user = user_name.get(str(user_id))
                    self.send_message('success', {
                        'msg': '恭喜你！{}，你获得{}元奖励！总共{}人闯关成功!'.format(
                            user, self.total_money / len(self.yes_ids),
                            len(self.yes_ids))}, room=sid)
                if len(self.yes_ids) == 0:
                    self.send_message('fail')
        self.clear()

    def send_message(self, event, message=None, namespace=None, room=None):
        if not message:
            message = {'data': ''}
        self.socketio.emit(event, message, namespace=namespace, room=room)

    def join(self):
        can_enter = False
        while True:
            self.socketio.sleep(1)
            now = datetime.now()
            msg = ''
            if now <= self.start_time:
                if (self.start_time - now).seconds <= 3:
                    can_enter = True
                else:
                    msg = '{}开始！'.format(self.start_time.strftime('%Y-%m-%d %H:%M'))
            else:
                can_enter = False
                msg = '你已经错过本次答题！'
            self.socketio.emit('join', {'success': True, 'can_enter': can_enter, 'msg': msg})

    def enter(self, id):
        self.socketio.emit('enter', {'online': len(self.rooms)})

    def wait_for(self):
        while True:
            now = datetime.now()
            self.send_message('wait_for', {'now': now.strftime('%Y-%m-%d %H:%M:%S'),
                                           'online': len(self.rooms)})
            self.socketio.sleep(1)
