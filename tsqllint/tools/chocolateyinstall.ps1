﻿$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'tsqllint'
$url        = 'https://github.com/tsqllint/tsqllint/releases/download/1.16.0/win-x86.tgz'
$url64      = 'https://github.com/tsqllint/tsqllint/releases/download/1.16.0/win-x64.tgz'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url           = $url
  url64bit      = $url64
  softwareName  = $softwareName
  checksum      = 'CE33643BAB334B6119451C4E63E05DA8851E49FD5CA4B80880910F13C43468F7'
  checksumType  = 'sha256'  
  checksum64    = 'F5504C98C7132B5F9CD851CDA7A68C41529310330C17B31AF7A282AF54073A6C' 
  checksumType64= 'sha256'
}

# this will uncompress the tgz to a tar file and copy it to the tool directory
# run the following command to do this manually
# 'C:\ProgramData\chocolatey\tools\7z.exe' x -aoa -bd -bb1 -y "win-x86.tgz"
Install-ChocolateyZipPackage @packageArgs

# unzip the tar files
$64bitFile = 'win-x64'
$32bitFile = 'win-x86'

if (Test-Path -Path "$toolsDir\$64bitFile.tar" -PathType Leaf)
{   
  Get-ChocolateyUnzip -FileFullPath "$toolsDir\$64bitFile.tar" -Destination $toolsDir
  Install-BinFile -Name $softwareName -Path "$toolsDir\$64bitFile\$softwareName.Console.exe"
} 
elseif (Test-Path -Path "$toolsDir\$32bitFile.tar" -PathType Leaf) 
{
    Get-ChocolateyUnzip -FileFullPath "$toolsDir\$32bitFile.tar" -Destination $toolsDir
    Install-BinFile -Name $softwareName -Path "$toolsDir\$32bitFile\$softwareName.Console.exe"
}
