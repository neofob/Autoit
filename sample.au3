#include <Array.au3>
#include <IE.au3>


Func OpenInternetExplorer($website)
	Local $oIE1 = _IECreate($website)
	return $oIE1
 EndFunc ;==>OpenInternetExplorer

Func CloseInternetExplorer($obj)
   _IEQuit($obj)
EndFunc ;==>CloseInternetExplorer

Func Click_Image($atc)
   Local $oImgs = _IEImgGetCollection($atc)
   Local $iNumImg = @extended

   Local $sTxt = "There are " & $iNumImg & " images on the page" & @CRLF & @CRLF
   For $oImg In $oImgs
	   $sTxt &= $oImg.src & @CRLF
   Next
   MsgBox($MB_SYSTEMMODAL, "Img Info", $sTxt)
EndFunc ;==>Click_Image

Func Use_IFrame($atc)
   Local $oFrames = _IEFrameGetCollection($atc)
   Local $iNumFrames = @extended
   Local $sTxt = $iNumFrames & " frames found" & @CRLF & @CRLF
   Local $oFrame = 0
   For $i = 0 To ($iNumFrames - 1)
	   $oFrame = _IEFrameGetCollection($oIE, $i)
	   $sTxt &= _IEPropertyGet($oFrame, "innertext") & @CRLF
   Next
   MsgBox($MB_SYSTEMMODAL, "Frames Info", $sTxt)
EndFunc ;==>Use_IFrame

Func atc_atomation($atc)
   ;Click_Image($atc)
   ;Use_IFrame($atc)
EndFunc ;==>atc_atomation


Func OpenNotepad()
   $class = 'Notepad'
   If WinExists(StringFormat("[CLASS:%s]",$class)) Then
	  WinActivate(StringFormat("[CLASS:%s]",$class))
   Else
	  Run('notepad.exe')
	  WinWaitActive(StringFormat("[CLASS:%s]",$class))
	  WinActivate(StringFormat("[CLASS:%s]",$class))
   EndIf
   Sleep(1000)
EndFunc

Func GetPowerShell()
   $title = 'Windows PowerShell'
   If WinExists(StringFormat("[TITLE:%s]",$title)) Then
	  WinActivate(StringFormat("[TITLE:%s]",$title))
   Else
	  Run('powershell.exe')
	  WinWaitActive(StringFormat("[TITLE:%s]",$title))
	  WinActivate(StringFormat("[TITLE:%s]",$title))
   EndIf
   Sleep(1000)
EndFunc ;==>GetPowerShell

Func CloseWindow($window)
   WinKill($window)
   Sleep(1000)
EndFunc ;==>CloseWindow

Func SendPing($url)
   GetPowerShell()
   Send(StringFormat('ping %s{ENTER}',$url))
   Sleep(5000)
EndFunc ;==>SendPing

Func RandomSleep($x,$y)
   $rand = Random($x,$y)
   Sleep($rand)
EndFunc ;==>RandomSleep

