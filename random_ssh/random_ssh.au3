#include <MsgBoxConstants.au3>
#include <Date.au3>
#include <File.au3>
; Make a file in the root repo directory with the following:
; user@ssh-hostname.com
; password_for_ssh

Func MessageBox($message, $delay=5, $title="An important message")
	MsgBox($MB_SYSTEMMODAL, $title, $message)
EndFunc

Func RandWord()
	$File = FileReadToArray("../google-10000-english-usa.txt")
	$random = $File[Random(0, UBound($File) - 1, 1)]
	return $random
EndFunc

Func RandomLinuxCommands()
	$File = FileReadToArray("../random-linux-commands")
	$random = $File[Random(0, UBound($File) - 1, 1)]
	return $random
EndFunc

Func GenerateAPhrase($wordCount=1)
	$string = ""
	For $i = $wordCount To 1 Step -1
		$random = RandWord()
		$string = $string & $random
	Next
	return $string
EndFunc

Func main()

	    ; Open the file for reading and store the handle to a variable.

    Local $hFileOpen = FileOpen("../ssh-info", $FO_READ)
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
        Return False
    EndIf

    ; Read the fist line of the file using the handle returned by FileOpen.
	$host = FileReadLine($hFileOpen, 1)
	; Read the fist line of the file using the handle returned by FileOpen.
	$password = FileReadLine($hFileOpen, 2)

	$CMD=Run("C:\WINDOWS\system32\cmd.exe")
	ProcessWait($CMD)

	$new_title = StringFormat("plink_%s_%s", _NowTime(), $CMD)
	;MsgBox($MB_SYSTEMMODAL, "NEW PID", $new_title,3)

	Opt("WinTitleMatchMode", 2)
	WinActivate($new_title)
	WinSetTitle(WinGetTitle("cmd.exe"), "", $new_title)

	$command = StringFormat('plink -ssh %s{ENTER}',$host)
	Send($command)
	Sleep ( 100 )
	Send(StringFormat('%s{ENTER}',$password))
	Sleep ( 100 )

	While ProcessExists($CMD)
		$choice = Random(0, 4, 1)
		WinActivate("cmd.exe")
		Switch $choice
			Case 0
				$command = StringFormat('echo "%s" >> %s{ENTER}', GenerateAPhrase(4), GenerateAPhrase(2))
				Send($command)
			Case 1
				$dir = GenerateAPhrase(2)
				$command = StringFormat('mkdir -p %s && cd %s {ENTER}', $dir, $dir)
				Send($command)
			Case 2
				$command = "cd ~{ENTER}"
				Send($command)
			Case 3
				$command = StringFormat('%s{ENTER}', RandomLinuxCommands())
				Send($command)
			Case 4
				$command = StringFormat('echo "time is %s choice was %s"{ENTER}', _NowTime(), $choice)
				Send($command)
		EndSwitch

		Sleep(Random(100, 240))

		Sleep (1000)


	Wend
EndFunc

main()
