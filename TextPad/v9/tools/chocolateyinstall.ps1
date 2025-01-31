
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://www.textpad.com/file?path=v9/TextPadSetupV9-x64.exe'
$fileLocation = Join-Path $toolsDir 'TextPadSetupV9-x64.exe'

# handle validation and download file
$webSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession 
$initialResponse = Invoke-WebRequest -Uri $url64 -WebSession $webSession

$token = ""
$start = ""
$filename = ""
$hashval = ""
$promptword = ""
$wordhash = ""


if ($initialResponse.Content -match 'name="_token" value="([^"]+)"') {
    $token = $matches[1]
}
if ($initialResponse.Content -match 'name="start" value="([^"]+)"') {
    $start = $matches[1]
}
if ($initialResponse.Content -match 'name="filename" value="([^"]+)"') {
    $filename = $matches[1]
}
if ($initialResponse.Content -match 'name="hashval" value="([^"]+)"') {
    $hashval = $matches[1]
}
if ($initialResponse.Content -match 'name="promptword" value="([^"]+)"') {
    $promptword = $matches[1]
}
if ($initialResponse.Content -match 'name="wordhash" value="([^"]+)"') {
    $wordhash = $matches[1]
}

# Remove vowels including accented variants
$answer = -join ($promptword -split "[aeiouAEIOU\u00E1\u00E9\u00ED\u00F3\u00FA\u00C1\u00C9\u00CD\u00D3\u00DA\u00E0\u00E8\u00EC\u00F2\u00F9\u00C0\u00C8\u00CC\u00D2\u00D9\u00E2\u00EA\u00EE\u00F4\u00FB\u00C2\u00CA\u00CE\u00D4\u00DB\u00E4\u00EB\u00EF\u00F6\u00FC\u00C4\u00CB\u00CF\u00D6\u00DC\u00E3\u00F5\u00C3\u00D5]")


$formData = @{
    "_token"     = $token
    "start"      = $start
    "filename"   = $filename
    "hashval"    = $hashval
    "promptword" = $promptword
    "wordhash"   = $wordhash
    $promptword  = $answer  # Answer without vowels
}

$downloadUrl = "https://www.textpad.com/validatedownloader"

# Pause for 10 seconds to avoid rate limiting
Write-Host "Pausing to avoid rate limit."
Start-Sleep -Seconds 10

$response = Invoke-WebRequest -Uri $downloadUrl -Method Post -Body $formData -OutFile $fileLocation -WebSession $webSession

$checkSumArgs = @{
  file = $fileLocation
  checksum = 'FE3CC48DC3537467444E4F025B6CC241351C4D32F9D483AE2611863D94A503BA'
  checksumType = 'sha256'
}

Get-ChecksumValid @checkSumArgs

$installerArgs  = @{
  packageName   = $packageName
  silentArgs    = '/exenoui /qn"" /norestart'
  file          = $fileLocation
  fileType      = 'exe'
}

Install-ChocolateyInstallPackage @installerArgs
