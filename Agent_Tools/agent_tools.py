import os
import subprocess
import datetime

LOG_FILE = "C:/AI-Dev/_agent_tool_log.txt"

def log_action(action, result):
    with open(LOG_FILE, "a", encoding="utf-8") as log:
        log.write(f"\n[{datetime.datetime.now()}] ACTION: {action}\nRESULT:\n{result}\n")

def list_files(path):
    try:
        files = os.listdir(path)
        result = "\n".join(files)
        log_action(f"List files in {path}", result)
        print(result)
    except Exception as e:
        print(f"Error: {e}")
        log_action(f"List files in {path}", f"ERROR: {e}")

def read_file(file_path):
    try:
        with open(file_path, 'r', encoding="utf-8") as f:
            content = f.read()
        log_action(f"Read file {file_path}", content[:2000])  # Only log the first 2k chars
        print(content)
    except Exception as e:
        print(f"Error: {e}")
        log_action(f"Read file {file_path}", f"ERROR: {e}")

def write_file(file_path, content):
    try:
        with open(file_path, 'w', encoding="utf-8") as f:
            f.write(content)
        log_action(f"Write file {file_path}", f"SUCCESS (length {len(content)})")
        print(f"File {file_path} updated!")
    except Exception as e:
        print(f"Error: {e}")
        log_action(f"Write file {file_path}", f"ERROR: {e}")

def run_shell(command):
    try:
        result = subprocess.check_output(command, shell=True, text=True)
        log_action(f"Run shell: {command}", result)
        print(result)
    except subprocess.CalledProcessError as e:
        print(f"Command failed: {e}")
        log_action(f"Run shell: {command}", f"ERROR: {e}")

def menu():
    print("\n=== Agent Tool Console ===")
    print("1. List files in directory")
    print("2. Read file")
    print("3. Write file")
    print("4. Run shell command")
    print("5. Exit")
    print("All actions are logged to C:/AI-Dev/_agent_tool_log.txt\n")

if __name__ == "__main__":
    while True:
        menu()
        choice = input("Select an option: ").strip()
        if choice == "1":
            path = input("Enter directory path: ").strip()
            list_files(path)
        elif choice == "2":
            file_path = input("Enter file path: ").strip()
            read_file(file_path)
        elif choice == "3":
            file_path = input("Enter file path: ").strip()
            print("Paste the new file content (end with a blank line):")
            lines = []
            while True:
                line = input()
                if line == "":
                    break
                lines.append(line)
            content = "\n".join(lines)
            write_file(file_path, content)
        elif choice == "4":
            command = input("Enter shell command: ").strip()
            run_shell(command)
        elif choice == "5":
            print("Exiting Agent Tool Console.")
            break
        else:
            print("Invalid choice. Try again.")

