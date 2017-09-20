;Run("C:\WINDOWS\system32\cmd.exe")
$win=WinWaitActive("C:\WINDOWS\system32\cmd.exe")
$host=nope

; Send(StringFormat('plink -ssh %s{ENTER}',$host))

;$PID = Run ( "test.bat", "", @SW_SHOW, 2+4 ) ; The last parameter specifies that autoit will read the stderror and stdout of the child process.
WinWait ( @SystemDir & "\cmd.exe", "", 90 ) ; Wait until the command prompt window is displayed, 90 seconds maximum
While ProcessExists($PID)
	ConsoleWrite(StringFormat('plink -ssh %s{ENTER}',$host) & $s_STDOUT)

    $s_STDOUT = StdoutRead ( $PID )



    If StringInStr($s_STDOUT,"If your usage of XXCOPY does not qualify",1) Then
        Sleep(2000)
        ProcessClose($PID)
        Exit
    EndIf
Wend
