
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2185669'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = '3953CD0CCA5218D9EA8BECE9D56B05A7188D68DB8FE403C6AE60D8E04DB40870'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs