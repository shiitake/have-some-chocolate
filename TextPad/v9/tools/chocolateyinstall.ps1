
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://www.textpad.com/file?path=v9/setupv9.exe'
$fileLocation = Join-Path $toolsDir 'setupv9.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $fileLocation
  url64bit      = $url64
  checksum64    = 'E1BD112F6112BF719DD89A5E425D21BB133C70C365C2AA6D52870A61793A8BD9'
  checksumType64= 'sha256'
}

Get-ChocolateyWebFile @packageArgs


$installerArgs  = @{
  packageName   = $packageName
  silentArgs    = '/S /v""/qn""'
  file          = $fileLocation
  fileType      = 'exe'
}

Install-ChocolateyInstallPackage @installerArgs
