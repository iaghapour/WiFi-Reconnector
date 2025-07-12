@echo off
echo Starting the Wifi Monitor in the background...

:: The target script is inside the "Do_not_run" sub-folder
set "TARGET_SCRIPT=%~dp0Do_not_run\Wifi-Auto-Reconnect.bat"

:: --- New, reliable method using PowerShell ---
:: This command starts the target script in a new, completely hidden window.
powershell -Command "Start-Process -FilePath '%TARGET_SCRIPT%' -WindowStyle Hidden"

echo.
echo Done. The monitor should now be running in the background.
echo Check wifi_log.txt for activity.
timeout /t 4