<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<% 
request.setCharacterEncoding("GB18030");
String Stu_num = request.getParameter("Stu_num");
String name = request.getParameter("name");
String Id_Card = request.getParameter("Id_Card");
String passWord = request.getParameter("passWord");
String placeOrigin = request.getParameter("placeOrigin");
String confirm_pw = request.getParameter("confirm_pw");
 if (passWord.equals(confirm_pw)) { 
 %>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/niit?serverTimezone=UTC"  
     user="root"  password="niit1234"/>  
     
<sql:update dataSource="${db}" var="count">  
insert into prodcut values('<%=Stu_num %>','<%=name %>','<%=Id_Card %>','<%=passWord %>','<%=placeOrigin %>');  
</sql:update>

  
<jsp:forward page="signinsuccess.jsp"/>

<%
} 
else{%>
 
<jsp:forward page="siginerror.jsp"/>

<%}%>
</body>
</html>