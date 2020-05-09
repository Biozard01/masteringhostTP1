# LAFOREST Arthur
# Fait le 05/04/2020
# Se script affiche un résumé de votre OS, ils liste les utilisateurs de la machine et calcule / affiche le temps de réponse moyen vers 8.8.8.8 avec des ping

Write-Output "Nom de la machine : $env:COMPUTERNAME" 
Write-Output "Adress IP principal : "
Write-Output "----------------------------------------------------"
Write-Output "OS : $env:OS" 
Write-Output "Version de l'OS : $((Get-CimInstance Win32_OperatingSystem).version)"  
Write-Output "Uptime : $((get-date) - $((gcim Win32_OperatingSystem)).LastBootUpTime)"
Write-Output "Is OS up-to-date : "
Write-Output "----------------------------------------------------"
Write-Output "RAM : " 
Write-Output "Utilisation : "
Write-Output "Espace libre : $(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | Foreach {"{0:N2}" -f ([math]::round(($_.Sum / 1GB),2))})"
Write-Output "----------------------------------------------------"
Write-Output "Espace disque"
Write-Output "Espace disque utilise : "
Get-WmiObject win32_logicaldisk | Format-Table DeviceId, @{n = "Size"; e = { [math]::Round($_.Size / 1GB, 2) } }, @{n = "UsedSpace"; e = { [math]::Round(($_.Size - $_.FreeSpace) / 1GB, 2) } }
Write-Output "Espace disque dispo : "
Get-WmiObject win32_logicaldisk | Format-Table DeviceId, @{n = "Size"; e = { [math]::Round($_.Size / 1GB, 2) } }, @{n = "FreeSpace"; e = { [math]::Round($_.FreeSpace / 1GB, 2) } }
Write-Output "----------------------------------------------------"
Write-Output "Liste des Utilisateur : "
Get-LocalUser | Format-Table
Write-Output "----------------------------------------------------"
ping 8.8.8.8