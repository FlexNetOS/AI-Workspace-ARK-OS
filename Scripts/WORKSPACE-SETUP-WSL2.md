# Unified Workspace Setup: Ubuntu, WSL2, Debian, Python, pip, GitHub

## 1. WSL2 Installation & Setup
- Install WSL2 and your preferred Linux distribution (Ubuntu or Debian) from the Microsoft Store.
- Set WSL2 as your default version:
  ```powershell
  wsl --set-default-version 2
  ```
- Launch Ubuntu or Debian from the Start menu.

## 2. Access Project Directory in WSL2
- In your WSL2 terminal:
  ```bash
  cd /mnt/x/AI-Workspace-ARK-OS
  ```

## 3. Python & pip Setup
- Update package lists:
  ```bash
  sudo apt update
  ```
- Install Python and pip:
  ```bash
  sudo apt install -y python3 python3-pip
  ```
- Verify installation:
  ```bash
  python3 --version
  pip3 --version
  ```

## 4. Git & GitHub Setup
- Install git:
  ```bash
  sudo apt install -y git
  ```
- Configure your Git identity:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```
- (Optional) Generate SSH keys for GitHub:
  ```bash
  ssh-keygen -t ed25519 -C "your@email.com"
  cat ~/.ssh/id_ed25519.pub
  # Add the output to your GitHub SSH keys
  ```

## 5. VS Code Integration
- Install the "Remote - WSL" extension in VS Code.
- Open VS Code and use:
  ```powershell
  code .
  ```
  from within `/mnt/x/AI-Workspace-ARK-OS` in WSL2 to launch VS Code in the context of your Linux environment.

## 6. Python Environment (Optional but Recommended)
- Create a virtual environment:
  ```bash
  python3 -m venv .venv
  source .venv/bin/activate
  ```
- Install project dependencies:
  ```bash
  pip install -r requirements.txt
  ```

---

**You are now ready for cross-platform development with Ubuntu/Debian, WSL2, Python, pip, and GitHub!**
