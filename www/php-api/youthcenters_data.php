<?php
	// Include config.php
    include_once("connection.php");

	$center_type_id = isset($_GET['center_type_id']) ? mysqli_real_escape_string($link, $_GET['center_type_id']) :  "";
	if(!empty($center_type_id)){
		//$query = "SELECT center_id, center_name, dzongkhag_id, center_area, telephone, email, stakeholder_id FROM tbl_youth_centers WHERE center_type_id=".$center_type_id;
		$query = "SELECT * FROM tbl_youth_centers as Y JOIN tbl_dzongkhags as D ON Y.dzongkhag_id=D.dzongkhag_id JOIN tbl_youth_stakeholders as S ON Y.stakeholder_id=S.stakeholder_id";
		$result = mysqli_query($link, $query);

		$youthcentersData =array();
		while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			extract($row);
			$youthcentersData[] = array("center_id" => $center_id, "centername" => $center_name, "dzongkhagId" => $dzongkhag_id, "centerarea" =>$center_area, "contactnumber" => $telephone, "email" => $email, "stakeholderId" => $stakeholder_id, "dzongkhagName" => "$dzongkhag_name", "stakeholderName" => $stakeholder_name); 
		}
		$json_youthcenters = $youthcentersData;
	}else{
		$json_youthcenters = "CENTER TYPE ID not defined";
	}
	@mysqli_close($link);

	/* Output header */
	header('Content-type: application/json');
	echo json_encode($json_youthcenters);
	// return json_encode($json_counsellor);