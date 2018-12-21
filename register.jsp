<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
<center>
		<h1 style="color:red">Register</h1>
		
		<form action="update.jsp" method="post">
		<table border="0">
		<tr>
		<td>Username:</td>
		<td><input type="text" name="username" style="width:230px" value="within 16 chars and start with a letter" maxlength="16" onfocus="if(this.value == 'within 16 chars and start with a letter') this.value =''"></td>
		</tr>
		<tr>
		<td>Password:</td>
		<td><input type="password" name="password" style="width:230px" maxlength="16"></td>
		</tr>
		<tr>
		<td>Retype Password:</td>
		<td><input type="password" name="repassword" style="width:230px" maxlength="16"></td>
		</tr>
		<tr>
		<td>Email:</td>
		<td><input type="text" name="email" style="width:230px" value="example@sap.com" maxlength="30" onfocus="if(this.value == 'example@sap.com') this.value =''"></td>
		</tr>
		<tr>
		<td>First name:</td>
		<td><input type="text" name="firstname" style="width:230px" value="within 16 chars and only letters" maxlength="16" onfocus="if(this.value == 'within 16 chars and only letters') this.value =''"></td>
		</tr>
		<tr>
		<td>Last name:</td>
		<td><input type="text" name="lastname" style="width:230px" value="within 16 chars and only letters" maxlength="16" onfocus="if(this.value == 'within 16 chars and only letters') this.value =''"></td>
		</tr>		
		</table>
			<input type="submit" value="register">
		</form>

</center>
</body>
</html>