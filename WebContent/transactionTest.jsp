<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "INSERT INTO members values('aaa','aaa','오정원',30,'여성','oh@test.com')";
	String sql2 = "SELECT * FROM members WHERE age >= 30";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/members");
		conn = ds.getConnection();
		
		conn.setAutoCommit(false);
		
		pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		pstmt=conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();

		if(!rs.next()) { /*위에서 select했는데, 결과가 없다면*/
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 생겨서 롤백했습니다.</h3>");
		} else {
			conn.commit();
			out.println("<h3>데이터 삽입이 완료되었습니다.</h3>");
		}
		
		conn.setAutoCommit(true);
		
	} catch (Exception e) {
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
</body>
</html>