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
 boolean flag=false;
 if(rs.next()){
	 flag=true;
	 }else{
	 flag=false;
	 }

	 if(flag){
	%>
	<jsp:forward page="Home2.jsp"></jsp:forward>
	<%
	 }else{
	%>
	<jsp:forward page="login_failed.jsp"></jsp:forward>
	<%
	 }
	
	rs.close();
	stmt.close();
	conn.close();

	%>

	</body>
	</html>