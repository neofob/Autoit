; explorar
; notapad
; b0b

#include <Constants.au3>
#include <IE.au3>


Func OpenNotepad()
	Run ("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	AutoItSetOption('SendKeyDelay', 100)
	Sleep(1000)
	Send("My username is: Tommy Hill{ENTER}")
	Sleep(1000)
	Send("My password is: TommyHill2017{ENTER}")
	Sleep(1000)
	Send("!f")
	Sleep(1000)
	Send("{DOWN 6}{ENTER}")
	WinWaitActive("[CLASS:#32770]")
	Sleep(500)
	Send("{ENTER}")
	Sleep(500)
	Send("usernamepassword.txt {ENTER}")
	Send("{TAB}{ENTER}")
	Sleep(1000)
	Send("!f")
	Sleep(1000)
	Send("{DOWN 6}{ENTER}")
	WinWaitClose("[CLASS:Notepad]")
EndFunc	;==>OpenNotepad

Func OpenCmdPrmpt()
	Run ("cmd.exe")
	WinWaitActive("[CLASS:ConsoleWindowClass]")
	Sleep(1000)
	Send("ping www.google.com {ENTER}")
	Sleep(6000)
	Send("!{F4}")
	Sleep(1000)
	WinWaitClose("[CLASS:ConsoleWindowClass]")
EndFunc ;==>OpenCmdPrmpt

Func OpenInternetExplorer($website)
	Local $oIE1 = _IECreate($website)
	return $oIE1
EndFunc ;==>OpenInternetExplorer


Func main()
	; open atc
	$atc = OpenInternetExplorer('http://www.openscope.co/')
	Sleep(10000)
	; open powershell
	$powershell = OpenPowerShell()
	Sleep(10000)
	; open notepad
	$notepad = OpenNotePad()
	Sleep(10000)
	; open cmd
	$cmd = OpenCmd()
	Sleep(10000)
	; open browsing window
	$browser = OpenInternetExplorer('www.google.com')
	Sleep(10000)


EndFunc ;==>main







	;OpenInternetExplorer('www.google.com')
	;OpenInternetExplorer('www.aol.com')
	;OpenInternetExplorer('www.gmail.com')
	;OpenInternetExplorer('www.github.com')
	;OpenInternetExplorer('http://www.openscope.co/')
	;OpenNotepad()
	;OpenCmdPrmpt()
EndFunc ;==>main



main()
