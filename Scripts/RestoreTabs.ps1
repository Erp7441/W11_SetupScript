Import-Module "$PSScriptRoot\..\Utils\Registry.psm1"

# TODO:: Add HKCU:\ ..\edge???
$RecommendedPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended"

New-RegistryKey -Path $RecommendedPath -Name "RestoreOnStartup" -Value 00000001 -Type "DWord"
Clear-RegistryEntries -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge\RestoreOnStartupURLs"
