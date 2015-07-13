<?php
	// Include config.php
    include_once("connection.php");

    $query = "SELECT * FROM tbl_dzongkhags";

	$result = mysqli_query($link, $query);

	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
		extract($row);
		$json_dzongkhag[] = array("dzongkhag_id" => $dzongkhag_id, "dzongkhag_name" => $dzongkhag_name);
	}
	
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	//echo json_encode($json_dzongkhag);
	echo json_encode($json_dzongkhag);