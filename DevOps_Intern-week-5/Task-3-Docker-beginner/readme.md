
# 🐳 Docker Beginner Guide — README for Interns

Welcome, Interns! This guide will help you get started with Docker — a powerful tool for developers. Follow the steps below to learn the basics and complete your first tasks.

---

## 📦 Part 1 — What is Docker?

Docker is a **containerization platform**. It lets you package your app and everything it needs (code, libraries, configs) into a **container** — a lightweight, portable unit that runs the same anywhere.

Think of it like a **sealed box**: once packed, it works the same on any machine — laptop, server, or cloud.

---

## 🆚 Part 2 — Docker vs Virtual Machines

| Feature         | Virtual Machines         | Docker Containers         |
|----------------|--------------------------|---------------------------|
| OS             | Full OS (GBs)            | Share host OS (MBs)       |
| Speed          | Slow to boot (minutes)   | Fast to start (seconds)   |
| Size           | Large images (GBs)       | Lightweight (MBs)         |
| Isolation      | Full hardware emulation  | Process-level isolation   |
| Use Case       | Run different OSes       | Run many apps consistently|

---

## 🛠️ Part 3 — Basic Docker Commands

```bash
docker --version           # Check Docker installation
docker run hello-world     # Run test container
docker ps                  # List running containers
docker ps -a               # List all containers (including stopped)
docker images              # List downloaded images
docker pull nginx          # Download nginx image
docker run -d -p 8080:80 nginx  # Run nginx on port 8080
docker stop <container_id>     # Stop container
docker rm <container_id>       # Remove container
docker rmi <image_id>          # Remove image
```

---

## 📄 Part 4 — Writing a Dockerfile

A **Dockerfile** is a recipe to build your own Docker image.

### Example:

```Dockerfile
# Base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Copy files
COPY app.sh /app.sh

# Set working directory
WORKDIR /

# Default command
CMD ["bash", "app.sh"]
```

### Keywords:
- `FROM` → Base image
- `RUN` → Run commands during build
- `COPY` → Copy files into image
- `WORKDIR` → Set working directory
- `CMD` → Default command when container starts
- `ENTRYPOINT` → Like CMD, but always runs
- `EXPOSE` → Document container port (use `-p` to publish)

---

## 🐙 Part 5 — Docker Images & Docker Hub

Docker Hub is where images live.

### Types of Images:
- **Official** → Maintained by Docker (e.g., `nginx`, `python`)
- **Community** → Shared by users
- **Tagged** → Specific versions (e.g., `python:3.9`)

✅ Always use specific tags instead of `latest`.

---

## 🌐 Part 6 — Docker Networking Basics

Docker uses **bridge networking** by default.

- Each container gets a private IP.
- Use `-p host:container` to expose ports.

### Example:
```bash
docker run -d -p 8080:80 nginx
```
Access Nginx at: [http://localhost:8080](http://localhost:8080)

---

## ✅ Tasks for You

1. **Run nginx container** and open it in browser on port `8080`.
2. **Write a Dockerfile** that prints `'Hello Interns!'`.
3. **Pull Python images**:
   ```bash
   docker pull python:3.8
   docker pull python:3.11
   ```
   Run containers and check versions:
   ```bash
   docker run python:3.8 python --version
   docker run python:3.11 python --version
   ```
4. **Inspect container IP**:
   ```bash
   docker inspect <container_id> | grep IPAddress
   ```
