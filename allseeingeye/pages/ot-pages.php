<?php

if (!defined('IN_HK') || !IN_HK)
{
	exit;
}

if (!HK_LOGGED_IN || !$users->hasFuse(HK_USER_ID, 'fuse_housekeeping_catalog'))
{
	exit;
}

if (isset($_GET['unsetCat']))
{
	unset($_SESSION['OT_PAGE_CAT']);
}

if (!isset($_SESSION['OT_PAGE_CAT']))
{
	if (isset($_POST['OT_PAGE_CAT']))
	{
		$_SESSION['OT_PAGE_CAT'] = $_POST['OT_PAGE_CAT'];
	}
	else
	{
		require_once "top.php";
		
		echo '<p>Select a category to edit:</p>';
		echo '<form method="post">';
		echo '<select name="OT_PAGE_CAT">';
		echo '<option value="3">Furni Shop</option>';
		echo '<option value="91">Staff Pages</option>';
		echo '<option value="4">Pixel shop</option>';
		echo '<option value="6">Trax Shop</option>';
		echo '<option value="5">Habbo Club</option>';		
		echo '<option value="-1">Root pages</option>';		
		echo '</select>';
		echo '<input type="submit" value="Go">';
		echo '</form>';
		
		require_once "bottom.php";
		
		exit;
	}
}

$newOrderId = mysql_result(dbquery("SELECT order_num FROM catalog_pages WHERE parent_id = '" . $_SESSION['OT_PAGE_CAT'] . "' ORDER BY order_num DESC"), 0) + 1;

if (!isset($_GET['sq']))
{
	$_GET['sq'] = "";
}

if (isset($_GET['new']))
{
	dbquery("INSERT INTO catalog_pages (parent_id,caption,icon_color,icon_image,visible,enabled,order_num,page_layout,page_text_details,page_headline) VALUES ('" . $_SESSION['OT_PAGE_CAT'] . "','', '0', '1', '1', '1', '" . $newOrderId . "', 'default_3x3','Click on an item for more information.','catalog_frontpage_headline2_en')");
	fMessage('ok', 'New page stub added');
	
	$newId = mysql_result(dbquery("SELECT id FROM catalog_pages ORDER BY id DESC LIMIT 1"), 0);
	
	header("Location: ./index.php?_cmd=ot-pages&edit=" . $newId);
	exit;
}

if (isset($_GET['del']))
{
	fMessage('error', 'Are you <b>SURE</b> you want to delete that page? This CAN NOT be reversed.<br /><a href="index.php?_cmd=ot-pages&realdel=' . $_GET['del'] . '">YES, DELETE IT</a> - or - <a href="index.php?_cmd=ot-pages">CANCEL</a>');
}

if (isset($_GET['realdel']))
{
	fMessage('ok', 'Page deleted!');
	dbquery("DELETE FROM catalog_pages WHERE id = '" . intval($_GET['realdel']) . "' AND parent_id = '" . $_SESSION['OT_PAGE_CAT'] . "' LIMIT 1");
	header("Location: ./index.php?_cmd=ot-pages&");
	exit;	
}

$data = null;
$lockedVars = array('id','parent_id','type','gonew');

if (isset($_GET['edit']))
{
	$i = intval($_GET['edit']);	
	$get = dbquery("SELECT * FROM catalog_pages WHERE id = '" . $i . "' AND parent_id = '" . $_SESSION['OT_PAGE_CAT'] . "' LIMIT 1");
	
	if (mysql_num_rows($get) == 0)
	{
		fMessage('error', 'Oops! Invalid item.');
	}
	else
	{
		$data = mysql_fetch_assoc($get);
		
		if (isset($_POST['caption']))
		{
			$i = 0;
			
			$qB = '';

			foreach ($_POST as $key => $value)
			{
				$i++;
				
				if (in_array($key, $lockedVars))
				{
					continue;
				}
				
				if ($i > 1)
				{
					$qB .= ',';
				}
				
				$qB .= $key . " = '" . filter($value) . "'";
			}
			
			dbquery("UPDATE catalog_pages SET " . $qB . " WHERE id = '" . intval($_GET['edit']) . "' LIMIT 1");
			fMessage('ok', 'Updated item successfully');
			
			if (isset($_POST['gonew']) && $_POST['gonew'] == "y")
			{
				header("Location: ./index.php?_cmd=ot-pages&new");
			}
			else
			{
				header("Location: ./index.php?_cmd=ot-pages&edit=" . $data['id']);
			}
			
			exit;
		}
	}
}

