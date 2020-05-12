//커넥션풀 클래스 생성
//커넥션풀 생성(생성자) + 커넥션풀에서 커넥션 한개 가져오기(get) + 다쓴 커넥션을 커넥션풀에 반환(close)
package members.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MembersDAO {
	Connection conn = null;

	public MembersDAO() { //커넥션 풀을 만들고 아래의 get close를 이용해서 커넥션을 쓰고 없앤다.
		try {
			Context init = new InitialContext(); 
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/members");
			conn = ds.getConnection(); 
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public void membersClose() { //커넥션 제거
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public Connection getConn() { //커넥션풀에서 커넥션 한개를 가져온다
		return conn; //커넥션 반환
	}
}
