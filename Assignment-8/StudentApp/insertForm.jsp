<html>
<head>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex justify-center items-center h-screen">

<form action="insert.jsp" class="bg-white p-6 rounded-xl shadow-lg w-96">
    <h2 class="text-xl font-bold mb-4 text-center">Add Student</h2>

    <input type="text" name="id" placeholder="ID" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="name" placeholder="Name" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="class" placeholder="Class" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="division" placeholder="Division" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="city" placeholder="City" class="w-full p-2 mb-3 border rounded">

    <button class="bg-blue-500 text-white w-full py-2 rounded hover:bg-blue-600">
        Insert
    </button>
</form>

</body>
</html>