
$ErrorActionPreference = 'Stop';


$packageName= 'TextPad'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.textpad.com/file?path=v816/win32/txpeng8160-32.zip'
$url64      = 'https://www.textpad.com/file?path=v816/x64/txpeng8160-64.zip'
$downloadedZip = Join-Path $toolsDir 'textpad.zip'
$fileLocation = Join-Path $toolsDir 'setup.exe'

$packageArgs = @{
  packageName   = $packageName
  filefullpath  = $downloadedZip
  url           = $url
  url64bit      = $url64
  checksum      = 'A8E1E552A75568F488B7ADDC5A88ED9DACD8A5EE7DAA241CBA6702D8513E3E87'
  checksumType  = 'sha256'
  checksum64    = '41228215F1D0BF305C2B92FC2AF19ED7C48852CFF546018638EC76088BF27639'
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
