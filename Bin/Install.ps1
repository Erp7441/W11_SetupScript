#Requires -RunAsAdministrator

try
{
    $ConfigurationPath = "$PSScriptRoot\..\Configs\.install.json"
    if (-not (Test-Path $ConfigurationPath))
    {
        Copy-Item -Path "$PSScriptRoot\..\Configs\.install.example.json" -Destination "$PSScriptRoot\..\Configs\.install.json" -ErrorAction Stop
    }

    $Configuration = Get-Content $ConfigurationPath -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
    $Task = Get-Content "$PSScriptRoot\$($Configuration.File.Path)\$($Configuration.File.Name)" -Raw -ErrorAction Stop
    $RunFilePath = Resolve-Path -Path "$PSScriptRoot\..\RUN.cmd" -ErrorAction Stop
    $Action = New-ScheduledTaskAction -Execute $RunFilePath

    Register-ScheduledTask -TaskName $Configuration.Task.Name -TaskPath $Configuration.Task.Path -Xml $Task -Force -ErrorAction Stop | Out-Null
    Set-ScheduledTask -TaskName $Configuration.Task.Name -TaskPath $Configuration.Task.Path -Action $Action -ErrorAction Stop | Out-Null
    Start-ScheduledTask -TaskName $Configuration.Task.Name -TaskPath $Configuration.Task.Path -ErrorAction Stop | Out-Null

    if (-not (Test-Path "$PSScriptRoot\..\Configs\.config.json"))
    {
        Copy-Item -Path "$PSScriptRoot\..\Configs\.config.example.json" -Destination "$PSScriptRoot\..\Configs\.config.json" -ErrorAction Stop
    }
}
catch
{
    Write-Host "Failed creating task `"$($Configuration.Task.Path)$($Configuration.Task.Name)`"`n$_" -ForegroundColor Red
    exit
}

Write-Host "SUCCESS: Task `"$($Configuration.Task.Path)$($Configuration.Task.Name)`" created!" -ForegroundColor Green
Write-Host "SUCCESS: Script installed !!!" -ForegroundColor Green