#!/usr/bin/env python
# coding=utf-8

from flask_script import Manager
from app import App
from flask_migrate import MigrateCommand, Migrate
from app import db

migrate = Migrate(App, db)
manager = Manager(App)
manager.add_command('db', MigrateCommand)


@manager.shell
def make_shell_context():
    return {'app': App}


if __name__ == '__main__':
    manager.run()