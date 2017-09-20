#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <aviationdata.au3>
#include <Browser_Helper.au3>
#include <auto_powershell.au3>

Func OpenNotepad()
   Run('notepad.exe')
   WinWaitActive("")
   $handle = WinGetHandle("")
   Sleep(1000)
   return $handle
EndFunc

Func Automate_WebBrowsing()
   Local $ie_general = OpenInternetExplorer('www.google.com')
   Sleep(1000)
   Local $chrome_general = Chrome_Start()
   Chrome_Navigate($chrome_general,'www.google.com')
   Local $url_list[9] = ["www.google.com","www.confluence.com","www.jira.com","www.bing.com","www.github.com","www.aol.com","www.facebook.com","www.yahoo.com","www.reddit.com"]
   ;Local $url_list2[212] = ['maruthorvattomsrianjaneyatemple.org', 'paypalsecure-2016.sucurecode524154241.arita.ac.tz', 'spaceconstruction.com.au', 'tei.portal.crockerandwestridge.com', 'tonyyeo.com', 'update-apple.com.betawihosting.net', 'usaa.com-sec-inet-auth-logon-ent-logon-logon-redirectjsp.chrischadwick.com.au', 'windrushvalleyjoinery.co.uk', 'yhiltd.co.uk', 'dicrophani.com', 'timoteiteatteri.fi', 'gov.f3322.net', 'airtyrant.com', 'dionneg.com', 'lupytehoq.com', 'vipprojects.cn', 'douate.com', 'hhj3.cn', 'hryspap.cn', 'iebar.t2t2.com', 'altan5.com', 'bakuzbuq.ru', 'ksdiy.com', 'tourindia.in', 'appprices.com', 'ccjbox.ivyro.net', 'golfsource.us', 'greenculturefoundation.org', 'gavih.org', 'globalnursesonline.com', 'gsiworld.neostrada.pl', 'guyouellette.org', 'haedhal.com', 'johnfoxphotography.com', 'joojin.com', 'jorpe.co.za', 'tinypic.info', 'czbaoyu.com', 'dawnsworld.mysticalgateway.com', 'dccallers.org', 'de007.net', 'hdrart.co.uk', 'hecs.com', 'e-taekwang.com', 'passports.ie', 'perugemstones.com', 'czgtgj.com', 'jnvzpp.sellclassics.com', 'dwnloader.com', 'jdsemnan.ac.ir', 'la21jeju.or.kr', 'laextradeocotlan.com.mx', 'lagrotta4u.de', 'skottles.com', 'usb-turn-table.co.uk', 'acusticjjw.pl', 'reltime2012.ru', 'cpi-istanbul.com', 'creativitygap.com', 'pizzotti.net', 'ericzworkz.free.fr', 'ghidneamt.ro', 'hp-h.us', 'lincos.net', 'messenger.zango.com', 'moaramariei.ro', 'paul.cescon.ca', 'seouldae.gosiwonnet.com', 'theporkauthority.com', 'dwdpi.co.kr', 'fileserver.co.kr', 'festival.cocobau.com', 'lauglyhousebuyers.com', 'yannick.delamarre.free.fr', 'truckersemanifest.com', '0000mps.webpreview.dsl.net', 'izlinix.com', 'hx018.com', 'k-techgroup.com', 'leonarderickson.chez.com', 'oneil-clan.com', 'onlinetribun.com', 'ozarslaninsaat.com.tr', 'platamones.nl', 'agroluftbild.de', 'photo.video.gay.free.fr', 'coleccionperezsimon.com', 'tfpcmedia.org', 'strand-und-hund.de', 'setjetters.com', 'shema.firstcom.co.kr', 'shibanikashyap.asia', 'sinopengelleriasma.com', 'adfrut.cl', 'altzx.cn', 'stoneb.cn', 'zotasinc.com', 'chinalve.com', 'www.yntscp.com', 'wesleymedia.com', 'd24.0772it.net', 'hncopd.com', 'iiidown.com', 'werbeagentur-ruhrwerk.de', 'www.prjcode.com', 'xinyitaoci.com', 'adv-inc-net.com', 'relimar.com', 'tr-gdz.ru', 'valetik.ru', 'frankfisherfamily.com', 'itoito.ru', 'pasakoyekmek.com', 'stycn.com', 'subeihm.com', 'telephonie-voip.info', 'www.gdby.com.cn', 'www.gdzjco.com', 'helpformedicalbills.com', 'cdqyys.com', 'samwooind.co.kr', 'technosfera-nsk.ru', 'firehorny.com', 'lectscalimertdr43.land.ru', 'lfcraft.com', 'tork-aesthetics.de', 'chinatlz.com', 'condosguru.com', 'eggfred.com', 'ets-grup.com', 'www.thoosje.com', 'alchenomy.com', 'cowbears.nl', 'dikesalerno.it', 'drc-egypt.org', 'qhhxzny.gov.cn', 'anafartalartml.k12.tr', 'axis-online.pl', 'bartnagel.tv', 'centro-moto-guzzi.de', 'databased.com', 'dinkelbrezel.de', 'dittel.sk', 'empe3net7.neostrada.pl', 'huidakms.com.cn', 'iwb.com.cn', 'www.cndownmb.com', 'www.ntdfbp.com', 'www.xmhbcc.com', 'www.nbyuxin.com', 'www.qqkabb.com', 'baryote.com', 'gunibox.com', 'nokiastock.ru', 'ifix8.com', '5uyisheng.com', 'bossmb.com', 'csbjkj.com', 'dqfix.org', 'www.hengjia8.com', 'www.laobaozj.com', 'www.qhdast.com', 'www.rsrly.com', 'www.stkjw.net', 'www.vvpan.com', 'www.xtewx.com', 'www.yc1234.com', 'yserch.com', 's8s8s8.com', 'seqsixxx.com', 'stisa.org.cn', 'test.gaxtoa.com', 'v1tj.jiguangie.com', 'www.2bbd.com', 'tz.jiguangie.com', 'www.vipmingxing.com', 'xiazai.dns-vip.net', 'andlu.org', 'din8win7.in', 'mbcobretti.com', 'okboobs.com', 'oktits.com', 'qihv.net', 'qwepa.com', 'stroyeq.ru', 'valet-bablo.ru', 'yixingim.com', 'yuyu.com', 'bei3.8910ad.com', 'huohuasheji.com', 'man1234.com', 'www.jwdn.net', 'blacksoftworld.com', 'boramind.co.kr', 'bradyhansen.com', 'stabroom.cn', 'www.dikesalerno.it', 'www.gentedicartoonia.it', 'www.infoaz.nl', 'abbyspanties.com', 'cheshirehockey.com', 'chinafsw.cn', 'cibonline.org', 'clancommission.us', 'embedor.com', 'end70.com', 'ensenadasportfishing.com', 'eurolatexthai.com', 'falconexport.com', 'assexyas.com', 'acd.com.vn', 'eloyed.com']
   Local $max_index = 8
   For $i = 0 To 5 Step 1
      Sleep(1000)
      Switch Random(0,1,1)
         Case 0
            Chrome_Navigate($chrome_general,$url_list[Random(0,$max_index,1)])
         Case 1
            _IENavigate($ie_general,$url_list[Random(0,$max_index,1)])
      EndSwitch
   Next
   CloseInternetExplorer($ie_general)
   Chrome_End($chrome_general)
EndFunc ;==>AutomateWebBrowser

Func main()
   For $i = 0 To 10 Step 1
	  Sleep(15000)
	  Switch Random(0,100,1)
         Case 0 To 15
            Automate_Powershell()
         Case 16 To 30
            Automate_WebBrowsing()
         Case 31 To 100
            SimulateAtcMonitoring()
      EndSwitch
   Next
   ;SimulateAtcMonitoring()
   ;Automate_Powershell()
EndFunc ;==>main


main()
