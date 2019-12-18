$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url        = 'https://github.com/NateMccomb/TeslaCamViewerII/releases/download/2019.46.6.0/Standalone-TeslaCamViewer-2019.46.6.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  checksum      = '9AFFEE3CE7863FEAEAF599E83316CE2FA1E8CEB246FC1B3152B48F051FAEDBBF'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$(Join-Path $installLocation `"$AppName.exe`")" `
  -WorkingDirectory "$installLocation"
