
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/download/v84/win32/txpeng840-32.zip'
$url64      = 'https://www.textpad.com/download/v84/x64/txpeng840-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = '7E46B5920EA6C0BE894EB1F9FD64AADB50D0B864C7370921E9716FDDFCCE4453'
  checksumType  = 'sha256'
  checksum64    = 'C09856DEC207EDF2025915FF15D5EB85A1F8DC4F0EBF8B100CF03C93A155872C'
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










