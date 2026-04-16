<%@ page import="java.sql.*" %>

<html>
<head>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-6">

<h2 class="text-2xl font-bold mb-4 text-center text-blue-600">
    Student Records
</h2>

<div class="overflow-x-auto">
<table class="min-w-full bg-white rounded-lg shadow">
<tr class="bg-blue-500 text-white">
    <th class="p-2">ID</th>
    <th class="p-2">Name</th>
    <th class="p-2">Class</th>
    <th class="p-2">Division</th>
    <th class="p-2">City</th>
    <th class="p-2">Action</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/college","root",""
    );

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM students_info");

    while(rs.next()){
%>

<tr class="text-center border-b">
    <td class="p-2"><%= rs.getInt(1) %></td>
    <td class="p-2"><%= rs.getString(2) %></td>
    <td class="p-2"><%= rs.getString(3) %></td>
    <td class="p-2"><%= rs.getString(4) %></td>
    <td class="p-2"><%= rs.getString(5) %></td>

    <td class="p-2">
        <a href="update.jsp?id=<%=rs.getInt(1)%>" 
           class="bg-yellow-400 px-2 py-1 rounded">Edit</a>

        <a href="delete.jsp?id=<%=rs.getInt(1)%>" 
           class="bg-red-500 text-white px-2 py-1 rounded ml-2">
           Delete
        </a>
    </td>
</tr>

<%
    }
} catch(Exception e){
    out.println(e);
}
%>

</table>
</div>

<div class="text-center mt-4">
<a href="index.jsp" class="bg-blue-500 text-white px-4 py-2 rounded">
    Back
</a>
</div>

</body>
</html>