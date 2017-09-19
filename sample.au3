#include <Array.au3>
#include <IE.au3>


Func OpenInternetExplorer($website)
	Local $oIE1 = _IECreate($website)
	return $oIE1
 EndFunc ;==>OpenInternetExplorer

Func GetCommandPrompt()
   $classname = 'ConsoleWindowClass'
   If WinExists(StringFormat("[CLASS:%s]",$classname)) Then
	  WinActivate(StringFormat("[CLASS:%s]",$classname))
   Else
	  Run('cmd.exe')
	  WinWaitActive(StringFormat("[CLASS:%s]",$classname))
	  WinActivate(StringFormat("[CLASS:%s]",$classname))
   EndIf
EndFunc ;==>GetCommandPrompt

Func main()
   ;$atc = OpenInternetExplorer('http://www.openscope.co/')
   ;$browser = OpenInternetExplorer('www.google.com')
   GetCommandPrompt()
   Send('ping www.google.com{ENTER}')
EndFunc ;==>main


main()
