# Development container (Docker)

This repo includes a small Docker + Compose setup to run a development container for testing Python scripts.

Files added:
- `Dockerfile` - builds a Python 3.11 slim image and installs packages from `requirements.txt`.
- `docker-compose.yml` - compose service `dev` that mounts the repo and starts a shell.
- `requirements.txt` - minimal dev/test deps (pytest, requests, beautifulsoup4).

Quick start (Windows PowerShell):

1. Build and start the container in background:

```powershell
docker compose up --build -d
```

2. Open an interactive shell inside the running container:

```powershell
docker compose exec dev bash
```

3. Inside the container you can run tests or scripts:

```bash
pytest -q
python hello_world.py
```

To stop and remove the container:

```powershell
docker compose down
```

Notes:
- The repository is mounted into `/workspace` so edits made on the host are immediately visible inside the container.
- If you need extra packages, add them to `requirements.txt` and rebuild with `docker compose up --build`.
- For Windows users, Docker Desktop is required and `docker` must be available in your PATH.
