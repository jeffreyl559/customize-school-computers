# Set Combine taskbar buttons - When taskbar is full
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarGlomLevel" -Value 1

# Set Combine taskbar buttons on other taskbars - When taskbar is full
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "MMTaskbarGlomLevel" -Value 1

# Set When using multiple displays, show my taskbar apps on - taskbar where window is open
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name MMTaskbarMode -Value 2

# Set Taskbar alignment to Left (0 = Left, 1 = Center)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0

# Restart Explorer to apply changes
Write-Host "Applying changes by restarting Explorer..." -ForegroundColor Cyan
Stop-Process -Name explorer -Force
Start-Process explorer

# Install Notion
Invoke-WebRequest -Uri "https://www.notion.so/desktop/windows/download" -OutFile "$env:USERPROFILE\Downloads\NotionSetup.exe"
Start-Process "$env:USERPROFILE\Downloads\NotionSetup.exe"

# Install VSCode
winget install --id  Microsoft.VisualStudioCode -e --accept-package-agreements --accept-source-agreements

# Install Python 3.13.7
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.13.7/python-3.13.7-amd64.exe" -OutFile "$env:TEMP\python-latest.exe"; Start-Process "$env:TEMP\python-latest.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 Include_test=0" -Wait

