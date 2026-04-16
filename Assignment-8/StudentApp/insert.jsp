<%@ page import="java.sql.*" %>

<%
try {
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String cls = request.getParameter("class");
    String div = request.getParameter("division");
    String city = request.getParameter("city");

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/college?useSSL=false&serverTimezone=UTC",
        "root", ""
    );

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO students_info VALUES(?,?,?,?,?)"
    );

    ps.setInt(1,id);
    ps.setString(2,name);
    ps.setString(3,cls);
    ps.setString(4,div);
    ps.setString(5,city);

    ps.executeUpdate();

    response.sendRedirect("display.jsp");

} catch(Exception e){
    out.println(e);
}
%>