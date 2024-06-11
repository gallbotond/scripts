

# Save the available wifi networks to a variable
$networks = netsh wlan show networks mode=Bssid | 
ForEach-Object {
    # $name = $ssid = $auth = $signal = ""
    if ($_ -match "SSID\s\d+\s:\s([a-zA-Z]+\d+)") { $name = $matches[1] }
    if ($_ -match "BSSID\s+\d+\s+:\s+(.*)") { $ssid = $matches[1] }
    if ($_ -match "Authentication\s+:\s+(.*)") { $auth = $matches[1] }
    if ($_ -match "Signal\s+:\s+(.*)") { $signal = $matches[1] }
    if ($_ -match "^\s*$" -and $auth -eq "Open") { [PSCustomObject]@{name = $name; SSID = $ssid; Authentication = $auth; Signal = $signal } }
}

# remove duplicates
$networks = $networks | Sort-Object -Property SSID -Unique

# convert the signal strength to a number
$networks | ForEach-Object { $_.Signal = [int]($_.Signal -replace "%", "") }

# Sort the networks by signal strength
$networks = $networks | Sort-Object -Property Signal -Descending

# Display the details of the open networks
$networks

# start the log
Start-Transcript -Path "C:\Users\Administrator\Documents\scripts\log.txt"

# iterate over the networks
foreach ($network in $networks) {
    # Connect to the selected network
    $connectionResult = netsh wlan connect name="$($network.name)" interface="Wi-Fi"
        
    # Check if the connection was successful
    if ($connectionResult -match "Connection request was completed successfully.") {
        Write-Output "Successfully connected to $($network.name)"

        # Ping google.com
        $pingResult = Test-Connection -ComputerName "google.com" -Count 4 -Quiet

        # Check if the ping was 50% successful
        if ($pingResult -ge 2) {
            Write-Output "Ping to google.com was 50% successful or more"
            break
        }
        else {
            Write-Output "Ping to google.com was less than 50% successful"
        }

    }
    # else {
    #     Write-Output "Failed to connect to $($network.name)"
    # }
}

Stop-Transcript