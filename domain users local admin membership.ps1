#Checks the local group "Administrators" to see if the stock domain OU "Domain Users" is a member. Returns a boolean value.

#next steps
#import to automate
#add EDF
#link script output to EDF
#run the damn thing!



try #for a DC + FS
{
$domain = Get-ADDomain -current localcomputer | Format-List name | Out-String | % Trim #get domain name as string 
$domain = $domain.replace(".local", "")
$domainusers = "Domain Users" #value to check for
$userlist = net localgroup administrators #get userlist
$result = $userlist -contains $domainusers #return boolean 
}

catch #for an FS
{
$domain = (Get-WmiObject Win32_ComputerSystem).Domain | Out-String | % Trim 
$domain = $domain.replace(".local", "")
$domainusers = $domain + "\Domain Users" #value to check for
$userlist = net localgroup administrators #get userlist
$result = $userlist -contains $domainusers #return boolean 
}

$result | Out-File -filepath "c:\users\$env:username\desktop\domain users local admin membership.txt"