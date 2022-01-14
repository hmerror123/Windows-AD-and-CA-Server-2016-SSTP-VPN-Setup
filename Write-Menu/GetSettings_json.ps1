$Path = "C:\Users\HM\Desktop\Powershell_Script\settings.json"

$settings = Get-Content -Path $Path | ConvertFrom-Json
