<?php
ob_start();
session_start();// Starting Session
/* Attempt MySQL server connection */
$link = mysqli_connect("localhost", "root", "root", "youth_db");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>