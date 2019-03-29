
#if (((Get-WmiObject win32_operatingsystem).name | Out-String).contains("7") -eq False) {   #####RIP THIS IT WAS SO DOPE LOL

$dns = (Get-WmiObject -Query "SELECT DNSServerSearchOrder FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled=True" | Format-List DNSServerSearchOrder | Out-String).Trim()
$justdns = ($dns.replace("DNSServerSearchOrder : ", "")).Trim("{}")
$justdns

#} Else {

#}