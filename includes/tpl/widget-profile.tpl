<?php
$getUser = dbquery("SELECT id,username,online,account_created,look,motto FROM users WHERE id = '" . $user_id . "' LIMIT 1");
if (mysql_num_rows($getUser) < 0) {
    exit;
} //mysql_num_rows($getUser) < 0
$userData = mysql_fetch_assoc($getUser);
$status   = 'offline';
if ($userData['online'] == "1") {
    $status = 'online';
} //$userData['online'] == "1"
?>
<div class="movable widget ProfileWidget" id="widget-%id%" style=" left: %pos-x%px; top: %pos-y%px; z-index: %pos-z%;"> 
<div class="%skin%"> 
	<div class="widget-corner" id="widget-%id%-handle"> 
		<div class="widget-headline"><h3>
<?php
if (isset($_SESSION['startSessionEditHome'])) {
    if ($_SESSION['startSessionEditHome'] == $user_id) {
        echo '<img src="%web_gallery%/images/myhabbo/icon_edit.gif" width="19" height="18" class="edit-button" id="widget-%id%-edit">
<script type="text/javascript">
var editButtonCallback = function(e) { openEditMenu(e, %id%, "widget", "widget-%id%-edit"); };
Event.observe("widget-%id%-edit", "click", editButtonCallback);
Event.observe("widget-%id%-edit", "editButton:click", editButtonCallback); 
</script>';
    } //$_SESSION['startSessionEditHome'] == $user_id
} //isset($_SESSION['startSessionEditHome'])
?>
		<span class="header-left">&nbsp;</span><span class="header-middle">MY PROFILE</span><span class="header-right">&nbsp;</span></h3>
		</div>	
	</div> 
	<div class="widget-body"> 
		<div class="widget-content"> 
	<div class="profile-info"> 
		<div class="name" style="float: left"> 
		<span class="name-text"><?php
echo clean($userData['username']);
?></span> 
		</div> 
 
		<br class="clear" /> 
 
			<img alt="<?php
echo $status;
?>" src="%web_gallery%/images/myhabbo/profile/habbo_<?php
echo $status;
?>.gif" /> 
		<div class="birthday text"> 
			Created on:		</div> 
		<div class="birthday date"> 
			<?php
echo clean($userData['account_created']);
?>
		</div> 
		<div> 
        	
            
        </div> 
	</div> 
	<div class="profile-figure"> 
			<img alt="<?php
echo clean($userData['username']);
?>" src="http://zaphotel.net/inc/imager.php?figure=<?php
echo clean($userData['look']);
?>&direction=4" /> 
	</div> 
	<div class="profile-motto">
		<?php
echo fixText($userData['motto'], true, false, true, false, false);
?>
			<img id="motto-<?php
echo $userData['id'];
?>-report" class="report-button report-m" alt="report" src="%web_gallery%/images/myhabbo/buttons/report_button.gif" style="display: none;">
		<div class="clear"></div>
	</div>
	
	<br clear="all" style="display: block; height: 1px"/> 

<div id="profile-tags-panel">
    <div id="profile-tag-list">
