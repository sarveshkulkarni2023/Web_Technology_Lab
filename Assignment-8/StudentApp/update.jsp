<%@ page import="java.sql.*" %>

<html>
<head>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex justify-center items-center h-screen">

<%
String id = request.getParameter("id");

if(request.getMethod().equalsIgnoreCase("GET")){
%>

<form method="post" class="bg-white p-6 rounded shadow w-96">
    <h2 class="text-xl font-bold mb-4 text-center">Update Student</h2>

    <input type="hidden" name="id" value="<%=id%>">

    <input type="text" name="name" placeholder="Name" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="class" placeholder="Class" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="division" placeholder="Division" class="w-full p-2 mb-3 border rounded">
    <input type="text" name="city" placeholder="City" class="w-full p-2 mb-3 border rounded">

    <button class="bg-green-500 text-white w-full py-2 rounded">
        Update
    </button>
</form>

<%
} else {

    String name = request.getParameter("name");
    String cls = request.getParameter("class");
    String div = request.getParameter("division");
    String city = request.getParameter("city");

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/college","root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "UPDATE students_info SET stud_name=?, class=?, division=?, city=? WHERE stud_id=?"
    );

    ps.setString(1,name);
    ps.setString(2,cls);
    ps.setString(3,div);
    ps.setString(4,city);
    ps.setInt(5,Integer.parseInt(id));

    ps.executeUpdate();

    response.sendRedirect("display.jsp");
}
%>

</body>
</html>