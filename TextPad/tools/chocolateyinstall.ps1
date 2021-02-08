
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v85/win32/txpeng851-32.zip'
$url64      = 'https://www.textpad.com/file?path=v85/x64/txpeng851-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = 'BEB7B84252D025FE34DEBCDF55528868013DA4B60D4D91785BD2186F83EACFF1'
  checksumType  = 'sha256'
  checksum64    = 'BD5EE4F4B709FE2CC5135F74EE41E9FF0D65DB513D033F1DFEBB53A6E48F52AC'
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
