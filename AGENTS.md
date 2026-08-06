# AGENTS.md

## Project

This repository is a deliberately small example of a Vue 3/Vite client talking
to a Flask-SocketIO server. It is a starter template, not a production platform:
database, authentication, authorization, and deployment policy are intentionally
out of scope.

`server/` owns Flask and Socket.IO behavior, `client/` owns the Vue application,
`manage.py` starts the server, and the two Dockerfiles plus `docker-compose.yml`
define the container example.

## Commands

Server:

```bash
python -m venv .venv
python -m pip install -r requirements.txt
python manage.py
python -m pytest -q
```

Client:

```bash
cd client
npm ci
npm run dev
npm run build
npm audit --omit=dev --audit-level=high
```

Containers:

```bash
docker compose up --build
```

## Project Rules

- Keep the example small and readable. Do not add a database, authentication
  framework, state-management framework, or deployment system without an explicit
  requirement.
- Preserve the Socket.IO event contract across client and server; update both
  sides and focused tests together.
- Keep server/domain behavior out of Vue components and presentation behavior out
  of Flask handlers.
- Use `VITE_SOCKET_URL` for non-default server locations rather than hardcoding
  environment-specific hosts.
- Maintain Node compatibility documented in the README and the Python versions
  exercised by CI.
- Dependency updates should remain narrow: review release notes and lockfile
  changes, run the affected checks, and avoid unrelated framework migrations.

## Verification

- Documentation or guidance only: verify referenced paths and run
  `git diff --check`; application tests are not required.
- Server changes: run the focused test and `python -m pytest -q`.
- Client changes: run `npm run build`; add a focused client test if behavior
  warrants introducing the existing test tooling.
- Dependency changes: run the appropriate audit and build/test lane.
- Container changes: build both images or run `docker compose up --build` when
  Docker is available.

Report skipped Docker, browser, network, or platform checks explicitly.

## Git and Safety

- Preserve unrelated changes and keep commits focused.
- Use the configured repository-owner identity.
- Do not add assistant names, co-author trailers, session links, or tool
  attribution to Git artifacts.
- Never commit secrets or environment-specific production URLs.
