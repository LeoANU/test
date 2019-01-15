<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>update</title>
</head>
<body>


<%
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 String repassword=request.getParameter("repassword");
 String email=request.getParameter("email");
 String firstname=request.getParameter("firstname");
 String lastname=request.getParameter("lastname");
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "123456");
 Statement stmt=conn.createStatement();
 
 String queryNumberSQL="SELECT * from login where username='"+username+"'";
 ResultSet rs=stmt.executeQuery(queryNumberSQL);
 boolean u=rs.next();
 String sql="SELECT * from login where email='"+email+"'";
 ResultSet rst=stmt.executeQuery(sql); 
 boolean e=rst.next();

	 if(u){
		%>
		<script type="text/javascript" language="javascript">
		alert("username already used");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else if(e){
		%>
		<script type="text/javascript" language="javascript">
		alert("email already used");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else if(!password.equals(repassword)){
		%>
		<script type="text/javascript" language="javascript">
		alert("two different passwords");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else if(!username.matches("[a-zA-Z](.+)") || username.equals("within 16 chars and start with a letter")){
		%>
		<script type="text/javascript" language="javascript">
		alert("not a valid username");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else if(!email.matches(".+@sap\\.com") || email.equals("example@sap.com")){
		%>
		<script type="text/javascript" language="javascript">
		alert("not a valid email");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else if(!firstname.matches("[a-zA-Z]+") || username.equals("within 16 chars and only letters")){
		%>
		<script type="text/javascript" language="javascript">
		alert("not a valid firstname");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else if(!lastname.matches("[a-zA-Z]+") || username.equals("within 16 chars and only letters")){
		%>
		<script type="text/javascript" language="javascript">
		alert("not a valid lastname");
		window.document.location.href="register.jsp";
		</script>
		<%
	 }else{
		String mysql="insert into login(username,password,email,firstname,lastname) values('"+username+"','"+password+"','"+email+"','"+firstname+"','"+lastname+"')";
	 	stmt.executeUpdate(mysql);
	 	
	 	%>
	 	
	 	<script type="text/javascript" language="javascript">
		alert("saved");
		window.document.location.href="login.jsp";
		</script>
	 	<% 

	 }
 
		rst.close();
		rs.close();
		stmt.close();
		conn.close();
 %>
 </body>
 </html>