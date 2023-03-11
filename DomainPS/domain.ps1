# whois64.exe turi buti toje pacioje direktorijoje kaip ir domain.ps1
$domain = Read-Host "Enter domain name"
.\whois64.exe $domain | Select-String -Pattern "Creation Date" | Select-object -First 1 | Out-File -FilePath .\domain.txt
