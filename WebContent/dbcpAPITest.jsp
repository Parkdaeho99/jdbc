<!-- dbcp 데이터베이스커넥션풀 생성 + 커넥션 하나 가져오기-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	Connection conn = null;

	try {
		Context init = new InitialContext(); //톰캣 자체의 Context를 얻어오는 부분 context.xml에서 설정한 것들을 얻어오는 부분이 아닌가봄?
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/members"); //context.xml에 있는 name이 jdbc/members이다. context.xml에 있는 설정을 얻어오는 부분??
		conn = ds.getConnection(); //톰캣서버의 커넥션풀에서 제공하는 커넥션객체를 얻어온다.
		out.println("<h3>연결되었습니다</h3>");
	} catch (Exception e) {
		out.println("<h3>실패하였습니다</h3>");
		e.printStackTrace();
	} finally {
		if(conn != null) conn.close();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>