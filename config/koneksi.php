<?php
date_default_timezone_set('Asia/Jakarta');
$server = "localhost";
$username = "root";
$password = "";
$database = "sms_gammu";

($GLOBALS["___mysqli_ston"] = mysqli_connect($server, $username, $password));
mysqli_select_db($GLOBALS["___mysqli_ston"], $database);

function anti_injection($data){
  $filter = mysqli_real_escape_string($GLOBALS["___mysqli_ston"], stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  return $filter;
}

function cek_session_admin(){
	$level = $_SESSION['level'];
	if ($level != 'superuser'){
		echo "<script>document.location='index.php';</script>";
	}
}
?>
