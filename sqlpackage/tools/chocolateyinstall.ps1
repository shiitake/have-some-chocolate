
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2143496'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = '2428ACB6375021DA16B5E08B5C02B6871A695DBC01E81A66F9F5B3F333CD8486'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs