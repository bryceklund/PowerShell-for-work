$url = "https://www.nirsoft.net/utils/produkey.zip"
$output = New-Item -Force -Path "C:\LT" -ItemType Directory
Start-BitsTransfer -Source $url -Destination $output
Expand-Archive -Path "C:\LT\produkey.zip" -DestinationPath "C:\LT" -Force
Set-Location C:\LT
Start-Process -FilePath "produkey.exe" -ArgumentList "/scomma keys.csv"
findstr.exe /r "Windo" keys.csv > adobekey.$env:COMPUTERNAME.txt
$EDF = (Get-Content -Path "C:\LT\adobekey.$env:COMPUTERNAME.txt").trim()
$EDF