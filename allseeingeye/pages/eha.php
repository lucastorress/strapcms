<?php

if (!defined('IN_HK') || !IN_HK)
{
	exit;
}

if (!HK_LOGGED_IN || !$users->hasFuse(USER_ID, 'fuse_housekeeping_moderation'))
{
	exit;
}

if (isset($_POST['sent']))
{
	fMessage('ok', 'Message sent.');
	$hmsg = "Search " . USER_NAME . " for events! Win some rares!";
	$core->Mus('ha', $hmsg); 
}

require_once "top.php";

?>			

<h1>Events alert</h1>

<br />

<p>
	Notify the current users online that you are hosting events. Helpful for moderators who do not have hotel alert priveledges.
</p>

<br />

<p>
<form method="post">

<input type="submit" value="Alert users for your events" name='sent'>

</form>
</p>
<?php

require_once "bottom.php";

?>