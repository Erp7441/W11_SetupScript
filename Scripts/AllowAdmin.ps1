$AdminAccount = Get-LocalUser -Name "Administrator"
if ($AdminAccount.Enabled -eq $false)
{
    Enable-LocalUser -Name "Administrator" -ErrorAction Continue
}