param (
    [string]$jsonFilePath
)

# Check if the JSON file path is provided
if (-not $jsonFilePath) {
    Write-Host "Please provide the path to the JSON file." -ForegroundColor Red
    exit 1
}

# Check if the provided file exists
if (-not (Test-Path $jsonFilePath)) {
    Write-Host "The specified file does not exist: $jsonFilePath" -ForegroundColor Red
    exit 1
}

# Read and convert the JSON file
$json = Get-Content -Path $jsonFilePath | ConvertFrom-Json

# Iterate through the sources and packages
foreach ($source in $json.Sources) {
    foreach ($package in $source.Packages) {
        $packageIdentifier = $package.PackageIdentifier
        $result = winget show $packageIdentifier -s $source.SourceDetails.Identifier

        if ($result -match "requires admin") {
            Start-Process winget -ArgumentList "install $packageIdentifier --accept-source-agreements --accept-package-agreements" -Verb RunAs
        } else {
            winget install $packageIdentifier --accept-source-agreements --accept-package-agreements
        }
    }
}
