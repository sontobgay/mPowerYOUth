<?php
	// Include config.php
    include_once("connection.php");

    $query = "SELECT * FROM tbl_counselling_issues";

	$result = mysqli_query($link, $query);

	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
		extract($row);
		$json_issue[] = array("issue_id" => $issue_id, "issue_name" => $issue_name);
	}
	
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	echo json_encode($json_issue);