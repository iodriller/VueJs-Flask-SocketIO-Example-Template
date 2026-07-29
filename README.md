
# Vue + Flask-SocketIO Example Template

A small, current starter for a Vue 3 client talking to Flask-SocketIO over
WebSockets.

## Server

```shell
python -m venv .venv
python -m pip install -r requirements.txt
python manage.py
```

The API and Socket.IO server listen on `http://localhost:8050`.

## Client

Use Node 20.19+ or Node 22.12+:

```shell
cd client
npm ci
npm run dev
```

Set `VITE_SOCKET_URL` when the server is not available at the default URL.

## Validation

```shell
python -m pytest -q
cd client
npm run build
npm audit --omit=dev --audit-level=high
```

GitHub Actions also builds both Dockerfiles. Dependabot keeps the Python,
Node, and workflow dependencies current.

## Containers

```shell
docker compose up --build
```

This template intentionally does not include a database or authentication.
