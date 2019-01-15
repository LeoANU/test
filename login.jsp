<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
</head>
<body>

	<center>
		<a href="adminlogin.jsp">admin</a>
		<br>
		<h1 style="color:red">Sign in</h1>

		<form action="check.jsp" method="post">
		<table border="0">
		<tr>
			<td>Username(or email):</td>
			<td><input type="text" name="username" style="width:200px" value="within 30 chars" maxlength="30" onfocus="if(this.value == 'within 30 chars') this.value =''"></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" style="width:200px" maxlength="16"></td>
		</tr>

		</table>
			<input type="submit" value="login">
			<input type="reset" value="reset">
			<input type="button" value="register" onclick="window.open('register.jsp')">
		</form>
			
	</center>



</body>
</html>