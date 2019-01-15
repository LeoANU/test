<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>check</title>
</head>
<body>


<%
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "123456");
 Statement stmt=conn.createStatement();
 String queryNumberSQL="SELECT * from login where (username='"+username+"' or email='"+username+"') and password='"+password+"'";
 ResultSet rs=stmt.executeQuery(queryNumberSQL);
 
 
	 if(rs.next()){
		 String uname=rs.getString(1);
		 
	%>
	<jsp:forward page="CandidateServlet2">
		<jsp:param name="uname" value="<%=uname %>"/>
	</jsp:forward>
	<%
	 }else{
	%>
	<script type="text/javascript" language="javascript">
		alert("failed");
		window.document.location.href="login.jsp";
	</script>
	<%
	 }
	
	 
	 
	rs.close();
	stmt.close();
	conn.close();

	%>

	</body>
	</html>