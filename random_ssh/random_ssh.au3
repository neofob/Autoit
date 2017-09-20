#include <ssh_snippet_2.au3>

Func main()
	$username="planx"
	$host="asaderb.com"
	$plink = "c:/Program Files/PuTTY/plink.exe"
	$_plinkhandle = _Connect($host, $username, $password)

EndFunc ;==>main

main()