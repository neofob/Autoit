#include <MsgBoxConstants.au3>

Func _WinGetByPID($iPID, $iArray = 1) ; 0 Will Return 1 Base Array & 1 Will Return The First Window.
    Local $aError[1] = [0], $aWinList, $sReturn
    If IsString($iPID) Then
        $iPID = ProcessExists($iPID)
    EndIf
    $aWinList = WinList()
    For $A = 1 To $aWinList[0][0]
        If WinGetProcess($aWinList[$A][1]) = $iPID And BitAND(WinGetState($aWinList[$A][1]), 2) Then
            If $iArray Then
                Return $aWinList[$A][1]
            EndIf
            $sReturn &= $aWinList[$A][1] & Chr(1)
        EndIf
    Next
    If $sReturn Then
        Return StringSplit(StringTrimRight($sReturn, 1), Chr(1))
    EndIf
    Return SetError(1, 0, $aError)
EndFunc   ;==>_WinGetByPID


$CMD=Run("C:\WINDOWS\system32\cmd.exe")
$CommandPromptWindow = _WinGetByPID($CMD)
ProcessWait($CMD)
$host="asaderb.com"
$command = StringFormat('plink -ssh %s{ENTER}',$host)
ControlSend($CommandPromptWindow, "", "", ))

Opt("WinTitleMatchMode", 2)
WinActivate("cmd.exe")
Send($command)


MsgBox($MB_SYSTEMMODAL, "NEW PID", StringFormat("PID IS %s", $CMD),3)
While ProcessExists($CMD)
    $s_STDOUT = StdoutRead ( $CMD )

	MsgBox($MB_SYSTEMMODAL, "IMPORTANT", $s_STDOUT,3)


    If StringInStr($s_STDOUT, "your usage of XXCOPY does not qualify",1) Then
        Sleep(2000)
        ProcessClose($CMD)
        Exit
    EndIf
Wend
