
$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://a.phcdn.se/update/Stable/Reason_1135_d22-Stable-142-Win.zip' 
$downloadedZip = Join-Path $toolsDir 'Reason_1135_d22-Stable-142-Win.zip'
$fileLocation = Join-Path $toolsDir 'Install Reason 11.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = $downloadedZip
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url  
  softwareName  = 'Reason' 
  checksum      = '631B872766B7A5C6BC41EF530B2764AE30179334D345290A5EA3C878AA870981'
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

