<?php
include 'db.php';

$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST['email'];
$department = $_POST['department'];
$position = $_POST['position'];
$salary = $_POST['salary'];

$query = "UPDATE employees 
SET name='$name', email='$email', department='$department',
position='$position', salary='$salary'
WHERE employee_id=$id";

mysqli_query($conn, $query);

header("Location: index.php");
?>