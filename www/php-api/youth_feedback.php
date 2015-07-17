<?php
    include_once("connection.php");

	if (isset($_SERVER['HTTP_ORIGIN'])) {
        header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Max-Age: 86400');    // cache for 1 day
    }

    // Access-Control headers are received during OPTIONS requests
    if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
            header("Access-Control-Allow-Headers:{$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

        exit(0);
    }

	
	$postdata = file_get_contents("php://input");
	if (isset($postdata) && !empty($postdata)) {
		$data = json_decode($postdata);
	
		// Escape user inputs for security
		$name = mysqli_real_escape_string($link, $data->name);
		$phone = mysqli_real_escape_string($link, $data->mobile_number);
		$email = mysqli_real_escape_string($link, $data->email_address);
		$feedback = mysqli_real_escape_string($link, $data->feedback);
		 
		// attempt insert query execution
 		$sql = "INSERT INTO tbl_youth_feedbacks(youth_name,youth_phone,youth_email,feedback_details, feedback_date) 
 				values('$name',
 					   '$phone',
 					   '$email',
 					   '$feedback',
 					   NOW())";

		if(mysqli_query($link, $sql)){
		    echo "Records added successfully.";
		} else{
		    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
		}
	}
	else {
		echo "Not called properly with username parameter!";
	}
	// close connection
	mysqli_close($link);
?>