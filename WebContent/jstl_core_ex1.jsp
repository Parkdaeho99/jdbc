<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- uri에 등록된 태그를 사용할 때 prefix(접두어)를 사용한다 -> c:out 이런식으로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="test" value="Hello JSTL!" />
	<h3> &lt;c:set&gt; 사용 후 : <c:out value="${test}" /> </h3>
<!-- 	&lt; &gt;는 태그되지 말라고 써준 것 -->
	<c:remove var="test" />
	<h3> &lt;c:remove&gt; 사용 후 : <c:out value="${test}" /> </h3>

	<c:catch var="err123"> <%=10 / 0 %> </c:catch>
	<h3> &lt;c:catch&gt;로 잡아낸 오류 : <c:out value="${err123}" /> </h3>

	<c:if test="${5<10}">
		<h3>5는 10보다 작다.</h3>
	</c:if>
	<c:if test="${6+3==9}">
		<h3>6 + 3 은 9이다.</h3>
	</c:if>
	<c:if test="${1 > 2}">
		<h3>만족하지 않아서 출력되지 않는 구간</h3>
	</c:if>

	<!-- choose = 자바의 switch -->
 	<c:choose> <%-- c:choose 태그 자체는 별다른 의미없고 조건문의 시작을 알릴 뿐이다. --%>
		<c:when test="${5+10==50}"> <%-- 조건 확인, 조건일 때 when --%>
			<h3>5+10은 50이다.</h3> <%-- 조건이 참이면 실행하는 부분 --%>
		</c:when>
		<c:when test="${5+10==15 }"> <h3>5+10은 15이다.</h3> </c:when>
		<c:otherwise> <%-- 그 외의 경우면 실행하는 부분 --%>
			<h3>5+10은 50이 아니다.</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>