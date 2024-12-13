function New-RegistryKey
{
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)] [String] $Path,
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)] [String] $Name,
        $Value,
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)] [String] $Type
    )

    if (-not (Test-Path $Path))
    {
        New-Item -Path $Path -Force | Out-Null
    }

    New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType $Type -Force -ErrorAction Continue | Out-Null
}

function Clear-RegistryEntries
{
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)] [String] $Path
    )

    if (-not (Test-Path $Path)) { return; }

    $Properties = Get-Item $Path | Select-Object -Expand Property

    $Properties | ForEach-Object {
        Remove-ItemProperty -Path $Path -Name $_ -ErrorAction Continue
    }
}
