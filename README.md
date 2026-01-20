# Inception

A system administration project focused on using **Docker** and **Docker Compose** to set up a small infrastructure composed of several services running in isolated containers. 
The goal is to practice containerization, service orchestration, networking, and basic security concepts while following strict constraints.

The project is deployed on a **virtual machine** and relies entirely on **Dockerfiles** written from scratch (no pre-built images).

---

## Architecture
The infrastructure consists of the following services:

- **NGINX** – reverse proxy with TLS (HTTPS only)
- **WordPress** – PHP-FPM application
- **MariaDB** – database for WordPress

Each service:
- Runs in its **own container**
- Uses a **dedicated Dockerfile**
- Is connected via a **Docker network**
- Stores persistent data using **Docker volumes**

```
┌─────────┐     HTTPS     ┌────────────┐
│ Browser │ ───────────▶ │   NGINX    │
└─────────┘               └─────┬──────┘
                                │ FastCGI
                        ┌───────▼────────┐
                        │   WordPress    │
                        └───────┬────────┘
                                │ SQL
                         ┌──────▼───────┐
                         │  MariaDB     │
                         └──────────────┘
```

---

## Technologies
- **Docker**
- **Docker Compose**
- **NGINX**
- **WordPress**
- **MariaDB**
- **OpenSSL** (TLS certificates)
- **Bash**
- **Debian Linux**

---

## Environment Variables
All sensitive information is stored in a **.env** file. If you want to use mine, simply rename .env-example to .env

---

## Security Constraints
- HTTPS **only** (TLSv1.2 or TLSv1.3)
- No hardcoded credentials
- No `latest` tags in images
- Containers must not run unnecessary services
- NGINX is the **only** container exposed to the outside

---

## Installation & Usage

### 1. Clone the repository
```bash
git clone https://github.com/char-projects/Inception
cd Inception
```

### 2. Set up environment variables
```bash
cp srcs/.env-example srcs/.env
```
Edit the `.env` file with your own values if you want.

### 3. Build and run
```bash
make
```
Or manually:
```bash
docker compose -f ./srcs/docker-compose.yml up --build
```

### 4. Access the website
Open your browser and go to:
```
https://cschnath.42.fr
```

---

## Makefile Commands

| Command | Description |
|-------|-------------|
| `make` | Build and start containers |
| `make down` | Stop containers |
| `make clean` | Remove containers |
| `make fclean` | Remove containers, images, volumes |
| `make re` | Full rebuild |

---

## What I Learned
- Building Docker images from scratch
- Docker networking and volumes
- Securing services with TLS
- Environment variable management
- Containerized service orchestration

---

## Notes
- No external images or services are used
- Designed to be reproducible on any compatible Linux VM

---

> "It works on my machine" is not enough — containers make it reproducible.
