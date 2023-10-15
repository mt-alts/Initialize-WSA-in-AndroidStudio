$wsa = "WsaClient.exe"
$command = "adb connect 127.0.0.1:58526"

if ((Get-Command -Name $wsa -ErrorAction SilentlyContinue)) {
    Write-Host "Please wait initializing Windows Subsystem for Android™..."
    start WsaClient.exe "/launch wsa://com.android.system"
    Write-Host "Waiting for ADB..."
    do {
            $output = Invoke-Expression -Command $command 2>&1
            if ($output -match "cannot connect") {
                Write-Host "Error:$output"
                Start-Sleep -Seconds 5
            }
    } while ($output -match "cannot connect")

    Write-Host "adb:$output"
} else {
    Write-Host "Unable to start Subsystem for Android™. Make sure Subsystem for Android™ is installed."
}
