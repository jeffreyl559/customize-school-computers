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

Invoke-WebRequest -Uri "https://www.notion.so/desktop/windows/download" -OutFile "$env:USERPROFILE\Downloads\NotionSetup.exe"
Start-Process "$env:USERPROFILE\Downloads\NotionSetup.exe"

winget install --id  Microsoft.VisualStudioCode -e --accept-package-agreements --accept-source-agreements
# winget install --id Python.Python.3 --source winget --silent --accept-package-agreements --accept-source-agreements
