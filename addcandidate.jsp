<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>add</title>
</head>
<body>


<%
String name=request.getParameter("name");
String email=request.getParameter("email");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "123456");
Statement stmt=conn.createStatement();
String sql="insert into candidate(candidate,email) values('"+name+"','"+email+"')";
stmt.executeUpdate(sql);
%>
<jsp:forward page="Home2.jsp"></jsp:forward>
<% 
stmt.close();
conn.close();
 %>
 </body>
 </html>