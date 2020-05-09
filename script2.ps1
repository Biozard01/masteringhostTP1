# LAFOREST Arthur
# Fait le 05/04/2020
# Se script permet, en fonction d'arguments que vous lui passés :  d'exécuter une action, de lock l'écran et d'éteindre le PC après 5 secondes 

Start-Sleep -s 10
rundll32.exe user32.dll, LockWorkStation
Stop-Computer
