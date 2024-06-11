Disable-NetAdapter -Name "Ethernet" -Confirm:$false
& 'C:\Program Files (x86)\ForceBindIP\ForceBindIP64.exe' -i '{8048A100-02E2-40EF-A348-88FC14A70A20}' 'C:\Program Files\LibreWolf\librewolf.exe'
Start-Sleep -Seconds 15
Enable-NetAdapter -Name "Ethernet" -Confirm:$false
exit