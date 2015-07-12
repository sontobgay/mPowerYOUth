<?php
$conn = mysql_connect("localhost", "root", "root");
mysql_select_db('youth_db', $conn);

// Check connection
// if ($conn->connect_error) {
//     die("Connection failed: " . $conn->connect_error);
// } 
// echo "Connected successfully!";
