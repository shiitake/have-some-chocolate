
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v85/win32/txpeng850-32.zip'
$url64      = 'https://www.textpad.com/file?path=v85/x64/txpeng850-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = '378AD3E366760C3B1C16B370C28BB14B9535D49E0EBF5385B9F1A61BA3DD3278'
  checksumType  = 'sha256'
  checksum64    = '9494F3746CA1CF0A98C2CD6E75D0B181FDA41ED9400C7B75BBB2F9C3A1BC5822'
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
