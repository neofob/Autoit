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