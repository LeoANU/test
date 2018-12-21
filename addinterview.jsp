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
String interviewer=request.getParameter("interviewer");
String candidate=request.getParameter("candidate");
String time=request.getParameter("time");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "123456");
Statement stmt=conn.createStatement();
String sql="insert into interview(interviewer,candidate,time) values('"+interviewer+"','"+candidate+"','"+time+"')";
stmt.executeUpdate(sql);
%>
<jsp:forward page="InterviewServlet"></jsp:forward>
<% 
stmt.close();
conn.close();
 %>
 </body>
 </html>