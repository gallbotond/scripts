# Enable Wi-Fi adapter
$wifiAdapter = Get-NetAdapter | Where-Object { $_.Name -like "*Wi-Fi*" }
if ($wifiAdapter) {
    Enable-NetAdapter -Name $wifiAdapter.Name
    Write-Host "Wi-Fi adapter enabled."
} else {
    Write-Host "Wi-Fi adapter not found."
}

# Get the Wi-Fi adapter
$wifiAdapter = Get-NetAdapter | Where-Object { $_.Name -like "*Wi-Fi*" }

# Check if the Wi-Fi adapter was found
if ($wifiAdapter) {
    # Check the status of the Wi-Fi adapter
    if ($wifiAdapter.Status -eq "Up") {
        Write-Host "Wi-Fi adapter is currently connected."
    } elseif ($wifiAdapter.Status -eq "Disconnected") {
        Write-Host "Wi-Fi adapter is currently disconnected."
    } else {
        Write-Host "Wi-Fi adapter status: $($wifiAdapter.Status)"
    }
} else {
    Write-Host "Wi-Fi adapter not found."
}

# Get the Wi-Fi adapter
$wifiAdapter = Get-NetAdapter | Where-Object { $_.Name -like "*Wi-Fi*" }

# Check if the Wi-Fi adapter was found
if ($wifiAdapter) {
    # Check if the Wi-Fi adapter is enabled
    if ($wifiAdapter.Status -eq "Up") {
        Write-Host "Wi-Fi adapter is enabled."
    } elseif ($wifiAdapter.Status -eq "Disabled") {
        Write-Host "Wi-Fi adapter is disabled."
    } else {
        Write-Host "Wi-Fi adapter status: $($wifiAdapter.Status)"
    }
} else {
    Write-Host "Wi-Fi adapter not found."
}

# Get available Wi-Fi networks using netsh command
$wifiNetworks = netsh wlan show networks | Select-String -Pattern "^SSID"

# Check if any Wi-Fi networks were found
if ($wifiNetworks) {
    # Display available Wi-Fi networks
    Write-Host "Available Wi-Fi networks:"
    $wifiNetworks | ForEach-Object {
        $SSID = $_ -replace '^\s*SSID\s*:\s*', ''
        Write-Host "- $SSID"
    }
} else {
    Write-Host "No Wi-Fi networks found."
}
