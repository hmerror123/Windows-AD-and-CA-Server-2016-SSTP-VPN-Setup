set NetPath=%~dp0
set filename=%~n0

start powershell "Set-Location '%NetPath%';IEX $($(get-content -Path '%NetPath%\%filename%.ps1') | Out-String)"

exit