Func Automate_WebBrowsing()
   $atc = OpenInternetExplorer('http://www.openscope.co/')
   ;$browser = OpenInternetExplorer('www.google.com')

   Local $url_list[9] = ["www.google.com","www.confluence.com","www.jira.com","www.bing.com","www.github.com","www.aol.com","www.facebook.com","www.yahoo.com","www.reddit.com"]
   ;Local $url_list2[212] = ['maruthorvattomsrianjaneyatemple.org', 'paypalsecure-2016.sucurecode524154241.arita.ac.tz', 'spaceconstruction.com.au', 'tei.portal.crockerandwestridge.com', 'tonyyeo.com', 'update-apple.com.betawihosting.net', 'usaa.com-sec-inet-auth-logon-ent-logon-logon-redirectjsp.chrischadwick.com.au', 'windrushvalleyjoinery.co.uk', 'yhiltd.co.uk', 'dicrophani.com', 'timoteiteatteri.fi', 'gov.f3322.net', 'airtyrant.com', 'dionneg.com', 'lupytehoq.com', 'vipprojects.cn', 'douate.com', 'hhj3.cn', 'hryspap.cn', 'iebar.t2t2.com', 'altan5.com', 'bakuzbuq.ru', 'ksdiy.com', 'tourindia.in', 'appprices.com', 'ccjbox.ivyro.net', 'golfsource.us', 'greenculturefoundation.org', 'gavih.org', 'globalnursesonline.com', 'gsiworld.neostrada.pl', 'guyouellette.org', 'haedhal.com', 'johnfoxphotography.com', 'joojin.com', 'jorpe.co.za', 'tinypic.info', 'czbaoyu.com', 'dawnsworld.mysticalgateway.com', 'dccallers.org', 'de007.net', 'hdrart.co.uk', 'hecs.com', 'e-taekwang.com', 'passports.ie', 'perugemstones.com', 'czgtgj.com', 'jnvzpp.sellclassics.com', 'dwnloader.com', 'jdsemnan.ac.ir', 'la21jeju.or.kr', 'laextradeocotlan.com.mx', 'lagrotta4u.de', 'skottles.com', 'usb-turn-table.co.uk', 'acusticjjw.pl', 'reltime2012.ru', 'cpi-istanbul.com', 'creativitygap.com', 'pizzotti.net', 'ericzworkz.free.fr', 'ghidneamt.ro', 'hp-h.us', 'lincos.net', 'messenger.zango.com', 'moaramariei.ro', 'paul.cescon.ca', 'seouldae.gosiwonnet.com', 'theporkauthority.com', 'dwdpi.co.kr', 'fileserver.co.kr', 'festival.cocobau.com', 'lauglyhousebuyers.com', 'yannick.delamarre.free.fr', 'truckersemanifest.com', '0000mps.webpreview.dsl.net', 'izlinix.com', 'hx018.com', 'k-techgroup.com', 'leonarderickson.chez.com', 'oneil-clan.com', 'onlinetribun.com', 'ozarslaninsaat.com.tr', 'platamones.nl', 'agroluftbild.de', 'photo.video.gay.free.fr', 'coleccionperezsimon.com', 'tfpcmedia.org', 'strand-und-hund.de', 'setjetters.com', 'shema.firstcom.co.kr', 'shibanikashyap.asia', 'sinopengelleriasma.com', 'adfrut.cl', 'altzx.cn', 'stoneb.cn', 'zotasinc.com', 'chinalve.com', 'www.yntscp.com', 'wesleymedia.com', 'd24.0772it.net', 'hncopd.com', 'iiidown.com', 'werbeagentur-ruhrwerk.de', 'www.prjcode.com', 'xinyitaoci.com', 'adv-inc-net.com', 'relimar.com', 'tr-gdz.ru', 'valetik.ru', 'frankfisherfamily.com', 'itoito.ru', 'pasakoyekmek.com', 'stycn.com', 'subeihm.com', 'telephonie-voip.info', 'www.gdby.com.cn', 'www.gdzjco.com', 'helpformedicalbills.com', 'cdqyys.com', 'samwooind.co.kr', 'technosfera-nsk.ru', 'firehorny.com', 'lectscalimertdr43.land.ru', 'lfcraft.com', 'tork-aesthetics.de', 'chinatlz.com', 'condosguru.com', 'eggfred.com', 'ets-grup.com', 'www.thoosje.com', 'alchenomy.com', 'cowbears.nl', 'dikesalerno.it', 'drc-egypt.org', 'qhhxzny.gov.cn', 'anafartalartml.k12.tr', 'axis-online.pl', 'bartnagel.tv', 'centro-moto-guzzi.de', 'databased.com', 'dinkelbrezel.de', 'dittel.sk', 'empe3net7.neostrada.pl', 'huidakms.com.cn', 'iwb.com.cn', 'www.cndownmb.com', 'www.ntdfbp.com', 'www.xmhbcc.com', 'www.nbyuxin.com', 'www.qqkabb.com', 'baryote.com', 'gunibox.com', 'nokiastock.ru', 'ifix8.com', '5uyisheng.com', 'bossmb.com', 'csbjkj.com', 'dqfix.org', 'www.hengjia8.com', 'www.laobaozj.com', 'www.qhdast.com', 'www.rsrly.com', 'www.stkjw.net', 'www.vvpan.com', 'www.xtewx.com', 'www.yc1234.com', 'yserch.com', 's8s8s8.com', 'seqsixxx.com', 'stisa.org.cn', 'test.gaxtoa.com', 'v1tj.jiguangie.com', 'www.2bbd.com', 'tz.jiguangie.com', 'www.vipmingxing.com', 'xiazai.dns-vip.net', 'andlu.org', 'din8win7.in', 'mbcobretti.com', 'okboobs.com', 'oktits.com', 'qihv.net', 'qwepa.com', 'stroyeq.ru', 'valet-bablo.ru', 'yixingim.com', 'yuyu.com', 'bei3.8910ad.com', 'huohuasheji.com', 'man1234.com', 'www.jwdn.net', 'blacksoftworld.com', 'boramind.co.kr', 'bradyhansen.com', 'stabroom.cn', 'www.dikesalerno.it', 'www.gentedicartoonia.it', 'www.infoaz.nl', 'abbyspanties.com', 'cheshirehockey.com', 'chinafsw.cn', 'cibonline.org', 'clancommission.us', 'embedor.com', 'end70.com', 'ensenadasportfishing.com', 'eurolatexthai.com', 'falconexport.com', 'assexyas.com', 'acd.com.vn', 'eloyed.com']
   atc_atomation($atc)
   Break
   For $i = 0 To 10 Step 1
	  If Random(0,1) == 1 Then
		 _IE
	  Else
		 $tmp = Random(0,9)
		 _IENavigate($browser,$url_list[$tmp],1)
		 RandomSleep(500,20000)
	  EndIf
   Next
   CloseInternetExplorer($atc)
   CloseInternetExplorer($browser)
EndFunc ;==>AutomateWebBrowser

Func Automate_Notepad()
   OpenNotepad()
   CloseWindow('[CLASS:Notepad]')
EndFunc ;Automate_Notepad

Func Automate_Powershell()
   GetPowerShell()
   CloseWindow('[CLASS:ConsoleWindowClass]')
EndFunc ;==>AutomatePowershell

Func main()

   ;Automate_Powershell()
   Automate_WebBrowsing()
   ;Automate_Notepad()
EndFunc ;==>main


main()
