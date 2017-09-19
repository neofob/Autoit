#include <Array.au3>
#include <IE.au3>


Func OpenInternetExplorer($website)
	Local $oIE1 = _IECreate($website)
	return $oIE1
 EndFunc ;==>OpenInternetExplorer

Func GetPowerShell()
   $title = 'Windows PowerShell'
   If WinExists(StringFormat("[TITLE:%s]",$title)) Then
	  WinActivate(StringFormat("[TITLE:%s]",$title))
   Else
	  Run('powershell.exe')
	  WinWaitActive(StringFormat("[TITLE:%s]",$title))
	  WinActivate(StringFormat("[TITLE:%s]",$title))
   EndIf
EndFunc ;==>GetPowerShell

Func ClosePowerShell()
   $title = 'Windows PowerShell'
   WinKill(StringFormat("[TITLE:%s]",$title))
   Sleep(1000)
EndFunc ;==>ClosePowerShell

Func SendPing($url)
   GetPowerShell()
   Send(StringFormat('ping %s{ENTER}',$url))
   Sleep(5000)
EndFunc ;==>SendPing

Func main()
   ;$atc = OpenInternetExplorer('http://www.openscope.co/')
   ;$browser = OpenInternetExplorer('www.google.com')
   ;GetCommandPrompt()
   SendPing('www.google.com')
   ClosePowerShell()
   SendPing('www.facebook.com')
EndFunc ;==>main


main()
