
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v812/win32/txpeng8120-32.zip'
$url64      = 'https://www.textpad.com/file?path=v812/x64/txpeng8120-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = 'A73FB5D1A6DAFE8EF24810819C9CDF661A08FEA97BF5B197AD3354ACE246E1B1'
  checksumType  = 'sha256'
  checksum64    = '872ED448E9109AFC2A1A4C07D899367CA35633E6ED25BC016FF3C441E0F17A44'
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
