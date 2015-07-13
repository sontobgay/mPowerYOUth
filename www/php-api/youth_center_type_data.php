<?php
	// Include config.php
	include_once('config.php');

	$query = mysql_query("select * from tbl_youth_center_types");

	while($r = mysql_fetch_array($query)){
		extract($r);
		$json_youth_center_types[] = array("center_type_id" => $center_type_id, "center_type_name" => $center_type_name);
		
	}
	
	// echo json_encode($json_dzongkhag);
	
	@mysql_close($conn);

	/* Output header */
	header('Content-type: application/json');
	//echo json_encode($json_dzongkhag);
	echo json_encode($json_youth_center_types);