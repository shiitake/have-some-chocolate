
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2165007'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = '37E33BC9668A922AE29AC60AE501F4BC7C2EC20A8882B54917AE388F156CCB82'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs