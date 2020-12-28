<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login successful</title>
</head>
<body >
<%
   String s = request.getParameter("account");
%>
<h1>Welcome <%=s %>!!!</h1>
<a href="#">Back home page to find more</a>
</body>
</html>