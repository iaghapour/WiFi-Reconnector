@echo off
:: FINAL, SIMPLIFIED, AND RELIABLE VERSION

:: --- Settings ---
set "WIFI_NAME=Home"
set "PING_TARGET=192.168.20.1"
set "CHECK_INTERVAL=5"
set "LOG_FILE=%~dp0..\wifi_log.txt"
set "WORKER_TITLE=WifiAutoReconnect_Worker_Process"

title %WORKER_TITLE%
echo %date% %time% - Worker process started. >> "%LOG_FILE%"

:loop
    ping -n 1 %PING_TARGET% > nul

    if %errorlevel% equ 0 (
        :: --- Connection is OK ---
        :: Wait for the normal interval and check again.
        timeout /t %CHECK_INTERVAL% /nobreak > nul
        goto :loop
    ) else (
        :: --- Connection is LOST ---
        :: Log the event and immediately try to reconnect. No more checks.
        echo %date% %time% - Connection lost. Attempting to reconnect to "%WIFI_NAME%"... >> "%LOG_FILE%"
        netsh wlan connect name="%WIFI_NAME%"
        :: Wait for the normal interval before checking again.
        timeout /t %CHECK_INTERVAL% /nobreak > nul
        goto :loop
    )
