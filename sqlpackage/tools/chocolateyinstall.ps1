
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2224909'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = 'C542B166CDE0DFFACD0BBA37D5FBD47B8D9496B36C06CABD147E30CD36A0D1EF'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
