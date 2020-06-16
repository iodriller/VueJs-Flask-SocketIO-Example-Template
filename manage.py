from flask_script import Manager, Server
from server.server import server

manager = Manager(server)

manager.add_command('runserver', Server(host='0.0.0.0', debug=True, port=8050, threaded=True, use_reloader=True))

if __name__ == '__main__':
    manager.run()
