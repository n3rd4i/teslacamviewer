$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url        = 'https://github.com/NateMccomb/TeslaCamViewerII/releases/download/2020.11.0.0/Standalone-TeslaCamViewer-2020.11.0.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  checksum      = '2471D41377BF4EF552C69FEF8C2710C0590B5691261F6D5391873E871F1B7193'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$(Join-Path $installLocation `"$AppName.exe`")" `
  -WorkingDirectory "$installLocation"
