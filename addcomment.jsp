<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>add</title>
</head>
<body>



<%

String comment=request.getParameter("comment");
String uname=request.getParameter("uname");
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "123456");
Statement stmt=conn.createStatement();
String sql="update process set comment=concat(ifnull(comment,''),'*','"+comment+"','\r\n') where id='"+id+"'";
stmt.executeUpdate(sql);
%>

<jsp:forward page="CandidateServlet2">
<jsp:param name="uname" value="<%=uname %>"/>
</jsp:forward>
<% 
stmt.close();
conn.close();
 %>
 </body>
 </html>