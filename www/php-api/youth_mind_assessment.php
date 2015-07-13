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
		$gender = mysqli_real_escape_string($link, $data->gender);
		$talk_counsellor = mysqli_real_escape_string($link, $data->talk_counsellor);
		$feeling_lonely = mysqli_real_escape_string($link, $data->feeling_lonely);
		$location = mysqli_real_escape_string($link, $data->location);
		$thoughts = mysqli_real_escape_string($link, $data->thoughts);
		 
		// attempt insert query execution
 		$sql = "INSERT INTO tbl_youth_mind_assessment(name,talk_counsellor,feeling_lonely,youth_thoughts,location_now,gender) 
 				VALUES('$name',
 					   '$talk_counsellor',
 					   '$feeling_lonely',
 					   '$thoughts',
 					   '$location',
 					   '$gender')";

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