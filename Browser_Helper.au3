#include <IE.au3>

; Chrome Browser Interactions, I am aware of a Chrome.au3 , but that requires an extention which i am asuming isn't installed on the hosts.
Func Chrome_Start()
   $Chrome_Location = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
   Run($Chrome_Location)
   WinWaitActive("")
   $handle = WinGetHandle("")
   Sleep(2000)
   return $handle
EndFunc ;==>Chrome_start

Func Chrome_Navigate($handle,$url)
   Chrome_getFocus($handle)
   Sleep(1000)
   Send(StringFormat('!d^a%s{ENTER}', $url))
   Sleep(3000)
EndFunc ;==>Chrome_Navigate

Func Chrome_getFocus($handle)
   WinActivate($handle)
   Sleep(2000)
EndFunc ;Chrome_getFocus

Func Chrome_End($handle)
   WinKill($handle)
EndFunc ;==>Chrome_end

; Internet Explorer Interactions

Func OpenInternetExplorer($website)
   Local $oIE1 = _IECreate($website)
   ; Make full screen
   WinSetState(_IEPropertyGet($oIE1, "hwnd"), "", @SW_MAXIMIZE)
   return $oIE1
EndFunc ;==>OpenInternetExplorer

Func CloseInternetExplorer($obj)
   _IEQuit($obj)
EndFunc ;==>CloseInternetExplorer

Func IE_Click_Image($atc)
   Local $oImgs = _IEImgGetCollection($atc)
   Local $iNumImg = @extended

   Local $sTxt = "There are " & $iNumImg & " images on the page" & @CRLF & @CRLF
   For $oImg In $oImgs
      $sTxt &= $oImg.src & @CRLF
   Next
   MsgBox($MB_SYSTEMMODAL, "Img Info", $sTxt)
EndFunc ;==>IE_Click_Image