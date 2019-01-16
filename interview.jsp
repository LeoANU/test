<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add interview</title>
</head>
<body>

<%
List<String> list=new ArrayList<String>();
String interviewer=request.getParameter("user");
if(interviewer==null){interviewer="";}
String cname=request.getParameter("cname");
String email=request.getParameter("email");
String fname=request.getParameter("fname");




Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "123456");
Statement stmt=conn.createStatement();

String sql="SELECT * from login";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
	 String uname=rs.getString(1);
	 list.add(uname);}


%> 

<center>
		<h1 style="color:red">Add interview</h1>
		
		<form action="addinterview.jsp" method="post">
		<input type="hidden" name="cname" value=<%=cname %>>
		<input type="hidden" name="email" value=<%=email %>>
		<input type="hidden" name="fname" value=<%=fname %>>
		
		<table border="0">
		<tr>
		<td>Interviewer:(select from below)</td>
		
		<td><input type="hidden" name="interviewer" value=<%=interviewer %>><%=interviewer %></td>
		</tr>
		<tr>
		<td></td>
		<td>
		<c:forEach items="<%=list%>" var="st" >
		<a href="interview.jsp?user=<%=interviewer%>*${st}&cname=<%=cname%>&email=<%=email%>&fname=<%=fname%>">${st}</a>
		</c:forEach>
		</td>
		</tr>
		<tr>
		<td>Date:</td>
		<td><input type="text" name="date" style="width:230px" value="in the form yyyyMMdd" maxlength="8" onfocus="if(this.value == 'in the form yyyyMMdd') this.value =''"></td>
		</tr>
		<tr>
		<td>Start time:</td>
		<td><input type="text" name="start" style="width:230px" value="in the form HHmm" maxlength="4" onfocus="if(this.value == 'in the form HHmm') this.value =''"></td>
		</tr>
		<tr>	
		<td>End time:</td>
		<td><input type="text" name="end" style="width:230px" value="in the form HHmm" maxlength="4" onfocus="if(this.value == 'in the form HHmm') this.value =''"></td>
		</tr>
		<tr>	
		<td>Location:</td>
		<td><input type="text" name="location" style="width:230px"></td>
		</tr>			
		</table>
			<input type="submit" value="submit">
		</form>

</center>

</body>
</html>