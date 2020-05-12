<!-- DB프로시저를 실행시키는 콜어블스테이트먼트 -->
<%@ page import="members.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.* " %>
    
<%
	request.setCharacterEncoding("UTF-8");
	MembersDAO dao = new MembersDAO(); //커넥션풀을 사용하기 위해 커넥션풀 객체를 생성

	Connection conn = dao.getConn(); //커넥션풀에서 커넥션을 하나 가져온다 
	CallableStatement cs = null; //DB프로시저를 사용하기 위한 스테이트먼트
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
		String sql = "{call Get_Annual_Income(?,?)}";
		cs = conn.prepareCall(sql); //커넥션풀에서 가져온 커넥션에 프리페어콜을 사용해서 콜어블스테이트먼트를 하나 만들어서 콜어블스테이트먼트 변수에 넣어줌
		cs.setString(1, "aaa"); //DB프로시저 첫번째꺼는 in이고
		cs.registerOutParameter(2, java.sql.Types.INTEGER); //두번째꺼는 out이라서
		cs.execute();
		System.out.println(sql);
		out.println("<h3>"+cs.getInt(2)+"</h3>");
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(cs!=null) cs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		dao.membersClose();
	}
%>
</body>
</html>