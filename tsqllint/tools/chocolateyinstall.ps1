$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'tsqllint'
$url        = 'https://github.com/tsqllint/tsqllint/releases/download/1.15.3/win-x86.tgz'
$url64      = 'https://github.com/tsqllint/tsqllint/releases/download/1.15.3/win-x64.tgz'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url           = $url
  url64bit      = $url64
  softwareName  = $softwareName
  checksum      = 'BD1F4432789AB8C54D8DDC70B2A145196C4CA5DFDCC9EE84039A888B5AC92EEE'
  checksumType  = 'sha256'  
  checksum64    = '42405DFE4BF79AF7187DC052E1F603896339B1C6EDDEC61F65E61551DCD21C0B' 
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
