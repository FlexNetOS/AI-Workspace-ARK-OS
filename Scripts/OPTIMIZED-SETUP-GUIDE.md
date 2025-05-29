# AI-Workspace-ARK-OS: Optimized Cross-Platform Setup Guide

This guide ensures your workspace is ready for seamless development on Windows, WSL2 (Ubuntu/Debian), Python, pip, and GitHub, with best practices for performance and maintainability.

---

## 1. Windows & VS Code
- Open VS Code and select `X:\AI-Workspace-ARK-OS` as your main folder.
- Your `.vscode/settings.json` is already optimized for a clean, productive UI.
- Install these VS Code extensions:
  - Python (ms-python.python)
  - Remote - WSL (ms-vscode-remote.remote-wsl)
  - GitHub Pull Requests and Issues (github.vscode-pull-request-github)
  - Docker (ms-azuretools.vscode-docker)

## 2. WSL2 (Ubuntu/Debian) Setup
- Install WSL2 and Ubuntu or Debian from the Microsoft Store.
- Set WSL2 as default:
  ```powershell
  wsl --set-default-version 2
  ```
- Launch your Linux distro and run:
  ```bash
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y python3 python3-pip python3-venv git build-essential
  cd /mnt/x/AI-Workspace-ARK-OS
  ```

## 3. Python Environment
- (Recommended) Create a virtual environment:
  ```bash
  python3 -m venv .venv
  source .venv/bin/activate
  ```
- Install dependencies:
  ```bash
  pip install --upgrade pip
  pip install -r requirements.txt  # If present
  ```

## 4. Git & GitHub
- Configure Git:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```
- (Optional) Set up SSH keys for GitHub:
  ```bash
  ssh-keygen -t ed25519 -C "your@email.com"
  cat ~/.ssh/id_ed25519.pub
  # Add the output to your GitHub SSH keys
  ```

## 5. Docker Desktop Integration
- In Docker Compose or Docker run commands, use:
  - Windows: `X:\AI-Workspace-ARK-OS:/workspace`
  - WSL2/Linux: `/mnt/x/AI-Workspace-ARK-OS:/workspace`
- Example for `docker-compose.yml`:
  ```yaml
  services:
    myservice:
      image: myimage
      volumes:
        - /mnt/x/AI-Workspace-ARK-OS:/workspace
  ```

## 6. VS Code Remote Development
- Open a WSL2 terminal in `/mnt/x/AI-Workspace-ARK-OS` and run:
  ```bash
  code .
  ```
- This launches VS Code in the Linux context, using your Windows UI.

## 7. Performance & Best Practices
- Keep your workspace on the X: drive for fast I/O and easy backup.
- Use `.venv` for Python isolation.
- Use Git for version control and GitHub for collaboration.
- Use Docker for reproducible environments.

---

**You are now fully optimized for cross-platform, high-performance AI development!**
