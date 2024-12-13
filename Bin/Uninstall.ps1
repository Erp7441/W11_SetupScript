#Requires -RunAsAdministrator

try
{
    $Configuration = Get-Content "$PSScriptRoot\..\Configs\.install.json" -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
    Stop-ScheduledTask -TaskName $Configuration.Task.Name -TaskPath $Configuration.Task.Path -ErrorAction Stop | Out-Null
    Unregister-ScheduledTask -TaskName $Configuration.Task.Name -TaskPath $Configuration.Task.Path -ErrorAction Stop -Confirm:$false | Out-Null
}
catch
{
    Write-Host "Failed removing task `"$($Configuration.Task.Path)$($Configuration.Task.Name)`"`n$_" -ForegroundColor Red
    exit
}

Write-Host "SUCCESS: Task `"$($Configuration.Task.Path)$($Configuration.Task.Name)`" removed!" -ForegroundColor Green
Write-Host "SUCCESS: Script uninstalled !!!" -ForegroundColor Green