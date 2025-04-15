@echo off
echo YEU CAU QUYEN ADMIN...
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Vui long chay file voi quyen Administrator!
    pause
    exit /b
)

echo Dang tat Windows Defender...

:: Tat bao ve thoi gian thuc
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Tat qua registry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f

:: Tat dich vu Defender (co the khong thanh cong tren ban Windows moi)
sc stop WinDefend
sc config WinDefend start= disabled

echo Hoan thanh. Co the can khoi dong lai may de thay doi co hieu luc.
pause
