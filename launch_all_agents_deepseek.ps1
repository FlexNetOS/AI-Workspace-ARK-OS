# --- Set Paths ---
$ollamaPath = "C:\Users\De-Flex.Net\AppData\Local\Programs\Ollama\ollama.exe"
$oiPath = "C:\AI-Dev\open-interpreter"
$asPath = "C:\AI-Dev\Agent-S"
$ohPath = "C:\AI-Dev\OpenHands"

# --- 1. Start Ollama Server (if not already running) ---
if (-not (Get-Process -Name ollama -ErrorAction SilentlyContinue)) {
    Start-Process -NoNewWindow $ollamaPath serve
    Start-Sleep -Seconds 8
}

# --- 2. Launch Open Interpreter ---
$oiVenv = "$oiPath\venv\Scripts\activate"
$oiPy = "$oiPath\venv\Scripts\python.exe"
if (Test-Path $oiPy) {
    Start-Process powershell -ArgumentList @(
        "-NoExit",
        "-Command",
        "`$env:OPENAI_API_BASE='http://localhost:11434/v1'; `$env:OPENAI_API_KEY='ollama'; cd `"$oiPath`"; `$venv='$oiVenv'; . `$venv; $oiPy main.py --model ollama/deepseek-r1:70b"
    )
} else {
    Write-Host "Open Interpreter venv/python not found."
}

# --- 3. Launch Agent-S ---
$asVenv = "$asPath\venv\Scripts\activate"
$asPy = "$asPath\venv\Scripts\python.exe"
if (Test-Path $asPy) {
    Start-Process powershell -ArgumentList @(
        "-NoExit",
        "-Command",
        "`$env:LLM_ENDPOINT='http://localhost:11434'; `$env:LLM_MODEL='deepseek-r1:70b'; cd `"$asPath`"; `$venv='$asVenv'; . `$venv; $asPy agent_s.py"
    )
} else {
    Write-Host "Agent-S venv/python not found."
}

# --- 4. Launch OpenHands ---
$ohVenv = "$ohPath\venv\Scripts\activate"
$ohPy = "$ohPath\venv\Scripts\python.exe"
if (Test-Path $ohPy) {
    # Try main.py, cli.py, or app.py in order
    $mainScript = @("main.py", "cli.py", "app.py") | Where-Object { Test-Path "$ohPath\$_" } | Select-Object -First 1
    if ($mainScript) {
        Start-Process powershell -ArgumentList @(
            "-NoExit",
            "-Command",
            "`$env:LLM_ENDPOINT='http://localhost:11434'; `$env:LLM_MODEL='deepseek-r1:70b'; cd `"$ohPath`"; `$venv='$ohVenv'; . `$venv; $ohPy $mainScript"
        )
    } else {
        Write-Host "OpenHands main launch script not found."
    }
} else {
    Write-Host "OpenHands venv/python not found."
}

Write-Host "`nAll agents are launched and connected to Deepseek-R1:70B via Ollama. You can interact with each in their own window!"