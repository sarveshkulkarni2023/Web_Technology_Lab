<%@ page import="java.sql.*" %>

<%
try {
    int id = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/college","root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM students_info WHERE stud_id=?"
    );

    ps.setInt(1,id);
    ps.executeUpdate();

    response.sendRedirect("display.jsp");

} catch(Exception e){
    out.println(e);
}
%>