@echo off
echo Searching for the Wifi Monitor process...
taskkill /F /FI "WINDOWTITLE eq WifiAutoReconnect_Worker_Process"
echo.
echo The monitor has been stopped.
pause