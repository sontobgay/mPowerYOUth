<?php
include "config.php";

	mysql_query("INSERT INTO tbl_test(name) values(".$_POST['name'].")");

	// while($r = mysql_fetch_array($query)){
	// 	extract($r);
	// 	$json_dzongkhag[] = array("dzongkhag_id" => $dzongkhag_id, "dzongkhag_name" => $dzongkhag_name);
	// }
    echo "data inserted";
	@mysql_close($conn);

	?>