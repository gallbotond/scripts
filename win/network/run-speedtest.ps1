# run speedtest
$job = Start-Job -ScriptBlock {& 'C:\Program Files\ookla-speedtest-1.2.0-win64\speedtest.exe'}

# wait for 2 seconds
Start-Sleep -Seconds 5

$result = Receive-Job -Job $job -Keep

$result