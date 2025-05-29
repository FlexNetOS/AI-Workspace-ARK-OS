# C:\AI-Dev\launch_all_agents.ps1

# Paths to your agents (edit if needed)
$oiPath = "C:\AI-Dev\open-interpreter"
$asPath = "C:\AI-Dev\Agent-S"
$ohPath = "C:\AI-Dev\OpenHands"

# Ensure Git and Ollama are on PATH
$env:Path += ";C:\Program Files\Git\cmd"
$env:Path += ";C:\Users\De-Flex.Net\AppData\Local\Programs\Ollama"

# Launch Open Interpreter
if (!(Test-Path "$oiPath\venv\Scripts\activate")) {
    Set-Location $oiPath
    python -m venv venv
    .\venv\Scripts\activate
    if (Test-Path "requirements.txt") { pip install -r requirements.txt }
    pip install --upgrade pip
    deactivate
}
if (Test-Path "$oiPath\main.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$oiPath`"; .\venv\Scripts\activate; python main.py --model ollama/deepseek-r1:70b"
} elseif (Test-Path "$oiPath\cli.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$oiPath`"; .\venv\Scripts\activate; python cli.py --model ollama/deepseek-r1:70b"
} else {
    Write-Host "Open Interpreter launch script (main.py or cli.py) not found. Please check $oiPath."
}

# Launch Agent-S
if (!(Test-Path "$asPath\venv\Scripts\activate")) {
    Set-Location $asPath
    python -m venv venv
    .\venv\Scripts\activate
    if (Test-Path "requirements.txt") { pip install -r requirements.txt }
    pip install --upgrade pip
    deactivate
}
if (Test-Path "$asPath\agent_s.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$asPath`"; .\venv\Scripts\activate; python agent_s.py"
} elseif (Test-Path "$asPath\main.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$asPath`"; .\venv\Scripts\activate; python main.py"
} else {
    Write-Host "Agent-S launch script (agent_s.py or main.py) not found. Please check $asPath."
}

# Launch OpenHands
if (!(Test-Path "$ohPath\venv\Scripts\activate")) {
    Set-Location $ohPath
    python -m venv venv
    .\venv\Scripts\activate
    if (Test-Path "requirements.txt") { pip install -r requirements.txt }
    pip install --upgrade pip
    deactivate
}
if (Test-Path "$ohPath\main.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$ohPath`"; .\venv\Scripts\activate; python main.py"
} elseif (Test-Path "$ohPath\cli.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$ohPath`"; .\venv\Scripts\activate; python cli.py"
} elseif (Test-Path "$ohPath\app.py") {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd `"$ohPath`"; .\venv\Scripts\activate; python app.py"
} else {
    Write-Host "OpenHands launch script (main.py, cli.py, or app.py) not found. Please check $ohPath."
}

Write-Host "`nAll agents (Open Interpreter, Agent-S, OpenHands) are now launched in their own terminal windows and ready for interaction!"

