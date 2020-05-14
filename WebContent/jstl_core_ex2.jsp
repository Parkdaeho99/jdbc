<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>JSTL core 라이브러리 사용 예제 2</title>
</head>
<body>
<c:forEach var="test" begin="1" end="10" step="2">
	<b>${test}</b>&nbsp;
</c:forEach>
<br>
<c:forTokens var="alphabet" items="abcdef,ab,kkk,uuu_a-b c d" delims=",">
	<b>${alphabet}</b>끊고&nbsp;
</c:forTokens>
<br>

<!-- 하나의 스트링을 구분자 기준으로 나눈다. 스트링토크나이저 -->
<c:set var="data" value="홍길동x김길동x고길동"/>
<c:forTokens var="varData" items="${data}" delims="x">
	<b>${varData}</b>끊고&nbsp;
</c:forTokens>
</body>
</html>
