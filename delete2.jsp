<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");



Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "123456");
Statement stmt=conn.createStatement();


String mysql="delete from interview where id='"+id+"'";
stmt.executeUpdate(mysql);
stmt.close();
conn.close();
%>
<jsp:forward page="InterviewServlet"></jsp:forward>
	
</body>
</html>