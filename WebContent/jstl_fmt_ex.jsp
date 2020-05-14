<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="date" class="java.util.Date"/>
<!-- useBean을 이용하여 Date클래스의 date객체 생성 -->
<html>
<head>
<title>JSTL fmt 라이브러리 사용 예제</title>
</head>
<body>

<%-- <fmt:setLocale value="en_US"/> --%>
<fmt:setLocale value="ko_KR"/>
<fmt:bundle basename="test">
<!-- bundle = properties ? -->
<!-- test 이름을 가진 properties 파일을 읽는다. 경로는 프로젝트->java Resources->src -->
<!-- 값이 영어면 test.properties를 읽고, 한글이면 _ko가 붙은 properties를 읽는다. -->
	<fmt:message key="name"/><br>
<!-- 	bundle에서 설정한 properties 파일의 내부에 키값이 name인 놈의 메세지를 출력한다. -->
	<fmt:message key="say"/><br>
	<fmt:message key="say2">
		<fmt:param value="고길동"/>
	</fmt:message>
<!-- 	properties의 say2로 넘기는 파라미터값이다. -->
<!-- 	test.properties에서 {0}의 값이 파라미터로 설정된다. -->
</fmt:bundle>

<p>
<fmt:formatNumber value="50000" type="currency"/><br>
<!-- 통화(currency) 타입으로 변환 -->
<fmt:formatNumber value="0.15" type="percent"/><br>
<fmt:formatNumber value="500567300" pattern="###,###,###"/><p>

<fmt:formatDate value="${date}" type="date"/><br>
<fmt:formatDate value="${date}" type="time"/><br>
<fmt:formatDate value="${date}" type="both"/><p>

<fmt:formatDate value="${date}" type="both" timeStyle="short" dateStyle="short"/><br>
<fmt:formatDate value="${date}" type="both" timeStyle="long" dateStyle="long"/><br>

<br/>
<% String text = "자바영역의 텍스트입니다."; %>
<% out.println(text); %><br/>
${'하나만 쓰지 왜 이렇게 많은 걸 쓸까요'}<br/>
${'땡큐합니다'}<br/>
${date}
${text}<br/>
<!-- 자바영역에서 만든 text가 jstl에는 없네요. 
자바와 jstl은 서로 다른 영역에서 동작하나봅니다. -->

</body>
</html>
