<?php
$conn = mysqli_connect("localhost:3307", "root", "", "employee_db");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>