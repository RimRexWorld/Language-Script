# Script to define regional settings on Azure Virtual Machines deployed from the market place

######################################33

Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

#variables
$regionalsettingsURL = "https://raw.githubusercontent.com/RimRexWorld/Language-Script/main/ch-Region.xml"
$RegionalSettings = "C:\CH-Region.xml"


#downdload regional settings file
Write-Host "Language File wird heruntergeladen"
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
Write-Host "Language Default Configuration"
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
Write-Host "Language Settings"
Set-WinSystemLocale de-CH
Set-WinUserLanguageList -LanguageList de-CH -Force
Set-Culture -CultureInfo de-CH
Set-WinHomeLocation -GeoId 223
Set-TimeZone -Name "W. Europe Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 40
Restart-Computer
