<?php require_once "global.php"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
<head> 


	<meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
	<title>%siteName%: Maintenance Break</title> 
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script> 
	<script type="text/javascript" src="http://error.habbo.com/uk/js/jquery.tweet.js"></script> 
	
	<link href="http://error.habbo.com/uk/style/maintenance.css" rel="stylesheet" type="text/css" /> 
	
	<style type="text/css">
	#container { margin-top: 20px; }
	h1 span { height: 49px !important; width: 200px !important; background-image: url('%www%/images/logo.png') !important; }
	</style>
	
</head> 
<body> 
 
<div id="container"> 
	<div id="content"> 
		<div id="header" class="clearfix"> 
			<h1><span></span></h1> 
		</div> 
		<div id="process-content"> 
 
<div class="fireman"> 
 
<h1>Maintenance break!</h1> 
 
<p> 
%hotel_on_maintenance%
<p> 
 
</div> 
 
<div class="tweet-container"> 
 
<h2>Updates via Twitter</h2> 
 
<div class="tweet"><center>
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'profile',
  rpp: 3,
  interval: 6000,
  width: 275,
  height: 200,
  theme: {
    shell: {
      background: '#ffffff',
      color: '#000000'
    },
    tweets: {
      background: '#edf4ff',
      color: '#332d33',
      links: '#0788eb'
    }
  },
  features: {
    scrollbar: false,
    loop: false,
    live: true,
    hashtags: true,
    timestamp: true,
    avatars: true,
    behavior: 'all'
  }
}).render().setUser('%twitter%').start();
</script>
 </center>
</div>
 
<div id="footer"> 

</div> 
 
		</div> 
	</div> 
</div> 
 

</body> 
</html> 