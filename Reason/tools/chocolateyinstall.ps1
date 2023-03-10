
$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://a.phcdn.se/update/Stable/Reason_1251_d41-Stable-562-Win.zip' 
$downloadedZip = Join-Path $toolsDir 'Reason_1251_d41-Stable-562-Win.zip'
$fileLocation = Join-Path $toolsDir 'Install Reason 12.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = $downloadedZip
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url  
  softwareName  = 'Reason' 
  checksum      = '3BE911D32F0337A4A0CA6C63F74959671E9E81926A7577AD25972AAF879DEE7B'
  checksumType  = 'sha256'  
  validExitCodes= @(0) 
}

Get-ChocolateyWebFile @packageArgs

Get-ChocolateyUnzip -FileFullPath $downloadedZip -Destination $toolsDir

$installerArgs  = @{
  packageName   = $packageName  
  silentArgs   = '/LANG=en /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  file          = $fileLocation
  fileType      = 'exe'
}

Install-ChocolateyInstallPackage @installerArgs

