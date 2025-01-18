$winget_installs_file_path = "./winget_installs.txt"
$winget_installs = Get-Content -Path $winget_installs_file_path

foreach ($package in $winget_installs) {
    Write-Host "😶‍🌫️[CURTAINS][WINGET][INSTALL] $package"
    winget install $package --accept-source-agreements --accept-package-agreements --disable-interactivity
}

$winget_uninstalls_file_path = "./winget_uninstalls.txt"
$winget_uninstalls = Get-Content -Path $winget_uninstalls_file_path

foreach ($package in $winget_uninstalls) {
    Write-Host "😶‍🌫️[CURTAINS][WINGET][UNINSTALL] $package"
    winget uninstall $package --disable-interactivity
}

reg import "AlignTaskbarLeft.reg"
reg import "HideSearchBar.reg"

$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$shortcuts = Get-ChildItem -Path $desktopPath -Filter "*.lnk"
foreach ($shortcut in $shortcuts) {
    Remove-Item -Path $shortcut.FullName -Force
}
Write-Host "All shortcuts have been removed from the desktop."

$desktopPath = "C:\Users\Public\Desktop"
$shortcuts = Get-ChildItem -Path $desktopPath -Filter "*.lnk"
foreach ($shortcut in $shortcuts) {
    del $shortcut.FullName
}
Write-Host "All shortcuts have been removed from the public desktop."

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0
Write-Host -f Yellow "Dark theme enabled.`n"

$path="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
Set-ItemProperty -Path $path -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value 0
Set-ItemProperty -Path $path -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Value 0

wsl --install