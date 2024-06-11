# Ping google.com
$pingResult = Test-Connection -ComputerName "google.com" -Count 4 -Quiet

# Check if the ping was 50% successful
if ($pingResult -ge 2) {
    Write-Output "Ping to google.com was 50% successful or more"
    break
}
else {
    Write-Output "Ping to google.com was less than 50% successful"
    
    # call the network-manager.ps1 script
    & '.\network-manager.ps1'
}