
$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://cdn.propellerheads.se/Reason10/Reason_1040_d4.zip' 
$downloadedZip = Join-Path $toolsDir 'Reason_1040_d4.zip'
$fileLocation = Join-Path $toolsDir 'Install Reason 10.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = $downloadedZip
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url  
  softwareName  = 'Reason' 
  checksum      = 'D2619016AFD7901E3931ECDF98C0D376E76B4FCCE516962B34E67CD87483AC37'
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

