#include <Array.au3>
#include <IE.au3>


Func OpenInternetExplorer($website)
	Local $oIE1 = _IECreate($website)
	return $oIE1
 EndFunc ;==>OpenInternetExplorer

Func CloseInternetExplorer($obj)
   _IEQuit($obj)
EndFunc ;CloseInternetExplorer

Func OpenNotepad()
   $class = 'Notepad'
   If WinExists(StringFormat("[CLASS:%s]",$class)) Then
	  WinActivate(StringFormat("[CLASS:%s]",$class))
   Else
	  Run('notepad.exe')
	  WinWaitActive(StringFormat("[CLASS:%s]",$class))
	  WinActivate(StringFormat("[CLASS:%s]",$class))
   EndIf
   Sleep(1000)
EndFunc

Func GetPowerShell()
   $title = 'Windows PowerShell'
   If WinExists(StringFormat("[TITLE:%s]",$title)) Then
	  WinActivate(StringFormat("[TITLE:%s]",$title))
   Else
	  Run('powershell.exe')
	  WinWaitActive(StringFormat("[TITLE:%s]",$title))
	  WinActivate(StringFormat("[TITLE:%s]",$title))
   EndIf
   Sleep(1000)
EndFunc ;==>GetPowerShell

Func CloseWindow($window)
   WinKill($window)
   Sleep(1000)
EndFunc ;==>CloseWindow

Func SendPing($url)
   GetPowerShell()
   Send(StringFormat('ping %s{ENTER}',$url))
   Sleep(5000)
EndFunc ;==>SendPing

Func Automate_WebBrowsing()
   $browser = OpenInternetExplorer('http://www.openscope.co/')
   Sleep(2000)
   CloseInternetExplorer($browser)
EndFunc ;==>AutomateWebBrowser

Func Automate_Notepad()
   OpenNotepad()
   CloseWindow('[CLASS:Notepad]')
EndFunc ;Automate_Notepad

Func Automate_Powershell()
   GetPowerShell()
   CloseWindow('[CLASS:ConsoleWindowClass]')
EndFunc ;==>AutomatePowershell

Func main()
   Automate_Powershell()
   Automate_WebBrowsing()
   Automate_Notepad()
EndFunc ;==>main


main()
