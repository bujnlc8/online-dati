# coding=utf-8

from threading import Lock

from flask import Flask, request
from flask_socketio import SocketIO, join_room, leave_room
from werkzeug.utils import import_string

from controller.main import Main
from ext import db

thread_lock = Lock()
thread_lock2 = Lock()
thread = None
thread2 = None

blueprints = ['views.index:bp']


def create_app():
    app = Flask(__name__)
    app.config.from_object('envcfg.json.dati')
    for blueprint in blueprints:
        p = import_string(blueprint)
        app.register_blueprint(p)
    db.init_app(app)
    return app

App = create_app()
socketio = SocketIO(App)
main = Main(socketio)


@socketio.on('connect')
def join():
    with App.app_context():
        from models.models import Game
        game = Game.get_latest()
        main.set_game(game)
    main.rooms.add(request.sid)
    join_room(request.sid, request.sid)
    global thread2
    with thread_lock2:
        if main.on_going:
            main.send_message('ongoing', room=request.sid)
            return
        if thread2 is None:
            thread2 = socketio.start_background_task(target=main.join)


@socketio.on('disconnect')
def disconnect():
    main.yes_ids.discard(request.sid)
    main.rooms.discard(request.sid)
    leave_room(request.sid, request.sid)


@socketio.on('enter')
def enter(msg):
    room = request.sid
    open = int(msg.get('open', 0))
    join_room(room, request.sid)
    main.rooms.add(room)
    main.live_sids.add(room)
    main.user_map.update({room: msg['id']})
    with thread_lock:
            if open == 1:
                socketio.start_background_task(target=main.start)


@socketio.on('subAnswer')
def subAnswer(data):
    result = data['result']
    sid = request.sid
    main.submit_sids.add(sid)
    if main.answers.get(main.questions[main.q_no].get('id')) == result:
        main.yes_ids.add(sid)
        main.send_message('answer_result', {'yes': True, 'submit': True}, room=sid)
    else:
        main.live_sids.discard(sid)
        main.send_message('answer_result', {'yes': False, 'submit': True}, room=sid)


if __name__ == '__main__':
    socketio.run(App, host='192.168.1.15',port=8888, debug=True)
