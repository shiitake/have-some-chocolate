
$ErrorActionPreference = 'Stop';
$packageName = 'SqlPackage'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://go.microsoft.com/fwlink/?linkid=2128143'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url64bit      = $url64
  softwareName  = 'sqlpackage*'
  checksum64    = '77B671B64C14764F2F26D00449CF8F3412AE6DEE7013768D76BC56FEB68CA16B'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs