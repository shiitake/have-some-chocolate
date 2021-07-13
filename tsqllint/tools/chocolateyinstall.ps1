$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'tsqllint'
$url        = 'https://github.com/tsqllint/tsqllint/releases/download/v1.11.0/win-x86.tgz'
$url64      = 'https://github.com/tsqllint/tsqllint/releases/download/v1.11.0/win-x64.tgz'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url           = $url
  url64bit      = $url64
  softwareName  = $softwareName
  checksum      = '0A3A1B1D06F1E7887CE362DE827FACA05DEE956FFC099DFC401C9FF42C5DD29C'
  checksumType  = 'sha256'  
  checksum64    = 'A1F5C6A8AD75871E7F3E7E2E941FD17E773CA7DCADA6128BF8C3597812DC5E89' 
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