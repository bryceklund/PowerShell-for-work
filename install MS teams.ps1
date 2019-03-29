$url = "https://teams.microsoft.com/downloads/desktopcontextualinstaller?env=production&plat=windows&arch=&download=true"
New-Item -Force -Path "C:\LT\Teams" -ItemType Directory
$path = "C:\LT\Teams\Teams_windows.exe"
(New-Object System.Net.WebClient).DownloadFile($url, $path)
Set-Location -Path "C:\LT\Teams"
Start-Process -FilePath "C:\LT\Teams\Teams_windows.exe" -ArgumentList "-s"
