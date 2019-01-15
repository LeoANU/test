<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homepage</title>
</head>
<body>
Hi user
<%
String uname=request.getParameter("uname");
out.print(uname);
%>

<center>
		<br>
		<br>
		<h1 style="color:red">candidate</h1>
		<table border="2">
		<%int i=1; %>
		  <tr>
		    <th>Candidate</th>
		    <th>Email</th>
		    <th>Date</th>
		    <th>Start time</th>
		    <th>End time</th>
		    <th>Location</th>
		    <th>Interviewer</th>
		    <th>Resume</th>
		    <th>comment</th>
		  </tr>
		
		  <c:forEach items="${plist}" var="pl" >
			<%if(i%10==1){ %>
			<tr>
			<%} %>
			<%if(i%10==8){ %>
			<td><a href="upload/${pl}">${pl}</a></td>
			<%}else if(i%10==0){ %>
			<td><a href="comment.jsp?uname=<%=uname %>&id=${pl}">add comment</a></td>
			</tr>
			
			<%}else{ %>
			<td>${pl}</td>
			<%}  
			i++;%>
		  </c:forEach>
		 </table>
</center>

<a href="login.jsp">log out</a>

</body>
</html>