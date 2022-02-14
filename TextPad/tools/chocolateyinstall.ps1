
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v810/win32/txpeng8100-32.zip'
$url64      = 'https://www.textpad.com/file?path=v810/x64/txpeng8100-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = '76A8743FB9339788FC94ADD828B94F3F3206C252F1FE351331DBAA4B6AC64B33'
  checksumType  = 'sha256'
  checksum64    = '57B642DADC8E14C6D3F4822BA7E78D5A3D6D7DDDB50647805B2E25156CD52D44'
  checksumType64= 'sha256'
}

Get-ChocolateyWebFile @packageArgs


Get-ChocolateyUnzip -FileFullPath $downloadedZip -Destination $toolsDir

$installerArgs  = @{
  packageName   = $packageName
  silentArgs    = '/S /v""/qn""'
  file          = $fileLocation
  fileType      = 'exe'
}

Install-ChocolateyInstallPackage @installerArgs
