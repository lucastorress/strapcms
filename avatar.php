<?php
/*=======================================================================
| StrapCMS 2.2 - Perfect handshaking with the game for PhoenixEmu
| #######################################################################
| UberCMS - Advanced Website and Content Management System for uberEmu
| #######################################################################
| Copyright (c) 2010, Roy 'Meth0d'
| http://www.meth0d.org
| Copyright (c) 2012, Jonteh
| http://zaphotel.net
| Copyright (c) 2012, J�r�my 'Emetophobic'
| http://strapfamily.com
| Copyright (c) 2012, Walid 'Jack'
| http://retrodev.fr
| Copyright (c) 2012, Anthony 'Anthony93260'
| http://cola-hotel.net
| #######################################################################
| StrapCMS is part of StrapFamily Distribution, coded part by Jonteh
| from uberCMS 2.0.1, coded part by Jack and Anthony93260.
| #######################################################################
| This program is free software: you can redistribute it and/or modify
| it under the terms of the GNU General Public License as published by
| the Free Software Foundation, either version 3 of the License, or
| (at your option) any later version.
| #######################################################################
| This program is distributed in the hope that it will be useful,
| but WITHOUT ANY WARRANTY; without even the implied warranty of
| MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
| GNU General Public License for more details.
\======================================================================*/
	
	if(!isset($_GET["figure"])) {
		exit('You need to specify an image.');
	}
	
	$figureData = $_GET["figure"];
	$figureDir = "cachedAvatars/";
	$opened = fopen("http://habbo.com/habbo-imaging/avatarimage?figure=" . $figureData, 'r');
	
	if(!file_exists($figureDir . $figureData . ".png")) {
		if($opened) {
			file_put_contents($figureDir . $figureData . ".png", $opened);
			$avatarImage = file_get_contents($figureDir . $figureData . ".png");
			fclose($opened);
		}
	}
	else {
		$avatarImage = file_get_contents($figureDir . $figureData . ".png");
	}
		
	header("Content-Type: image/png");
	exit($avatarImage);
	
?>