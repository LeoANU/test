<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Object tet =request.getAttribute("tet");

List<String> test=(ArrayList<String>)tet;
String tt=test.get(1);
%>
<%=tet %>
666
<%=tt %>
76667
<%=test %>


</body>
</html>