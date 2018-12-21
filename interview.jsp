<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>interview</title>
</head>
<body>
<center>
		<h1 style="color:red">Add interview</h1>
		
		<form action="addinterview.jsp" method="post">
		<table border="0">
		<tr>
		<td>Interviewer:</td>
		<td><input type="text" name="interviewer" style="width:230px"  maxlength="30" ></td>
		</tr>
		<tr>
		<td>Candidate:</td>
		<td><input type="text" name="candidate" style="width:230px" maxlength="30" ></td>
		</tr>
		<tr>
		<td>Time:</td>
		<td><input type="text" name="time" style="width:230px" value="in the form yyyy-MM-dd HH:mm" maxlength="30" onfocus="if(this.value == 'in the form yyyy-MM-dd HH:mm') this.value =''"></td>
		</tr>		
		</table>
			<input type="submit" value="add">
		</form>

</center>
</body>
</html>