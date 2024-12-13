Import-Module "$PSScriptRoot\..\Utils\Registry.psm1"

$AllowlistPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist"
$BlocklistPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist"

Clear-RegistryEntries -Path $AllowlistPath
New-RegistryKey -Path $AllowlistPath -Name "1" -Value "*" -Type "string"

Clear-RegistryEntries -Path $BlocklistPath