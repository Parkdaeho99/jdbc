<!-- 프리페어드스테이트먼트를 이용하여 insert sql 실행하는 파일 -->
<%@page import="members.dao.MembersDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MembersDAO dao = new MembersDAO(); //풀에서
	Connection conn = dao.getConn(); //커넥션 하나를 가져온다.
	PreparedStatement pstmt = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	if(id != null) {		
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		try {
			String sql = "insert into members values(?,?,?,?,?,?);";
			/*프리페어드스테이트먼트는 직역하면 준비된 스테이트먼트이다
			위같은 sql문은 값만 바꾸어 실행시켜야 하는 상황일 확률이 크다.
			이런 경우 일반 스테이트먼트는 sql을 계속 컴파일해서 느리다.
			프리페어드스테이트먼트는 sql을 캐싱해놓고 값이 바뀔때마다 값만 업데이트 해주는듯?
			그래서 프리페어드스테이트먼트는 값을 넣어두지 않고 물음표를 사용한다.
			일반 스테이트먼트랑 프리페어드스테이트먼트의 공통점은
			커넥션 풀에서 커넥션을 하나 가져와서 그 커넥션에 스테이트먼트를 붙이고 스테이트먼트를 이용하여 DB값에 접근한다.*/
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			/*위 sql 쿼리에서 1번 자리에 id를 셋한다*/
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setInt(4, age);
			pstmt.setString(5, gender);
			pstmt.setString(6, email);
			pstmt.executeUpdate();
			/*executeUpdate는 insert처럼 리턴이 필요없는 쿼리를 처리, executeQuery는 select 쿼리를 처리,*/
			out.println("<h3>회원정보가 저장되었습니다.</h3>");
			} catch (Exception e) {		
				out.println("<h3>회원정보 저장에 실패하였습니다.</h3>");
				e.printStackTrace();
			} finally {
				try {
				if(pstmt != null) pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				dao.membersClose();
			}
		
	} else {
%>

<!-- form에 action이 없어서 자기자신(이 페이지=statementTest3.jsp)에게 넘겨줌 -->
<form method="post">
	<div>
		<label>아이디: </label>
		<input type="text" name="id">
	</div>
	<div>
		<label>비밀번호: </label>
		<input type="password" name="password">
	</div>
	<div>
		<label>이름: </label>
		<input type="text" name="name">
	</div>
	<div>
		<label>나이: </label>
		<input type="text" name="age">
	</div>
	<div>
		<label>성별: </label>
		<select name="gender">
			<option>선택하세요</option>
			<option value="남성">남성</option>
			<option value="여성">여성</option>
		</select>
	</div>
	<div>
		<label>이메일: </label>
		<input type="email" name="email">
	</div>
	<div>
		<button type="submit">회원정보저장</button>
	</div>
</form>
<% 	
	} //자바코드 사이에 html코드가 있으면 html코드도 영향을 받는다.
%>
</body>
</html>