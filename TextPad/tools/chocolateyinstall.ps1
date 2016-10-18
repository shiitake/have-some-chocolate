
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://textpad.com/download/v80/win32/txpeng802-32.zip'
$url64      = 'http://textpad.com/download/v80/x64/txpeng802-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'


$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip   
  url           = $url
  url64bit      = $url64
  checksum      = '448AB57625EA1B04911DFAACEC86DFBA'
  checksumType  = 'md5'
  checksum64    = 'F9471BD53B2987267F45AD5768B4E2BC'
  checksumType64= 'md5'  
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










