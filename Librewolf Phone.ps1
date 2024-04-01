Disable-NetAdapter -Name "Ethernet" -Confirm:$false
& 'C:\Program Files (x86)\ForceBindIP\ForceBindIP64.exe' -i '{BEA43D1A-1ADF-4B89-9339-61E2913736B5}' 'C:\Program Files\LibreWolf\librewolf.exe'
Start-Sleep -Seconds 15
Enable-NetAdapter -Name "Ethernet" -Confirm:$false
exit