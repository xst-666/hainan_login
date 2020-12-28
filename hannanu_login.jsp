<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.ResultSet"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
			<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     		url="jdbc:mysql://localhost:3306/niit?serverTimezone=UTC"  
     		user="root"  password="niit1234"/>
     		
     		<%
     		request.setCharacterEncoding("GB18030");
			String name = request.getParameter("account");
			String pwd = request.getParameter("pwd");
			
     		%>
     		<sql:query var="query" dataSource="${db}">
  				select * from prodcut;
			</sql:query>

			<c:if test="${empty query.rows}"> 
			<!--验证没有通过,返回登录界面-->
  			<jsp:forward page="loginerror.jsp"/>
			</c:if>
			<c:if test="${!empty query.rows}"> 
			<!--验证通过，保存用户信息到session中-->
			<c:forEach var="row" items="${query.rows}">
   		 	<c:set var="userName" value="${row.userName}" scope="session" />
    		<c:set var="userLevel" value="${row.userLevel}" scope="session" /> 
 			</c:forEach>
    		<c:set var="isLog" value="1" scope="session" /> 
<!--页面发送到主页面-->
	
   			<jsp:forward page="loginsuccessful.jsp"/>
</c:if>
            
</body>
</html>