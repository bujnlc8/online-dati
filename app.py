# coding=utf-8

from threading import Lock

from flask import Flask, request
from flask_socketio import SocketIO, join_room, leave_room
from werkzeug.utils import import_string

from controller.main import Main, answers

thread_lock = Lock()
thread_lock2 = Lock()
thread_lock3 = Lock()
thread = None
thread2 = None
thread3 = None

blueprints = ['views.index:bp']

App = Flask(__name__)
for blueprint in blueprints:
    p = import_string(blueprint)
    App.register_blueprint(p)
socketio = SocketIO(App)
main = Main(socketio)


@socketio.on('connect')
def join():
    main.rooms.add(request.sid)
    join_room(request.sid, request.sid)
    global thread2
    with thread_lock2:
        if main.on_going:
            main.send_message('ongoing', room=request.sid)
            return
        if thread2 is None:
            thread2 = socketio.start_background_task(target=main.join)

@socketio.on('shijian')
def shijian():
    global thread3
    with thread_lock3:
        if thread3 is None:
            thread3 = socketio.start_background_task(target=main.wait_for)


@socketio.on('disconnect')
def disconnect():
    main.yes_ids.discard(request.sid)
    main.rooms.discard(request.sid)
    leave_room(request.sid, request.sid)


@socketio.on('enter')
def enter(msg):
    main.enter(msg['id'])
    room = request.sid
    join_room(room, request.sid)
    main.rooms.add(room)
    main.live_sids.add(room)
    main.user_map.update({room: msg['id']})
    global thread
    with thread_lock:
        if thread is None:
            thread = socketio.start_background_task(target=main.start)


@socketio.on('subAnswer')
def subAnswer(data):
    result = data['result']
    sid = request.sid
    main.submit_sids.add(sid)
    if answers.get(str(main.q_no)) == result:
        main.yes_ids.add(sid)
        main.send_message('answer_result', {'yes': True, 'submit': True}, room=sid)
    else:
        main.live_sids.discard(sid)
        main.send_message('answer_result', {'yes': False, 'submit': True}, room=sid)


if __name__ == '__main__':
    socketio.run(App, host='192.168.1.3',port=8888, debug=True)
