Func Automate_Powershell()
   $powershell = GetPowerShell()
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

