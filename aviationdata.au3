#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <Array.au3>
#include <IE.au3>

Func OpenInternetExplorer($website)
	Local $oIE1 = _IECreate($website)
	return $oIE1
EndFunc ;==>OpenInternetExplorer


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

Func GenerateFlightData()
   Run ("notepad.exe")
   WinWaitActive("[CLASS:Notepad]")
   AutoItSetOption('SendKeyDelay', 25)
   Sleep(1000)

   $flights = get_flights(Random(3,15))
   Send("Flights of interest" & @CR)
   Send("--------------------" & @CR)
   For $i = 0 To UBound($flights) - 1
	  Send($flights[$i] & @CR)
	  Sleep(1000)
   Next

   Sleep(500)
   Send("{ENTER}")

   $flights = get_flights(Random(3,15))
   Send("Flights to check later" & @CR)
   Send("----------------------" & @CR)
   For $i = 0 To UBound($flights) - 1
	  Send($flights[$i] & @CR)
	  Sleep(1000)
   Next

   Send("!f")
   Sleep(1000)
   Send("{DOWN 6}{ENTER}")
   WinWaitActive("[CLASS:#32770]")
   Sleep(500)
   Send("{ENTER}")
   Sleep(500)
   Send("sampledata.txt {ENTER}")
   Send("{TAB}{ENTER}")
   Sleep(1000)
   Send("!f")
   Sleep(1000)
   Send("{DOWN 6}{ENTER}")
   WinWaitClose("[CLASS:Notepad]")
EndFunc	;==>OpenNotepad

Func SimulateAtcMonitoring()
   ; open atc
   $atc = OpenInternetExplorer('http://www.openscope.co/')

   ; Make full screen
   WinSetState(_IEPropertyGet($atc, "hwnd"), "", @SW_MAXIMIZE)

   Sleep(5000)
   GenerateFlightData()
   Sleep(5000)

   _IEQuit($atc)

EndFunc


Func main()

SimulateAtcMonitoring()

EndFunc ;==>main


main()