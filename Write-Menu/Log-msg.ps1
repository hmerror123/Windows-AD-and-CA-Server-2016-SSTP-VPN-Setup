Function Log-msg {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [ValidateSet('Func', 'Pass', 'Fail', 'Info', 'Input')]
        [string]$header,
        [string]$line
    )

    begin {
        $FUNC = {Write-host "[" -NoNewline ; Write-Host "FUNC" -NoNewline -ForegroundColor Cyan ; Write-host "] => " -NoNewline}
        $PASS_MSG = {Write-host "[" -NoNewline; Write-Host "PASS" -NoNewline -ForegroundColor Green; Write-host "] => " -NoNewline}
        $FAIL_MSG = {Write-host "[" -NoNewline; Write-Host "FAIL" -NoNewline -ForegroundColor Red; Write-host "] => " -NoNewline}
        $INFO = {Write-host "[" -NoNewline; Write-Host "INFO" -NoNewline -ForegroundColor Gray; Write-host "] => " -NoNewline}
        $USER_INPUT = {Write-host "[" -NoNewline; Write-Host "INPUT" -NoNewline -ForegroundColor Yellow; Write-host "] => " -NoNewline}
        $PRINTLINE = {Write-host "=============================================================="}
    }
    
    process {
        switch ($header) {
            "Func" {
                $output_message = {&$PRINTLINE ; & $FUNC; Write-host $line -ForegroundColor Cyan}
            }
            "Pass" {
                $output_message = {&$PASS_MSG; Write-host $line}
            }
            "Fail" {
                $output_message = {&$FAIL_MSG; Write-host $line; $global:Error_log += $line}
            }
            "Info" {
                $output_message = {&$INFO; Write-host $line}
            }
            "Input" {
                $output_message = {&$USER_INPUT }
            }
            Default {}
        }
    }
    end {
        & $output_message
    }
}