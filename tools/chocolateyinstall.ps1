$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url        = 'https://github.com/NateMccomb/TeslaCamViewerII/raw/master/Download/Standalone-TeslaCamViewer-2019.52.1.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  checksum      = '6746955167CEA9133F2818FDB45AE51764A0CC918E65E6E9C37899BD4E479B8C'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$(Join-Path $installLocation `"$AppName.exe`")" `
  -WorkingDirectory "$installLocation"
