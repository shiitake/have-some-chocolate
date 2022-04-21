
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v811/win32/txpeng8110-32.zip'
$url64      = 'https://www.textpad.com/file?path=v811/x64/txpeng8110-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = '5720E6B6E89D45C0A4DD7D32B8AB3E56E21C641656B734AA9041825807E0C523'
  checksumType  = 'sha256'
  checksum64    = '23D8CA9BEE3EBD9EFA2083056BAC95364791ACF33B29E8773C9B1F12AB14A872'
  checksumType64= 'sha256'
}

Get-ChocolateyWebFile @packageArgs


Get-ChocolateyUnzip -FileFullPath $downloadedZip -Destination $toolsDir

$installerArgs  = @{
  packageName   = $packageName
  silentArgs    = '/S /v""/qn""'
  file          = $fileLocation
  fileType      = 'exe'
}

Install-ChocolateyInstallPackage @installerArgs
