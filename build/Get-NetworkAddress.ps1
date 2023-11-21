# Use a service to get the public IP address of the current network
$clientIpAddress = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" | Select-Object -ExpandProperty ip
Write-Output $clientIpAddress