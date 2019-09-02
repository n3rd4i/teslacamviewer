$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$unzipLocation = "$(Join-Path $toolsDir TeslaCamViewer)"
$url        = 'https://github.com/NateMccomb/TeslaCamViewer/releases/download/2019.35.5.0/Standalone-TeslaCamViewer-2019.35.5.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $toolsDir TeslaCamViewer)"
  url           = $url
  softwareName  = 'teslacamviewer*'
  checksum      = 'A72ED8CE6C897B5A0A7F9832AB8237EC582D29BEF27A61609D701832C387119C'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "`"$unzipLocation\$AppName.exe`"" `
  -WorkingDirectory "$unzipLocation"
