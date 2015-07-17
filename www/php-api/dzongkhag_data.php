<?php
	// Include config.php
    include_once("connection.php");

    $query = "SELECT * FROM tbl_dzongkhags";

	$result = mysqli_query($link, $query);

	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
		extract($row);

		$sql = "SELECT COUNT(*) as CounsellorCount FROM tbl_school_counsellors WHERE dzongkhag_id=$dzongkhag_id";

		$sqlResult = mysqli_query($link, $sql);

		$record = mysqli_fetch_array($sqlResult, MYSQLI_ASSOC);

		$json_dzongkhag[] = array("dzongkhag_id" => $dzongkhag_id, "dzongkhag_name" => $dzongkhag_name, "counsellorCount" => $record['CounsellorCount']);
	}
	
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	//echo json_encode($json_dzongkhag);
	echo json_encode($json_dzongkhag);