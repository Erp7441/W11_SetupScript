function Start-Script
{
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)] [ValidateNotNullOrEmpty()] [System.IO.FileSystemInfo] $File
    )
    
    switch ($File.Extension)
    {
        '.ps1' { . $File.FullName }
        Default {}

        # TODO:: Add more script types (maybe a manifest file which specifies interpreter e.g powershell, python, etc... and files to run with parameters)
    }

}

do
{
    $Configuration = Get-Content "$PSScriptRoot\.config.json" | ConvertFrom-Json
    $ExecuteScripts = Get-ChildItem -Path "$PSScriptRoot\Scripts" | Where-Object { $_.Name -in $Configuration.EnabledScripts }
    $ExecuteScripts | ForEach-Object { Start-Script -File $_ -ErrorAction Continue }
    Start-Sleep -Seconds $Configuration.Loop.Delay
} while ($Configuration.Loop.Enabled)