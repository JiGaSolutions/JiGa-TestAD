# #############################################################################
# JiGaSolution - SCRIPT - POWERSHELL
# NAME: testAd.ps1
# 
# AUTHOR:  Alberto Bontempi 
# DATE:  29/09/2022
# EMAIL: alberto.bontempi1984@gmail.com
# 
# COMMENT:  Semplice Script per la verifica dell'autenticazione utente Active Directory
#
# VERSION HISTORY
# 1.0 2022.09.29
#
# TO ADD
# -
# #############################################################################




Function Test-ADAuthentication {
    param($username,$password)
    (new-object directoryservices.directoryentry "",$username,$password).psbase.name -ne $null
}


echo "Semplice Script per la verifica dell'autenticazione utente Active Directory" 
$username = $args[0]
Write-Host "User: " $username
$password = $args[1]
Write-Host "Pass: " $password
$result = Test-ADAuthentication $username $password
IF (Compare-Object $result "True")
	{
    	Write-Host "L'utente non si autentica"
	}

ELSE
	{
    	Write-Host "L'utente si è correttamente autenticato in active directory" 
	}
