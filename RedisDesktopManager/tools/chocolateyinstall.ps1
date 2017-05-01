
$ErrorActionPreference = 'Stop';


$packageName= 'redis-desktop-manager'
$url64        = 'https://github.com/uglide/RedisDesktopManager/releases/download/0.8.8/redis-desktop-manager-0.8.8.384.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url64bit      = $url64
  silentArgs    = '/S /v""/qn""'
  checksum64    = '3CD608D52BF91991DF25678023AAFC34F1237865863E2E71A050AF78DC520794'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs










