<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			
			</tr>
			<%}  
			i++;%>
		  </c:forEach>
		 </table>
</center>

<a href="Home.jsp">back</a>
 
</body>
</html>