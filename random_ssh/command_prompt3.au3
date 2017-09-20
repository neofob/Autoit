#include <MsgBoxConstants.au3>
#include <Date.au3>


Func GenerateAWord($wordCount=1)
	$File = FileReadToArray("../google-10000-english-usa.txt")
	$string = ""
	For $i = $wordCount To 1 Step -1
		$random = $File[Random(0, UBound($File) - 1, 1)]
		$string = $string & $random

	MsgBox(64, "Hey", "Here's a random word: " & $string)


$CMD=Run("C:\WINDOWS\system32\cmd.exe")
ProcessWait($CMD)
$host="planx@asaderb.com"


$new_title = StringFormat("plink_%s_%s", _NowTime(), $CMD)
;MsgBox($MB_SYSTEMMODAL, "NEW PID", $new_title,3)


Opt("WinTitleMatchMode", 2)
WinActivate("cmd.exe")
WinSetTitle(WinGetTitle("cmd.exe"), "", $new_title)

$command = StringFormat('plink -ssh %s{ENTER}',$host)
Send($command)
Sleep ( 1 )
Send(StringFormat('%s{ENTER}',$password))
Sleep ( 1 )

MsgBox($MB_SYSTEMMODAL, "NEW PID", StringFormat("PID IS %s", $CMD),3)
While ProcessExists($CMD)
	$choice = Random(0, 3)
	$choice = 0
	Switch $choice
		Case 0


	EndSwitch

	Sleep ( 1)


Wend
