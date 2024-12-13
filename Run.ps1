while ($True)
{
    [String[]] $IncludeScripts = Get-Content "$PSScriptRoot\.EnabledScripts"
    $ExecuteScripts = Get-ChildItem -Path "$PSScriptRoot\Scripts" | Where-Object { $_.BaseName -in $IncludeScripts }
    $ExecuteScripts.FullName | ForEach-Object { . $_ }
    Start-Sleep -Seconds 10
}