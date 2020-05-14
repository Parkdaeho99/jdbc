<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JSTL에서 연산을 하려면 ${연산식or변수명} 인듯 --%>
<%-- 앞에 \${ }는 왜 쓰는거지? -> 연산을 하지않고 문자 그대로 출력하게 하려고--%>
	<h3>5+7 = ${5+7} </h3>
	<h3>\$8-3 = ${8-3}</h3>
	<h3>\${10==9} = ${10==10}</h3>
	<h3>5!=7 = ${5!=7} </h3>
	<h3>5+3==8?8:10 = ${5+3==8?8:10} </h3>
</body>
</html>