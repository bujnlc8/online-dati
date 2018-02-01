# coding=utf-8

from flask_socketio import SocketIO


class SingleSocket(SocketIO):
    def __new__(cls, *args, **kwargs):
        if not hasattr(cls, 'instance') or not cls.instance:
            cls.instance = super(SocketIO, cls).__new__(
                cls, *args, **kwargs)
        return cls.instance