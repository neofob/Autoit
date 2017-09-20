Func Automate_Powershell()
   $powershell = GetPowerShell()
   $runCommand('Get-Process > file.txt')
   Sleep(1000)
   WinKill($powershell)
EndFunc ;==>AutomatePowershell

Func GetPowerShell()
   Run('powershell.exe')
   WinWaitActive("")
   $handle = WinGetHandle("")
   Sleep(1000)
   return $handle
EndFunc ;==>GetPowerShell

Func runCommand($handle,$cmd)
   WinActivate($handle)
   Sleep(2000)
   Send(StringFormat("%s{ENTER}",$cmd))
   Sleep(2000)
EndFunc ;==>runCommand