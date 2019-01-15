<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>check</title>
</head>
<body>


<%
 String account=request.getParameter("account");
 String password=request.getParameter("password");

 Class.forName("com.mysql.jdbc.Driver");
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin", "root", "123456");
 Statement stmt=conn.createStatement();
 String queryNumberSQL="SELECT * from admin where (account='"+account+"' or email='"+account+"') and password='"+password+"'";
 ResultSet rs=stmt.executeQuery(queryNumberSQL);
 
 if(rs.next()){
	 String uname=rs.getString(1);
	%>
	<jsp:forward page="CandidateServlet"></jsp:forward>
	<%
	 }else{
	%>
	<script type="text/javascript" language="javascript">
		alert("failed");
		window.document.location.href="adminlogin.jsp";
	</script>
	<%
	 }
	
	rs.close();
	stmt.close();
	conn.close();

	%>

	</body>
	</html>