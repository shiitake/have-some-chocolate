
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2215400'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = 'BBD13A153735FE62C49D74F1753A7AACF8C1751DB0F1F6407063A8C517973FC9'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
