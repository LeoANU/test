<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>homepage for administrator</title>
</head>
<body>
Hi, administrator!
<center>
		<br>
		<br>
		<h1 style="color:red">candidate</h1>
		<table border="2">
		<%int i=1; %>
		  <tr>
		    <th>Candidate</th>
		    <th>Email</th>
		    <th>Resume</th>
		  </tr>
		
		  <c:forEach items="${mylist}" var="my" >
			<%if(i%3==1){ %>
			<tr>
			<%} %>
			<%if(i%3!=0){ %>
			<td>${my}</td>
			<%}
			else{ %>
			<td><a href="upload/${my}">${my}</a></td>
			
			<td><a href="InterviewServlet?fname=${my}">interview process</a></td>
			
			<td><a href="delete.jsp?fname=${my}">delete</a></td>
			</tr>
			<%}  
			i++;%>
		  </c:forEach>
		 </table>
</center>



<a href="upload.jsp">add candidate</a>


<a href="login.jsp">log out</a>
</body>
</html>