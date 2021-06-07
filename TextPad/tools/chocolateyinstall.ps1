
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v88/win32/txpeng880-32.zip'
$url64      = 'https://www.textpad.com/file?path=v88/x64/txpeng880-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = 'DCB8076C8BA1F94C1773BA10A398CE8B2ED3E7807F1E794F32F61A59A1511F69'
  checksumType  = 'sha256'
  checksum64    = 'CB1CC6C13A5D1479A3A02F3E0ACAE663FE931E1073440DA2777778007BEA7B55'
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
