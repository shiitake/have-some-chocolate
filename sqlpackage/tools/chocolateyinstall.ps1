
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2261576'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = 'D0C97E192BF7F575CB7A65763B7F70F28135FFE460FB2AAB3CE1F1D9D20066A1'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
