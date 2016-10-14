
$ErrorActionPreference = 'Stop';

# 1. Install Report Viewer

# Report Viewer 2008 SP1
$rpt2008PackageName= 'ReportViewer2008SP1'
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$rpt2008Url        = 'https://download.microsoft.com/download/3/a/e/3aeb7a63-ade6-48c2-9b6a-d3b6bed17fe9/ReportViewer.exe'

$rpt2008Args = @{
  packageName   = $rpt2008PackageName
  fileType      = 'exe'
  url           = $rpt2008Url  
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'ReportViewer2008SP1*'
  checksum      = 'D41E9D9F3D2803BFADA3C3B0E81EA58A'
  checksumType  = 'sha256'  
}

Install-ChocolateyPackage @rpt2008Args

# Report Viewer 2010
$rpt2010PackageName= 'ReportViewer2010SP1'
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$rpt2010Url        = 'https://download.microsoft.com/download/5/B/9/5B95F704-F7E3-440D-8C68-A88635EA4F87/ReportViewer.exe'

$rpt2010Args = @{
  packageName   = $rpt2010PackageName
  fileType      = 'exe'
  url           = $rpt2010Url  
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'ReportViewer2010SP1*'
  checksum      = 'EAB2F1B12779D9FE047C52C59E16966D'
  checksumType  = 'sha256'  
}

Install-ChocolateyPackage @rpt2010Args

# 2. Install hotfix for Report Viewer2008

$rpt2008HotfixPackageName= 'ReportViewer2008Hotfix'
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$rpt2008HotfixUrl        = 'https://download.microsoft.com/download/0/4/F/04F99ADD-9E02-4C40-838E-76A95BCEFB8B/ReportViewer.exe'

$rpt2008HotfixArgs = @{
  packageName   = $rpt2008HotfixPackageName
  fileType      = 'exe'
  url           = $rpt2008HotfixUrl  
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'ReportViewer2010SP1*'
  checksum      = '77B319C7B49475055AE867A1BCDD351A'
  checksumType  = 'sha256'  
}

Install-ChocolateyPackage @rpt2008HotfixArgs



# 3. install RML Utilites

$rmlPackageName= 'RMLUtilites'
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$rmlUrl        = 'https://download.microsoft.com/download/4/6/a/46a3217e-f523-4cc6-96e9-df73dd0fdd04/RMLSetup_X86.msi'
$rmlUrl64      = 'https://download.microsoft.com/download/0/a/4/0a41538e-2d57-40ff-ae85-ec4459f7cdaa/RMLSetup_AMD64.msi'

$rmlArgs = @{
  packageName   = $rmlPackageName
  fileType      = 'msi'
  url           = $rmlUrl
  url64bit      = $rmlUrl64
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'RMLUtilites*'
  checksum      = '7F3F8B471584A61D95360B53E4F59A32'
  checksumType  = 'sha256'
  checksum64    = 'A4D22724E35E2F4848C3367C514BD019'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @rmlArgs

# install SQL Nexus










