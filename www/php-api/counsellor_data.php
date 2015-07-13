<?php
	// Include config.php
    include_once("connection.php");

	$dzongkhag_id = isset($_GET['dzongkhag_id']) ? mysqli_real_escape_string($link, $_GET['dzongkhag_id']) :  "";
	if(!empty($dzongkhag_id)){
		$query = "SELECT first_name, middle_name, last_name, email_address, contact_numbers, school_name, counsellor_photo FROM tbl_school_counsellors WHERE dzongkhag_id=".$dzongkhag_id;
		
		$result = mysqli_query($link, $query);

		$counsellorData =array();
		while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			extract($row);
			$counsellorData[] = array("firstname" => $first_name, "middlename" => $middle_name, "lastname" =>$last_name, "email" => $email_address, "contactnumber" => $contact_numbers, "schoolname" => $school_name, "counsellorphoto" => $counsellor_photo); 
		}
		$json_counsellor = array("counsellordata" => $counsellorData);
	}else{
		$json_counsellor = array("msg" => "Dzongkhag ID not defined");
	}
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	echo json_encode($json_counsellor);
	// return json_encode($json_counsellor);