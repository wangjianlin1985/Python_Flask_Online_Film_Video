# !/user/bin/env python
# -*- coding:utf-8 -*- 
# time: 2020/3/7--19:49
__author__ = 'Henry'

from app import app
from app import db
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand

manager = Manager(app)
Migrate(app, db)
manager.add_command("db", MigrateCommand)

if __name__ == '__main__':
    manager.run()
    #app.run()
    # app.run(port=8080)
