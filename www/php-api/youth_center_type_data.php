<?php
	// Include config.php
    include_once("connection.php");
    
    $query = "select * from tbl_youth_center_types";

	$result = mysqli_query($link, $query);

	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
		extract($row);
		$json_youth_center_types[] = array("center_type_id" => $center_type_id, "center_type_name" => $center_type_name);
	}
	
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	//echo json_encode($json_dzongkhag);
	echo json_encode($json_youth_center_types);
?>
