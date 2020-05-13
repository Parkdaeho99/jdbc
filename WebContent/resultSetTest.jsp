<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	Connection conn = null;
	String sql = "SELECT * FROM student";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	/*리절트셋의 첫번째 인덱스와 마지막 인덱스에는 데이터가 들어가지 않는다. 단지 처음과 끝을 나타낼 뿐이다.
	그래서 밑에 코드보면
	while(rs.next()) { //1번이 학번, 2번이 이름
		out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
	} 이렇게 next 한번 해줘야 원하는 데이터가 나오기 시작함*/
	ResultSetMetaData rsmd = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/haksa");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		
		out.println("칼럼 수 : "+rsmd.getColumnCount()+"<br>");
		for(int i=1; i<=rsmd.getColumnCount(); i++) {
			out.println(i+"번째 칼럼의 이름 : "+rsmd.getColumnName(i)+"<br>");
			out.println(i+"번째 칼럼의 타입 이름 : "+rsmd.getColumnTypeName(i)+"<br>");
		}
		
		while(rs.next()) { //1번이 학번, 2번이 이름
			out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
		}
			
	} catch (Exception e) {
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
<%="마지막 부분입니다" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% for(int i=0; i<10; i++) { %>
<h3> Hello!! <%=i+1 %>번째</h3>
<% }%>
<% for(int i=0; i<15; i++) { %>
<table>

</table>
<% }%>

<%="<div style='background-color: red'>Hello</div>" %>

</body>
</html>