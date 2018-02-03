# coding=utf-8

from datetime import datetime

user_name = {
    '1': '小王',
    '2': '小晨',
    '3': '小凌',
    '4': '小海',
    '5': '小辉'
}


class Main(object):

    def __init__(self, socketio):
        self.socketio = socketio
        self.yes_ids = set()
        self.rooms = set()
        self.user_map = {}
        self.q_no = -1
        self.submit_sids = set()
        self.live_sids = set()
        self.on_going = False
        self.open = 0 # 开始开关

    @property
    def start_time(self):
        return self.game.start_time

    @property
    def total_money(self):
        return self.game.money

    @property
    def timu_total(self):
        return self.game.timu_total

    @property
    def timu_daojishi(self):
        return self.game.daojishi

    @property
    def dati_shijian(self):
        return self.game.dati_shijian

    def set_game(self, game):
        self.game = game

    def clear(self):
        self.yes_ids = set()
        self.q_no = -1
        self.submit_sids = set()
        self.live_sids = set()
        self.on_going = False
        self.open = 0

    def start(self):
        now = datetime.now()
        while now < self.start_time:
            self.socketio.sleep(1)
            now = datetime.now()
        from app import App
        from models.models import Question
        App.app_context().push()
        questions, answers = Question.get_timus(self.game.timu_total)
        self.questions = questions
        self.answers = answers
        # 发送开始答题指令，其他人无法加入
        for num in range(0, self.timu_total):
            # 发送题目开始指令，倒计时10s
            for i in range(0, self.timu_daojishi):
                self.send_message('daojishi', {'num': self.timu_daojishi - i})
                self.socketio.sleep(1)
            self.on_going = True
            self.q_no = num
            self.send_message('timu', {'timu': questions[num], 'num': num + 1})
            self.yes_ids = set()
            self.submit_sids = set()
            # 派发题目, 开始答题
            self.socketio.sleep(self.dati_shijian)
            # self.send_message('timeout')
            # 统计答案，等待结果
            self.send_message('wait_for_result')
            fail_sids = self.rooms - self.yes_ids
            for sid in fail_sids:
                submit = True if sid in self.submit_sids.union(self.live_sids) else False
                self.live_sids.discard(sid)
                self.send_message('answer_result', {'yes': False, 'submit': submit}, room=sid)
            self.socketio.sleep(2)
            self.send_message('correct_answer', {
                'answer': answers.get(questions[num].get('id'))})
            self.socketio.sleep(3)
            # 最后一题 给出通关人数
            if num == self.timu_total - 1:
                for sid in self.yes_ids:
                    user_id = self.user_map.get(sid)
                    user = user_name.get(str(user_id))
                    from models.models import UserMoney
                    UserMoney.add(self.game.id, user_id, self.total_money / len(self.yes_ids))
                    self.send_message('success', {
                        'msg': '恭喜你！{}，你获得{}元奖励！总共{}人闯关成功!'.format(
                            user, self.total_money / len(self.yes_ids),
                            len(self.yes_ids))}, room=sid)
                if len(self.yes_ids) == 0:
                    self.send_message('fail')
        self.game.update(stop=1)
        self.clear()

    def send_message(self, event, message=None, namespace=None, room=None):
        if not message:
            message = {'data': ''}
        self.socketio.emit(event, message, namespace=namespace, room=room)

    def join(self):
        can_enter = False
        while True:
            from app import App
            with App.app_context():
                from models.models import Game
                game = Game.get_latest()
                self.set_game(game)
            now = datetime.now()
            msg = ''
            if now <= self.start_time:
                self.open += 1
                can_enter = True
                msg = '{}开始！'.format(self.start_time.strftime('%Y-%m-%d %H:%M:%S'))
            else:
                can_enter = False
                msg = now.strftime('%Y-%m-%d %H:%M:%S') + ' 在线' + str(len(self.rooms)) + '人'
            self.socketio.emit('join', {'success': True, 'can_enter': can_enter, 'msg': msg,
                                        'open': self.open})
            self.socketio.sleep(1)