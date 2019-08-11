$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$unzipLocation = "$(Join-Path $toolsDir TeslaCamViewer)"
$url        = 'https://github.com/NateMccomb/TeslaCamViewer/releases/download/2019.32.0.0/Standalone-TeslaCamViewer-2019.32.0.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $toolsDir TeslaCamViewer)"
  url           = $url
  softwareName  = 'teslacamviewer*'
  checksum      = '197075F679EE9000DE9127D75E5F1D90D243240464E6E4E443A38453B0E3BC2C'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "`"$unzipLocation\$AppName.exe`"" `
  -WorkingDirectory "$unzipLocation"
