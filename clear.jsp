<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String fname=request.getParameter("fname");
String cname=request.getParameter("cname");
System.out.println(cname);
System.out.println(email);
System.out.println(fname);
%>


	<jsp:forward page="interview.jsp">
		<jsp:param name="email" value="<%=email %>"/>
		<jsp:param name="fname" value="<%=fname %>"/>
		<jsp:param name="cname" value="<%=cname %>"/>
	</jsp:forward>
</body>
</html>