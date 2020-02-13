$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url        = 'https://github.com/NateMccomb/TeslaCamViewerII/releases/download/2020.3.1.0/Standalone-TeslaCamViewer-2020.3.1.0.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  checksum      = '40153D3EF696B4CECF000F8FEBF4B25EB2A83F02CEB28F8CFC7D80DCC52125EB'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
  -TargetPath "$(Join-Path $installLocation `"$AppName.exe`")" `
  -WorkingDirectory "$installLocation"
