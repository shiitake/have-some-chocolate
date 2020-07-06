
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2134310'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = '32B00C5F8A6E7F8D9422DC04AC6456AB3CE70C9231E9382431CFF6829E3C7EBF'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs