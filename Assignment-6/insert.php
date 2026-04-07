<?php
include 'db.php';

$name = $_POST['name'];
$email = $_POST['email'];
$department = $_POST['department'];
$position = $_POST['position'];
$salary = $_POST['salary'];

$query = "INSERT INTO employees (name, email, department, position, salary)
VALUES ('$name', '$email', '$department', '$position', '$salary')";

mysqli_query($conn, $query);

header("Location: index.php");
?>