$password = ConvertTo-SecureString -String `${password}` -AsPlainText -Force
$credentials = New-Object -typename System.Management.Automation.PSCredential (`${username}`, $password)
Get-PSDrive Y, Z | Remove-PSDrive
New-PSDrive -Name "Y" -Root "\\HD-FS\hdserver2" -PSProvider FileSystem -Credential $credentials -Persist
New-PSDrive -Name "Z" -Root "\\HD-FS\HDServer" -PSProvider FileSystem -Credential $credentials -Persist
