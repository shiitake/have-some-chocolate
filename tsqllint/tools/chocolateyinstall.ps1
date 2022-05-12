$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'tsqllint'
$url        = 'https://github.com/tsqllint/tsqllint/releases/download/1.14.5/win-x86.tgz'
$url64      = 'https://github.com/tsqllint/tsqllint/releases/download/1.14.5/win-x64.tgz'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  
  url           = $url
  url64bit      = $url64
  softwareName  = $softwareName
  checksum      = '15F8B386F5FE54194EDC7D555D0F856A41C25F780ABD43C819F218C85CD98A09'
  checksumType  = 'sha256'  
  checksum64    = 'B57061FFCA40FB69E547C7A25EDC35A65047CEB6C2491F7C7471C95BEBC81640' 
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
