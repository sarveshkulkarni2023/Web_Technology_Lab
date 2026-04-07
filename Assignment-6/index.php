<?php include 'db.php'; ?>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <h2 class="text-center mb-4">Employee Management System</h2>

    <!-- Add Employee Form -->
    <div class="card p-4 mb-4">
        <h4>Add Employee</h4>

        <form method="POST" action="insert.php" class="row g-3">

            <div class="col-md-6">
                <input type="text" name="name" class="form-control" placeholder="Name" required>
            </div>

            <div class="col-md-6">
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>

            <div class="col-md-4">
                <select name="department" class="form-control">
                    <option>IT</option>
                    <option>HR</option>
                    <option>Finance</option>
                    <option>Marketing</option>
                </select>
            </div>

            <div class="col-md-4">
                <select name="position" class="form-control">
                    <option>Manager</option>
                    <option>Developer</option>
                    <option>Designer</option>
                    <option>Intern</option>
                </select>
            </div>

            <div class="col-md-4">
                <input type="number" name="salary" class="form-control" placeholder="Salary" required>
            </div>

            <div class="col-md-12">
                <button class="btn btn-primary w-100">Add Employee</button>
            </div>

        </form>
    </div>

    <!-- Employee Table -->
    <div class="card p-4">
        <h4>Employee List</h4>

        <table class="table table-bordered mt-3">
            <tr>
                <th>SR NO</th>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Position</th>
                <th>Salary</th>
                <th>Action</th>
            </tr>

<?php
$result = mysqli_query($conn, "SELECT * FROM employees");
$sr_no = 1;

while ($row = mysqli_fetch_assoc($result)) {
?>
<tr>
    <td><?php echo $sr_no++; ?></td>
    <td><?php echo $row['employee_id']; ?></td>
    <td><?php echo $row['name']; ?></td>
    <td><?php echo $row['email']; ?></td>
    <td><?php echo $row['department']; ?></td>
    <td><?php echo $row['position']; ?></td>
    <td><?php echo $row['salary']; ?></td>
    <td>
        <a href="edit.php?id=<?php echo $row['employee_id']; ?>" class="btn btn-warning btn-sm">Edit</a>
        <a href="delete.php?id=<?php echo $row['employee_id']; ?>" class="btn btn-danger btn-sm">Delete</a>
    </td>
</tr>
<?php } ?>

        </table>
    </div>

</div>

</body>
</html>