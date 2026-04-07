<?php
include 'db.php';

$id = $_GET['id'];
$result = mysqli_query($conn, "SELECT * FROM employees WHERE employee_id=$id");
$row = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
<div class="card p-4">

<h4>Edit Employee</h4>

<form method="POST" action="update.php" class="row g-3">

    <input type="hidden" name="id" value="<?php echo $row['employee_id']; ?>">

    <div class="col-md-6">
        <input type="text" value="<?php echo $row['employee_id']; ?>" class="form-control" readonly>
    </div>

    <div class="col-md-6">
        <input type="text" name="name" value="<?php echo $row['name']; ?>" class="form-control">
    </div>

    <div class="col-md-6">
        <input type="email" name="email" value="<?php echo $row['email']; ?>" class="form-control">
    </div>

    <div class="col-md-6">
        <select name="department" class="form-control">
            <option <?php if($row['department']=="IT") echo "selected"; ?>>IT</option>
            <option <?php if($row['department']=="HR") echo "selected"; ?>>HR</option>
        </select>
    </div>

    <div class="col-md-6">
        <select name="position" class="form-control">
            <option <?php if($row['position']=="Manager") echo "selected"; ?>>Manager</option>
            <option <?php if($row['position']=="Developer") echo "selected"; ?>>Developer</option>
        </select>
    </div>

    <div class="col-md-6">
        <input type="number" name="salary" value="<?php echo $row['salary']; ?>" class="form-control">
    </div>

    <button class="btn btn-success">Update</button>

</form>

</div>
</div>

</body>
</html>