
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2165212'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = '4CBED999ED26733A9FA55B2307EC4E505EA7094F73CA1591B2233BC017A9699E'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs