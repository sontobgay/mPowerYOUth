<?php
	// Include config.php
	include_once('config.php');

	$dzongkhag_id = isset($_GET['dzongkhag_id']) ? mysql_real_escape_string($_GET['dzongkhag_id']) :  "";
	if(!empty($dzongkhag_id)){
		$query = mysql_query("select first_name, middle_name, last_name, email_address, contact_numbers, school_name, counsellor_photo from tbl_school_counsellors where dzongkhag_id=".$dzongkhag_id);
		$result =array();
		while($r = mysql_fetch_array($query)){
			extract($r);
			$result[] = array("firstname" => $first_name, "middlename" => $middle_name, "lastname" =>$last_name, "email" => $email_address, "contactnumber" => $contact_numbers, "schoolname" => $school_name, "counsellorphoto" => $counsellor_photo); 
		}
		$json_counsellor = array("counsellordata" => $result);
	}else{
		$json_counsellor = array("msg" => "Dzongkhag ID not defined");
	}
	@mysql_close($conn);

	/* Output header */
	header('Content-type: application/json');
	echo json_encode($json_counsellor);
	// return json_encode($json_counsellor);