<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>
</head>
<body>

<%
String id=request.getParameter("id");
String uname=request.getParameter("uname");
%>

<center>
<h1 style="color:red">Comment</h1>
<form action="addcomment.jsp" method="post">
<textarea name="comment" cols="30" rows="5" align="center"></textarea>
<input type="hidden" name="uname" value=<%=uname %>>
<input type="hidden" name="id" value=<%=id %>>
<br>
<input type="submit" value="submit">
<input type="reset" value="reset">
</form>
</center>



</body>
</html>