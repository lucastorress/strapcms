<noscript>
    <meta http-equiv="refresh" content="0;url=/client/nojs" />
</noscript>
<link rel="stylesheet" href="http://images.zaphotel.net/%web_build%/web-gallery/styles/habboclient.css" type="text/css" />
<link rel="stylesheet" href="http://images.zaphotel.net/%web_build%/web-gallery/styles/habboflashclient.css" type="text/css" />
<script src="http://images.zaphotel.net/%web_build%/web-gallery/static/js/habboflashclient.js" type="text/javascript"></script>
<script type="text/javascript">
    FlashExternalInterface.loginLogEnabled = true;
    
    FlashExternalInterface.logLoginStep("web.view.start");
    
    if (top == self) {
        FlashHabboClient.cacheCheck();
    }
    var flashvars = {
            "client.allow.cross.domain" : "1", 
            "client.notify.cross.domain" : "1", 
            "connection.info.host" : "64.31.13.30", 
            "connection.info.port" : "8932", 
            "site.url" : "http://zaphotel.net", 
            "url.prefix" : "http://zaphotel.net", 
            "client.reload.url" : "http://zaphotel.net/login_popup", 
            "client.fatal.error.url" : "http://zaphotel.net/flash_client_error", 
            "client.connection.failed.url" : "http://zaphotel.net/client", 
            "external.variables.txt" : "http://zaphotel.net/lolcats/bflyswfs/external_variables.txt", 
            "external.texts.txt" : "http://zaphotel.net/externals.php?id=external_flash_texts", 
            "productdata.load.url" : "http://zaphotel.net/lolcats/bflyswfs/productdata.txt", 
            "furnidata.load.url" : "http://zaphotel.net/lolcats/bflyswfs/furnidata.txt", 
            "use.sso.ticket" : "1", 
            "sso.ticket" : "%sso_ticket%", 
            "processlog.enabled" : "1",
            "account_id" : "19927505", 
            "client.starting" : "Please wait! Zap is Loading.", 
            "flash.client.url" : "http://zaphotel.net/client.php", 
            "user.hash" : "199275052dbf5f89adb0a643bf16b0ea1cd646db", 
            "flash.client.origin" : "popup", 
    };
    var params = {
        "base" : "http://zaphotel.net/gordon/ACTIVE/",
        "allowScriptAccess" : "always",
        "menu" : "false"                
    };
    
    if (!(HabbletLoader.needsFlashKbWorkaround())) {
    	params["wmode"] = "opaque";
    }
    
    var clientUrl = "http://zaphotel.net/gordon/ACTIVE/Zap.swf";
    swfobject.embedSWF(clientUrl, "flash-container", "100%", "100%", "10.0.0", "http://images.zaphotel.net/%web_build%/web-gallery/flash/expressInstall.swf", flashvars, params);

    window.onbeforeunload = unloading;
    function unloading() {
        var clientObject;
        if (navigator.appName.indexOf("Microsoft") != -1) {
            clientObject = window["flash-container"];
        } else {
            clientObject = document["flash-container"];
        }
        try {
            clientObject.unloading();
        } catch (e) {}
    }
</script>

<meta name="description" content="Check into the world�s largest virtual hotel for FREE! Meet and make friends, play games, chat with others, create your avatar, design rooms and more�" />
<meta name="keywords" content="habbo hotel, virtual, world, social network, free, community, avatar, chat, online, teen, roleplaying, join, social, groups, forums, safe, play, games, online, friends, teens, rares, rare furni, collecting, create, collect, connect, furni, furniture, pets, room design, sharing, expression, badges, hangout, music, celebrity, celebrity visits, celebrities, mmo, mmorpg, massively multiplayer" />



<!--[if IE 8]>
<link rel="stylesheet" href="http://images.zaphotel.net/%web_build%/web-gallery/v2/styles/ie8.css" type="text/css" />
<![endif]-->
<!--[if lt IE 8]>
<link rel="stylesheet" href="http://images.zaphotel.net/%web_build%/web-gallery/v2/styles/ie.css" type="text/css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" href="http://images.zaphotel.net/%web_build%/web-gallery/v2/styles/ie6.css" type="text/css" />
<script src="http://images.zaphotel.net/%web_build%/web-gallery/static/js/pngfix.js" type="text/javascript"></script>
<script type="text/javascript">
try { document.execCommand('BackgroundImageCache', false, true); } catch(e) {}
</script>

<style type="text/css">
body { behavior: url(/js/csshover.htc); }
</style>
<![endif]-->
<meta name="build" content="63-BUILD36 - 16.11.2010 11:51 - com" />
</head>

<body id="client" class="flashclient">
<div id="overlay"></div>
<img src="http://images.zaphotel.net/%web_build%/web-gallery/v2/images/page_loader.gif" style="position:absolute; margin: -1500px;" />

<div id="overlay"></div>
<div id="client-ui" >
    <div id="flash-wrapper">
    <div id="flash-container">
        <div id="content" style="width: 400px; margin: 20px auto 0 auto; display: none">

<div class="cbb clearfix">
    <h2 class="title">Please update your Flash Player to the latest version.</h2>
    <div class="box-content">
            <p>You can install and download Adobe Flash Player here: <a href="http://get.adobe.com/flashplayer/">Install flash player</a>. More instructions for installation can be found here: <a href="http://www.adobe.com/products/flashplayer/productinfo/instructions/">More information</a></p>
            <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://images.zaphotel.net/%web_build%/web-gallery/v2/images/client/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
    </div>
</div>

        </div>
        <script type="text/javascript">
            $('content').show();
        </script>
        <noscript>
            <div style="width: 400px; margin: 20px auto 0 auto; text-align: center">
                <p>If you are not automatically redirected, please <a href="/client/nojs">click here</a></p>
            </div>
        </noscript>
    </div>
    </div>
	<div id="content" class="client-content"></div>            
</div>
    <div style="display: none">

<div id="habboCountUpdateTarget">
%hotel_status%
</div>
	<script language="JavaScript" type="text/javascript">
		setTimeout(function() {
			HabboCounter.init(600);
		}, 20000);
	</script>
    </div>
    <script type="text/javascript">
        RightClick.init("flash-wrapper", "flash-container");
        if (window.opener && window.opener != window && typeof window.opener.location.href != "undefined") {
            window.opener.location.replace(window.opener.location.href);
        }
        $(document.body).addClassName("js");
       	HabboClient.startPingListener();
    </script>

<script type="text/javascript">
    HabboView.run();
</script>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15697942-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body> 
</html>