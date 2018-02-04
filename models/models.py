# coding: utf-8
from __future__ import unicode_literals, absolute_import

import random
from datetime import datetime, timedelta

from sqlalchemy import Column, DateTime, \
    Float, Integer, String, text
from ext import db


class Game(db.Model):
    __tablename__ = 'games'

    id = Column(Integer, primary_key=True)
    start_time = Column(DateTime, nullable=False,
                        server_default=text("'0000-00-00 00:00:00'"))
    money = Column(Integer, server_default=text("'0'"))
    timu_total = Column(Integer, server_default=text("'12'"))
    daojishi = Column(Integer, server_default=text("'10'"))
    dati_shijian = Column(Integer, server_default=text("'6'"))
    stop = Column(Integer, server_default=text("'0'"))

    def __init__(self, start_time, money, timu_total,
                 daojishi, dati_shijian,stop):
        self.start_time = start_time
        self.money = money
        self.timu_total = timu_total
        self.daojishi = daojishi
        self.dati_shijian = dati_shijian
        self.stop = stop

    @classmethod
    def add(cls, start_time, money, timu_total, daojishi, dati_shijian):
        db.session.add(
            cls(start_time, money, timu_total, daojishi, dati_shijian, 0))
        db.session.commit()

    @classmethod
    def get_latest(cls):
        now = datetime.now()
        o = cls.query.filter(cls.stop == 0).order_by(cls.id).first()
        if not o:
            return cls(datetime(2018, 12, 31), 5000, 12, 10, 6, 0)
        return o

    def get_by_id(self):
        return Game.query.filter(Game.id == self.id).first()

    def update(self, **args):
        o = self.get_by_id()
        for k, v in args.iteritems():
            o.__setattr__(k, v)
        db.session.add(o)
        db.session.commit()


class Question(db.Model):
    __tablename__ = 'questions'

    id = Column(Integer, primary_key=True)
    timu = Column(String(200), nullable=False)
    optionA = Column(String(200), nullable=False)
    optionB = Column(String(200), nullable=False)
    optionC = Column(String(200), nullable=False)
    answer = Column(String(2), nullable=False)

    def __init__(self, timu, optionA, optionB, optionC, answer):
        self.timu = timu
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.answer = answer

    @classmethod
    def add(cls, timu, optionA, optionB, optionC, answer):
        db.session.add(cls(timu, optionA, optionB, optionC, answer))
        db.session.commit()

    @classmethod
    def get_by_id(cls, id):
        o = cls.query.filter(cls.id == id).all()
        return o

    @classmethod
    def get_timus(cls, total_num):
        ids = cls.query.with_entities(cls.id).all()
        ids = [x[0] for x in ids]
        if total_num > len(ids):
            random_ids = ids
        else:
            random_ids = random.sample(ids, total_num)
        timus = cls.query.filter(cls.id.in_(random_ids)).all()
        timus_list = []
        timus_answer = {}
        for x in timus:
            timus_list.append({'id': x.id, 'timu': x.timu,
                               'A': x.optionA, 'B': x.optionB, 'C': x.optionC})
            timus_answer.update({x.id: x.answer})
        return timus_list, timus_answer


class UserMoney(db.Model):
    __tablename__ = 'user_money'

    id = Column(Integer, primary_key=True)
    game_id = Column(Integer, nullable=False)
    user_id = Column(Integer, nullable=False)
    money = Column(Float(6), nullable=False, server_default=text("'0.00'"))
    create_time = Column(DateTime, nullable=False,
                         server_default=text("CURRENT_TIMESTAMP"))

    def __init__(self, game_id, user_id, money):
        self.game_id = game_id
        self.user_id = user_id
        self.money = money

    @classmethod
    def add(cls, game_id, user_id, money):
        db.session.add(cls(game_id, user_id, money))
        db.session.commit()


class User(db.Model):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True)
    name = Column(String(20), nullable=False)

    def __init__(self, name):
        self.name = name
