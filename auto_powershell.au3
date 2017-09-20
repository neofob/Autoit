Func Automate_Powershell()
   $powershell = GetPowerShell()
   Local $cmd_list[3] = ['Get-Process > process_list.txt','Get-Service > service-list.txt','Get-ChildItem Env: > envvars.txt']
   For $i = 0 To 2 Step 1
      $tmp = Random(0,2,1)
      $runCommand($cmd_list[$tmp])
   Next
   Sleep(1000)
   WinKill($powershell)
EndFunc ;==>AutomatePowershell

Func GetPowerShell()
   Run('powershell.exe')
   Sleep(1000)
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
