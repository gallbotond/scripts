# List network adapters
$wifiAdapter = Get-NetAdapter -Name "Wi-Fi"

# Check if the Wi-Fi adapter is found
if ($wifiAdapter) {
    # Enable Wi-Fi adapter
    Enable-NetAdapter -Name "Wi-Fi"

    # Provide feedback
    Write-Host "Wi-Fi adapter has been enabled."
} else {
    # Provide feedback if Wi-Fi adapter is not found
    Write-Host "Wi-Fi adapter not found. Please check your network adapters."
}

# Use netsh to show available Wi-Fi networks
netsh wlan show networks

# Get a list of available Wi-Fi networks
$wifiNetworks = Get-WmiObject -Namespace "root\wmi" -Class MSNdis_80211_BSSIList
foreach ($network in $wifiNetworks) {
    $ssid = [System.Text.Encoding]::ASCII.GetString($network.Ndis80211SsId)
    Write-Host "SSID: $ssid"
}

# Replace "YourWiFiName" with the name of the Wi-Fi network you want to connect to
$wifiName = "DIGI_019348"

# Connect to the specified Wi-Fi network
netsh wlan connect name="$wifiName"
