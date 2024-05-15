
$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn.reasonstudios.com/update/Stable/Reason_1274_d3-Stable-820-Win.zip' 
$downloadedZip = Join-Path $toolsDir 'Reason_1274_d3-Stable-820-Win.zip'
$fileLocation = Join-Path $toolsDir 'Install Reason 12.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = $downloadedZip
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url  
  softwareName  = 'Reason' 
  checksum      = 'AD70D9451D077B13B5B532591F659790C261B3F9DC6894D338CC3302C7E0D203'
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

