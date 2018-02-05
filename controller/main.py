# coding=utf-8

from datetime import datetime, timedelta
import time

user_name = {
    '1': '小凌',
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
        self.optionA = 0
        self.optionB = 0
        self.optionC = 0
        self.relive = set()

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
        self.optionA = 0
        self.optionB = 0
        self.optionC = 0
        self.relive = set()

    def start(self):
        while True:
            from app import App
            from models.models import Question
            from models.models import Game
            with App.app_context():
                game = Game.get_latest()
                self.set_game(game)
                self.clear()
                now = datetime.now()
                while now < self.start_time:
                    time.sleep(1)
                    now = datetime.now()
                questions, answers = Question.get_timus(self.game.timu_total)
                self.questions = questions
                self.answers = answers
                # 发送开始答题指令，其他人无法加入
                for num in range(0, self.timu_total):
                    # 发送题目开始指令，倒计时10s
                    for i in range(0, self.timu_daojishi):
                        self.send_message('daojishi', {'num': self.timu_daojishi - i})
                        time.sleep(1)
                    self.optionA = 0
                    self.optionB = 0
                    self.optionC = 0
                    self.on_going = True
                    self.q_no = num
                    self.send_message('timu', {'timu': questions[num], 'num': num + 1})
                    self.yes_ids = set()
                    self.submit_sids = set()
                    self.relive = set()
                    # 派发题目, 开始答题
                    time.sleep(self.dati_shijian)
                    # 发送时间到的消息
                    self.send_message('timeout')
                    time.sleep(1)
                    fail_sids = self.rooms - self.yes_ids
                    # 回答错误或未答用户发送消息
                    for sid in fail_sids:
                        submit = True if sid in self.submit_sids.union(self.live_sids) else False
                        self.live_sids.discard(sid)
                        self.send_message('answer_result', {'yes': False, 'submit': submit,
                                                            'A': self.optionA, 'B': self.optionB,
                                                            'C': self.optionC,
                                                            'answer': answers.get(questions[num].get('id'))}, room=sid)
                        user_id = self.user_map.get(sid)
                        if user_id:
                            from models.models import ReliveCard
                            if ReliveCard.use(user_id):
                                self.live_sids.add(sid)
                                self.relive.add(sid)
                    # 回答正确的发送消息
                    for sid in self.yes_ids:
                        self.send_message('answer_result', {'yes': True, 'submit': True,
                                                            'A': self.optionA, 'B': self.optionB,
                                                            'C': self.optionC,
                                                            'answer': answers.get(questions[num].get('id'))}, room=sid)
                    for sid in self.relive:
                        self.send_message('relive', room=sid)
                    time.sleep(2)
                    for sid in fail_sids:
                        self.send_message('correct_answer', {
                            'answer': answers.get(questions[num].get('id'))}, room=sid)
                    time.sleep(3)
                    # 最后一题 给出通关人数
                    if num == self.timu_total - 1:
                        from models.models import ReliveCard
                        for sid in self.yes_ids:
                            user_id = self.user_map.get(sid)
                            # user = user_name.get(str(user_id))
                            from models.models import UserMoney
                            UserMoney.add(self.game.id, user_id, self.total_money / len(self.yes_ids))
                            self.send_message('success', {
                                'msg': '恭喜你！你获得{}元奖励！总共{}人闯关成功！'.format(
                                    self.total_money / len(self.yes_ids),
                                    len(self.yes_ids))}, room=sid)
                            user_id = self.user_map.get(sid, '')
                            if user_id:
                                ReliveCard.add(user_id)
                        if len(self.yes_ids) == 0:
                            self.send_message('fail')
                        self.game.update(stop=1)
                Game.add(datetime.now() + timedelta(minutes=10), 5000, 12, 8, 10)
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
                can_enter = True
                msg = '下场{}开始！'.format(self.start_time.strftime('%Y-%m-%d %H:%M:%S'))
            else:
                can_enter = False
                msg = now.strftime('%Y-%m-%d %H:%M:%S') + ' 在线' + str(len(self.rooms)) + '人   '+ str(self.q_no+1) +'/'+str(self.timu_total)
            self.socketio.emit('join', {'success': True, 'can_enter': can_enter, 'msg': msg})
            with App.app_context():
                from models.models import ReliveCard
                try:
                    for sid in self.rooms:
                        user_id = self.user_map.get(sid, '')
                        card_num = ReliveCard.card_num(user_id)
                        self.send_message('fuhuoka', {'num': card_num}, room=sid)
                except Exception as e:
                    print e
            time.sleep(1)