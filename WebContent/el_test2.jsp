<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- JSTL의 내장객체 sessionScope, param -->
<!-- JSTL에서의 표현식 -->
	<h3>${sessionScope.test }</h3>
	<h3>${sessionScope['test'] }</h3>
	<h3>${sessionScope["test"] }</h3>
	<h3>${param.name }</h3>
	<h3>${param['name'] }</h3>
	<h3>${param["name"] }</h3>
</body>
</html>