if (isset($_POST['update-order']))
{
	foreach ($_POST as $key => $value)
	{
		if ($key == 'update-order')
		{
			continue;
		}
	
		if (substr($key, 0, 4) != 'ord-')
		{
			die("Invalid: " . $key);
			continue;
		}
		
		$id = intval(substr($key, 4));

		dbquery("UPDATE catalog_pages SET order_num = '" . intval($value) . "' WHERE id = '" . $id .  "' AND parent_id = '" . $_SESSION['OT_PAGE_CAT'] . "' LIMIT 1");
	}
	
	fMessage('ok', 'Updated page order.');
}

require_once "top.php";

echo '<h1>Manage catalogue pages</h1>';

echo '<br />Editing category: <b>' . mysql_result(dbquery("SELECT caption FROM catalog_pages WHERE id = '" . $_SESSION['OT_PAGE_CAT'] . "' LIMIT 1"), 0) . '</b> (<a href="index.php?_cmd=ot-pages&unsetCat">Change</a>)';
echo '<br /><br /><hr /><br />';

if ($data != null)
{
	echo '<hr /><br />';
	echo '<small><b>Editing item</b></small>';
	echo '<h2><b>' . $data['caption'] . '</b></h2><br />';
	echo '<form method="post">';
	
	foreach ($data as $key => $value)
	{
		$lck = false;
		
		if (in_array($key, $lockedVars))
		{
			$lck = true;
		}

		echo $key . ':<br /><textarea ';

		if ($lck)
		{
			echo ' ';
		}

		echo 'name="' . $key . '" cols="50" rows="4">' . $value . '</textarea><br /><br />';
	}
	
	echo '<input type="checkbox" name="gonew" value="y" checked> Create & go to new stub after saving<br />';
	echo '<input type="submit" value="Save">&nbsp;';
	echo '<input type="button" value="Cancel" onclick="window.location=\'index.php?_cmd=ot-pages&sq=' . $_GET['sq'] . '\';">';
	echo '</form>';
	echo '<br /><hr /><Br />';
}

$getPages = dbquery("SELECT * FROM catalog_pages WHERE parent_id = '" . $_SESSION['OT_PAGE_CAT'] . "' ORDER BY order_num ASC");					

echo '<a href="index.php?_cmd=ot-pages&new"><b>Generate new page stub</b></a><br /><br />';

echo '<table width="100%" border="1" style="text-align: center;">
<thead style="font-weight: bold; font-size: 110%;">
	<td>ID</td>
	<td>Caption</td>
	<td>Visible</td>
	<td>Enabled</td>
	<td>Layout</td>
	<td>Order</td>
	<td>Options</td>
</thead>
<form method="post">';

while ($page = mysql_fetch_assoc($getPages))
{
	echo '<tr>
	<td>' . $page['id'] . '</td>
	<td>' . $page['caption'] . '</td>
	<td>' . $page['visible'] . '</td>
	<td>' . $page['enabled'] . '</td>
	<td>' . $page['page_layout'] . '</td>
	<td><input style="text-align: center; font-weight: bold; margin: 2px;" type="text" size="3" value="' . $page['order_num'] . '" name="ord-' . $page['id'] . '"></td>
	<td><a href="index.php?_cmd=ot-pages&edit=' . $page['id'] . '">[View detail/edit]</a> <a href="index.php?_cmd=ot-pages&del=' . $page['id'] . '">[Remove]</a></td>
	</tr>';
}

echo '</table><br /><input type="submit" name="update-order" value="Save page order"> or <input type="button" value="Cancel/Reset" onclick="location.reload(true);"></form><br /><br />';

echo '<a href="index.php?_cmd=ot-pages&new"><b>Generate new page stub</b></a>';

echo '</div>
</div>';

require_once "bottom.php";

?>					