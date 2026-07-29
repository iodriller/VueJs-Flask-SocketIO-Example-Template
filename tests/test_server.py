from server.server import server, socketio


def test_index_health_route():
    response = server.test_client().get("/index")

    assert response.status_code == 200
    assert response.get_data(as_text=True).strip() == "Hello Flask!"


def test_socket_message_round_trip():
    client = socketio.test_client(server)

    client.emit("SEND_MESSAGE", {"message": "hello"})
    messages = client.get_received()
    client.disconnect()

    assert messages == [
        {
            "name": "message_to_client",
            "args": [{"data": "you received this message from the server"}],
            "namespace": "/",
        }
    ]
