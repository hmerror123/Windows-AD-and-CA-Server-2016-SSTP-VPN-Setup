#Invoke writeMenu.ps1 function
Invoke-Expression $($(get-content -Path ".\Run\writeMenu.ps1") | Out-String)
Function Menu_Tools(){
    $ls_bat = ls -Path ".\Run\"| Where-Object {$_.Name -like "*.bat"}
    $ls_bat_name = $ls_bat.Name
    $ls_name = @()
    $MainMenu = @{}
    foreach ($name in $ls_bat_name){
        $ls_name  += $name.substring(0,$name.length - 4)
    }
    foreach($name in $ls_name){
        $script = 'start powershell "IEX $($(get-content -Path '+'.\Run\'+$name+'.ps1'+') | Out-String)"'
        $MainMenu.Add("$name", $script)
    }

    $menuReturn = Write-Menu -Title $Title -Entries $MainMenu -Sort -MainMenu
    Write-Host $menuReturn
}

while ($true) {
    Menu_Tools
}

