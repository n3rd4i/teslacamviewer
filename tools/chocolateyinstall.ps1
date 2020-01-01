$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url        = 'https://github.com/NateMccomb/TeslaCamViewerII/releases/download/2019.52.6.0/Standalone-TeslaCamViewer-2019.52.6.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  checksum      = 'EA041DC31E47A198EB016751ABDD13BB762B9A3907757D3BE45C32202DF27B05'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$(Join-Path $installLocation `"$AppName.exe`")" `
  -WorkingDirectory "$installLocation"
