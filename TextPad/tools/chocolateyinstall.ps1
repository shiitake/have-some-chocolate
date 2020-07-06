
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v84/win32/txpeng841-32.zip'
$url64      = 'https://www.textpad.com/file?path=v84/x64/txpeng841-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = '38FD4DD81AD5E8CD0752F222E9CBBA58D9F3F429628F66EDB986E53A8742EA4B'
  checksumType  = 'sha256'
  checksum64    = '66CDD78E795780922695DCE84BE8F3FF1B6F8AC98C48826CD3AF4CA68DCE2D48'
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










