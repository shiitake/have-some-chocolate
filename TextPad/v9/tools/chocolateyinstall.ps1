
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://www.textpad.com/file?path=v9/setupv9.exe'
$fileLocation = Join-Path $toolsDir 'setupv9.exe'

# handle validation and download file
$webSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession 
$parsedHtml = Invoke-WebRequest -Uri $url64 -WebSession $webSession

$inputNames = @("_token", "start", "filename", "hashval", "promptword", "wordhash")

$formData = @{}

foreach ($inputField in $parsedHtml.InputFields) {
    if ($inputNames -contains $inputField.name) {        
        $formData[$inputField.name] = $inputField.value
    }
}

$promptWord = $formData["promptword"]
$promptWordSolution = $promptword -replace "[aeiouAEIOU]", ""
$formData[$promptWord] = $promptWordSolution

$downloadUrl = "https://www.textpad.com/validatedownloader"
$headers = @{
  "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8"
    "Content-Type" = "application/x-www-form-urlencoded"
    "Cache-Control" = "max-age=0"
}

$response = Invoke-WebRequest -Uri $downloadUrl -Method POST -Body $formData -OutFile $fileLocation -WebSession $webSession -Headers $headers

$checkSumArgs = @{
  file = $fileLocation
  checksum = 'B4E241039C118E88BC77460F2AE1B8A77AAB91FD1B73F36901CA79A403E76A54'
  checksumType = 'sha256'
}

Get-ChecksumValid @checkSumArgs

$installerArgs  = @{
  packageName   = $packageName
  silentArgs    = '/S /v""/qn""'
  file          = $fileLocation
  fileType      = 'exe'
}

Install-ChocolateyInstallPackage @installerArgs
