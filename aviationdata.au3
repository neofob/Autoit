#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <Array.au3>
#include <IE.au3>
#include <Date.au3>


Func file_to_array($filePath)
   ; File to read
   Local $hFileOpen = FileOpen($filePath)

   ;Display a message box in case of any errors.
   If $hFileOpen = -1 Then
	  MsgBox($MB_SYSTEMMODAL, "", "An error occurred when opening the file.")
   EndIf

   ;Read the data into an array using the file handle.
   Local $aArray = FileReadToArray($hFileOpen)

   ; Close open file handler
   FileClose($hFileOpen)

   $output = StringFormat("File %s return %i elements", $filePath, UBound($aArray))
   ConsoleWrite($output & @CRLF)

   Return $aArray

EndFunc

Func get_flights($request_length)

   $airlines = file_to_array("airline_codes.txt")
   $aircraft = file_to_array("aircraft_types.txt")

   $o = StringFormat("Found %s airline codes", UBound($airlines))
   ConsoleWrite($o & @CRLF)

   Local $flights[$request_length] = []

   For $i = 0 To $request_length - 1
	  $random_airline = $airlines[Random(0, UBound($airlines))]
	  $random_aircraft = $aircraft[Random(0, UBound($aircraft))]
	  $flights[$i] = StringFormat("Flight Number: %s%i ->  Aircraft Type: %s", $random_airline, Random(100,999), $random_aircraft)
	  ;ConsoleWrite($flights[$i] & @CRLF)
   Next

   Return $flights

EndFunc

Func GenerateFlightData($userid)
   Run ("notepad.exe")
   WinWaitActive("[CLASS:Notepad]")
   AutoItSetOption('SendKeyDelay', 25)
   Sleep(1000)

   $file_timestamp = GenerateFileTimestamp()
   $output_fname = StringFormat("%s_%s_observations.txt", $file_timestamp, $userid)
   ConsoleWrite($output_fname)

   Send("File: " & $output_fname & @CRLF)

   Send("User Id: " & $userid & @CR)
   Send("The Date is: " & _NowDate() & @CRLF)


   $flights = get_flights(Random(3,7))
   Send("Flights of interest" & @CR)
   Send("-------------------" & @CR)
   For $i = 0 To UBound($flights) - 1
	  Send($flights[$i] & @CR)
	  Sleep(250)
   Next

   Sleep(500)
   Send("{ENTER}")

   $flights = get_flights(Random(3,7))
   Send("Flights to check later" & @CR)
   Send("----------------------" & @CR)
   For $i = 0 To UBound($flights) - 1
	  Send($flights[$i] & @CR)
	  Sleep(250)
   Next

   Send("!f")
   Sleep(1000)
   Send("{DOWN 6}{ENTER}")
   WinWaitActive("[CLASS:#32770]")
   Sleep(500)
   Send("{ENTER}")
   Sleep(500)
   Send($output_fname)
   Send("{ENTER}")
   Send("{TAB}{ENTER}")
   Sleep(1000)
   Send("!f")
   Sleep(1000)
   Send("{DOWN 6}{ENTER}")
   Send("s")
   WinWaitClose("[CLASS:Notepad]")
   Sleep(500)

   Return $output_fname

EndFunc	;==>OpenNotepad

Func InteractWithAtc()

   For $i = 1 To Random(5, 6, 1)

	  ; Retrieve the position as well as height and width of the active window.
	  Local $aPos = WinGetPos("[ACTIVE]")
	  Local $width = Floor($aPos[2]/2)
	  Local $height = Floor($aPos[3]/2)
	  Local $dragdir = 0

	  MouseClick("left", $width, $height)

	  If ($i/2)=Round($i/2) Then
        $dragdir = 1
		MouseWheel($MOUSE_WHEEL_UP, Floor(Random(50, 150)))
	  Else
        $dragdir = -1
		MouseWheel($MOUSE_WHEEL_DOWN, Floor(Random(200, 400)))
	 EndIf

	  Sleep(500)

	  MouseClickDrag("left", $width, $height, Floor($width + ($width*Random(.1,.90)*$dragdir)), Floor($height + ($height*Random(.1,.90)*$dragdir)), Random(20, 50, 1))
	  Sleep(200)

   Next
   Sleep(1000)
EndFunc

Func SimulateAtcMonitoring()

   ; generate fake user id
   $userid = StringFormat("Unit%i", Random(10000,99999))

   ; open atc
   $atc = OpenInternetExplorer('http://www.openscope.co/')

   InteractWithAtc()

   $result_file = GenerateFlightData($userid)

   ;MsgBox($MB_SYSTEMMODAL, "Analyst file result", "NOW MOVE THIS FILE TO SHARED SPACE FOR OTHERS TO VIEW: " & $result_file)

   CloseInternetExplorer($atc)

EndFunc

Func GenerateFileTimestamp()

   $sDate = _DateTimeFormat(_NowCalc(), 2)
   $aDate = StringSplit($sDate,"/")
   $sDate_New = StringFormat("%04d%02d%02d", $aDate[3], $aDate[1], $aDate[2])

   $sTime = _DateTimeFormat(_NowCalc(), 5)
   $aTime = StringSplit($sTime, ":")
   $sTime_New = StringFormat("%02d%02d%02d", $aTime[1], $aTime[2], $aTime[3])

   Return $sDate_New & "_" & $sTime_New

EndFunc