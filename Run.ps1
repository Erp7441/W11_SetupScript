while ($True)
{
    Get-ChildItem -Path "$PSScriptRoot\Scripts" -Exclude $MyInvocation.MyCommand.Name | Select-Object -Expand FullName | ForEach-Object { . $_ }
    Start-Sleep -Seconds 10
}