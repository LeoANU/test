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
		<h1 style="color:red">interview</h1>
		<table border="2">
		<%int i=1; %>
		  <tr>
		    <th>Interviewer</th>
		    <th>Date</th>
		    <th>Start time</th>
		    <th>End time</th>
		    <th>Location</th>
		    <th>Comment</th>
		  </tr>
		
		  <c:forEach items="${mylist}" var="my" >
			<%if(i%6==1){ %>
			<tr>
			<%} %>
			<td>${my}</td>
			<%
			if(i%6==0){ %>
			</tr>
			<%} 
			i++;%>
		  </c:forEach>
		 </table>
</center>

<a href="CandidateServlet">back</a>

</body>
</html>