from server.server import server, socketio

if __name__ == '__main__':
    socketio.run(server, host='0.0.0.0', debug=True, port=8050)
