<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in for administrator</title>
</head>
<body>
	<center>
		<h1 style="color:red">Admin sign in</h1>
		
		
		<form action="admincheck.jsp" method="post">
		<table border="0">
		<tr>
			<td>Account:</td>
			<td><input type="text" name="account" style="width:200px" value="within 30 chars" maxlength="30" onfocus="if(this.value == 'within 30 chars') this.value =''"></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" style="width:200px" maxlength="16" ></td>
		</tr>

		</table>
			<input type="submit" value="login">
			<input type="reset" value="reset">
		</form>
			
	</center>
	
	<a href="login.jsp">back</a>

</body>
</html>