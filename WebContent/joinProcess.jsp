<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	if( request.getParameter("id").equals("")) id="gongbak";
	else id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age;
	if ( request.getParameter("age").equals("") ) age = 1;
	else age = Integer.parseInt(request.getParameter("age"));
	
	/*정보를 입력하지 않은채로 회원가입을 누르면 공백이 파라미터로 넘어오는데, 공백을 int로 변환하려하니 에러가 발생한다.*/
	
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/members");
		System.out.println("겟커넥션 이전");
		conn = ds.getConnection();
		System.out.println("겟커넥션 이후");
		
		pstmt = conn.prepareStatement("INSERT INTO members VALUES(?,?,?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		int result = pstmt.executeUpdate();
		if(result != 0) {
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("location.href='joinForm.jsp'");
			out.println("</script>");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
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