<div id="profile-tags-container">
<?php
$sql = dbquery("SELECT * FROM user_tags WHERE user_id = '" . $user_id . "'");
if (mysql_num_rows($sql) > 0) {
    while ($data = mysql_fetch_array($sql)) {
?>
    <span class="tag-search-rowholder">
        <a href="http://xukys-hotel.com/tag/<?php
        echo fixText($data['tag'], true, false, true, false, false);
?>" class="tag"><?php
        echo fixText($data['tag'], true, false, true, false, false);
?></a><div class="tag-id" style="display:none"><?php
        echo $data['id'];
?></div><?php
        if (LOGGED_IN) {
            if (USER_ID == $data['user_id']) {
?><img border="0" class="tag-delete-link" onmouseover="this.src='%web_gallery%/images/buttons/tags/tag_button_delete_hi.gif'" onmouseout="this.src='%web_gallery%/images/buttons/tags/tag_button_delete.gif'" src="%web_gallery%/images/buttons/tags/tag_button_delete.gif" /></span><?php
            } //USER_ID == $data['user_id']
        } //LOGGED_IN
?>
<?php
        if (LOGGED_IN) {
            $query = dbquery("SELECT user_id FROM user_tags WHERE tag = '" . $data['tag'] . "' AND user_id = '" . USER_ID . "' AND user_id != '" . $data['user_id'] . "' LIMIT 1");
            if (mysql_num_rows($query) > 0) {
?>
<img id="tag-img-added" border="0" class="tag-none-link" src="%web_gallery%/images/buttons/tags/tag_button_added.gif" /></span>
<?php
            } //mysql_num_rows($query) > 0
            elseif (mysql_num_rows(dbquery("SELECT user_id FROM user_tags WHERE tag = '" . $data['tag'] . "' AND user_id != '" . USER_ID . "' AND user_id = '" . $data['user_id'] . "' LIMIT 1")) > 0) {
?>
<img border="0" class="tag-add-link" onmouseover="this.src='%web_gallery%/images/buttons/tags/tag_button_add_hi.gif'" onmouseout="this.src='%web_gallery%/images/buttons/tags/tag_button_add.gif'" src="%web_gallery%/images/buttons/tags/tag_button_add.gif" /></span>
<?php
            } //mysql_num_rows(dbquery("SELECT user_id FROM user_tags WHERE tag = '" . $data['tag'] . "' AND user_id != '" . USER_ID . "' AND user_id = '" . $data['user_id'] . "' LIMIT 1")) > 0
        } //LOGGED_IN
        else {
?>
				<img border="0" class="tag-none-link" src="%web_gallery%/images/buttons/tags/tag_button_dim.gif"></span>
				<?php
        }
?>
<?php
    } //$data = mysql_fetch_array($sql)
} //mysql_num_rows($sql) > 0
else {
    echo 'You have no tags.';
}
?>
<img id="tag-img-added" border="0" class="tag-none-link" src="%web_gallery%/images/buttons/tags/tag_button_added.gif" style="display:none"/>
</div>

<script type="text/javascript">
    document.observe("dom:loaded", function() {
        TagHelper.setTexts({
            buttonText: "OK",
            tagLimitText: "You've reached the max number of tags."
        });
    });
</script>
    </div>
<div id="profile-tags-status-field">
 <div style="display: block;">
  <div class="content-red">
   <div class="content-red-body">
    <span id="tag-limit-message"><img src="%web_gallery%/images/register/icon_error.gif"> �Has alcanzado el l�mite de 'YoSoys'! Elimina uno antes si quieres a�adir otro nuevo.</span>
    <span id="tag-invalid-message"><img src="%web_gallery%/images/register/icon_error.gif"> 'YoSoy' no v�lido</span>
   </div>
  </div>
 <div class="content-red-bottom">
  <div class="content-red-bottom-body"></div>
 </div>
 </div>
</div>
        <?php
if (LOGGED_IN) {
    if (USER_ID == $user_id) {
?>
		<div class="profile-add-tag">
            <input type="text" id="profile-add-tag-input" maxlength="30" /><br clear="all" />
            <a href="#" class="new-button" style="float:left;margin:5px 0 0 0;" id="profile-add-tag"><b>Add tag</b><i></i></a>
        </div>
		<?php
    } //USER_ID == $user_id
} //LOGGED_IN
?>
    </div>


    <script type="text/javascript"> 
		document.observe("dom:loaded", function() {
			new ProfileWidget('<?php
echo $userData['id'];
?>', '<?php
echo USER_ID;
?>', {
				headerText: "Are you sure?",
				messageText: "Are you sure you want <strong\><?php
echo fixText($userData['username'], true, false, true, false, false);
?></strong\> to be your friend?",
				loginText: "You have to sign in first!",
				buttonText: "OK",
				cancelButtonText: "Cancel"
			});
		});
	</script> 
		<div class="clear"></div> 
		</div> 
	</div> 
</div> 
</div> 