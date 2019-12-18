## Common between Install and Uninstall
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$AppName = 'TeslaCam Viewer II'
$installLocation = "$(Join-Path $toolsDir $AppName)"

$startMenuDir = [IO.Path]::Combine($ENV:ProgramData, 'Microsoft\Windows\Start Menu\Programs', $AppName)
$shortcutPath = "$(Join-Path $startMenuDir `"$AppName.lnk`")"
