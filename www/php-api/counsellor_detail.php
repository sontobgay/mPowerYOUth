<?php
	// Include config.php
    include_once("connection.php");

	$counsellor_id = isset($_GET['counsellor_id']) ? mysqli_real_escape_string($link, $_GET['counsellor_id']) :  "";
	if(!empty($counsellor_id)){
		$query = "SELECT counsellor_id, first_name, middle_name, last_name, email_address, contact_numbers, school_name, counsellor_photo FROM tbl_school_counsellors WHERE counsellor_id=".$counsellor_id;
		
		$result = mysqli_query($link, $query);

		$counsellorDetail =array();
		while($row=mysqli_fetch_array($result, MYSQLI_ASSOC)){
			extract($row);
			if($counsellor_photo != ""){
				$photo = $counsellor_photo;
			}else{
				$photo = "http://119.2.120.36/mpoweryouthApi/counsellor_photo/no_pic.png";
			}
			$counsellorDetail[] = array("firstname" => $first_name, "middlename" => $middle_name, "lastname" =>$last_name, "email" => $email_address, "contactnumber" => $contact_numbers, "schoolname" => $school_name, "counsellorphoto" => $photo); 
		}
		$json_counsellor = $counsellorDetail;
	}else{
		$json_counsellor = "Counsellor ID not defined";
	}
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	echo json_encode($json_counsellor);
	// return json_encode($json_counsellor);