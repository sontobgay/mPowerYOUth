<?php
	// Include config.php
	include_once('config.php');

	$query = mysql_query("select * from tbl_dzongkhags");

	while($r = mysql_fetch_array($query)){
		extract($r);
		$json_dzongkhag[] = array("dzongkhag_id" => $dzongkhag_id, "dzongkhag_name" => $dzongkhag_name);
		// $json_dzongkhag[]=$r;
	}
	
	// echo json_encode($json_dzongkhag);
	
	@mysql_close($conn);

	/* Output header */
	header('Content-type: application/json');
	//echo json_encode($json_dzongkhag);
	echo json_encode($json_dzongkhag);