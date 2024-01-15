Echo "Keep alive w/ scroll lock…"

$WShell = New-Object -com "Wscript.Shell"
$iteration = 0

while (((Get-Date) -lt (Get-Date -Hour 01 -Minute 00 -Second 0)) -or ((Get-Date) -gt (Get-Date -Hour 18 -Minute 00 -Second 0)))
{
    $iteration = $iteration + 1
	$WShell.sendkeys("{SCROLLLOCK}")
	Start-Sleep -Milliseconds 100
	$WShell.sendkeys("{SCROLLLOCK}")
	Start-Sleep -Seconds 240
    # Start-Process -FilePath "C:\Users\AlvinPatron\source\repos\pkms\sync.sh"
    Echo "Done with iteration: $iteration"
};;;