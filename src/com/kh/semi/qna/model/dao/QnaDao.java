package com.kh.semi.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.notice.model.vo.Notice;
import com.kh.semi.qna.model.vo.Qna;

import static com.kh.semi.common.JDBCTemplate.*;


public class QnaDao {

	private Properties prop;
	
	public QnaDao() {
		prop = new Properties();
		
		String filePath = Notice.class.getResource("/config/qna-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Qna> selectList(Connection con) {
		// Select문을 실행하고 Java에서 사용할 객체를 선언
		ArrayList<Qna> list = null;
		// 검색 쿼리를 담을 객체를 선언한것(Statement를 사용한 이유는 where절이 없기때문일듯?)
		Statement stmt = null;
		// sql쿼리문을 Statement 객체에 담아서 실행하고 DB에서 전달받은 받을 변수
		// (select절을 사용할 경우 반환형은 ResultSet 타입으로 넘어오니깐 java에서도 ResultSet 타입으로 선언하고 받을 준비)
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Qna>();
			
			while(rset.next()) {
				Qna q = new Qna();
				
				// rset.getString("DB의 컬럼명:대소문자상관없음.)
				q.setqNo(rset.getInt(1)); 
				q.setUserId(rset.getString("QWRITER"));
				q.setqTitle(rset.getString("QTITLE"));
				q.setqContext(rset.getString("QCONTEXT"));
				q.setqReply(rset.getString("QREPLY"));
				q.setqDate(rset.getDate("QDATE"));
				
				list.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;	
	}

}
