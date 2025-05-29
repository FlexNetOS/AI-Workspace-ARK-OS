# How to Access and Use X:\AI-Workspace-ARK-OS Across Environments

## 1. VS Code Default Folder
- Open VS Code.
- Go to `File` > `Open Folder...` and select `X:\AI-Workspace-ARK-OS`.
- (Optional) Create a shortcut or batch file with:
  ```powershell
  code "X:\AI-Workspace-ARK-OS"
  ```
- Your workspace settings are already configured in `.vscode/settings.json`.

## 2. Access from WSL2
- Open your WSL2 terminal and run:
  ```bash
  cd /mnt/x/AI-Workspace-ARK-OS
  ```
- (Optional) Add this to your `~/.bashrc` or `~/.zshrc` for quick access.

## 3. Docker Desktop Volumes/Bind Mounts
- In your `docker-compose.yml` or Docker run commands, use:
  - On Windows: `X:\AI-Workspace-ARK-OS:/workspace`
  - On WSL2/Linux: `/mnt/x/AI-Workspace-ARK-OS:/workspace`
- Example for `docker-compose.yml`:
  ```yaml
  services:
    myservice:
      image: myimage
      volumes:
        - /mnt/x/AI-Workspace-ARK-OS:/workspace
  ```
- If you want, I can update a specific `docker-compose.yml` for you—just let me know which one.

---

**You are now set up for a unified, cross-platform development workflow!**
