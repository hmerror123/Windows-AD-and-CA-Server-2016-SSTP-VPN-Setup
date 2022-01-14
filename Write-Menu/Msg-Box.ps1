Function Msg-Box {
    Param(
        $MessageBody,
        $MessageTitle,
        $MessageSelect,
        $MessageIcon

    )
    
    Add-Type -AssemblyName System.Windows.Forms
    [void] [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") 
    [Microsoft.VisualBasic.Interaction]::MsgBox($MessageBody, "$MessageSelect,SystemModal,$MessageIcon,DefaultButton2", $MessageTitle)
}
