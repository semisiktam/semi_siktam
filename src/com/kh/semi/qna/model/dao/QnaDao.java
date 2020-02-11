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
		
		String filePath = Notice.class.getResource("/config/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Qna> selectList(Connection con) {
		ArrayList<Qna> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Qna>();
			
			while(rset.next()) {
				Qna q = new Qna();
				
				q.setqNo(rset.getString("qNo"));
				q.setUserId(rset.getString("userId"));
				q.setqTitle(rset.getString("qTitle"));
				q.setqContext(rset.getString("qContext"));
				q.setqReply(rset.getString("qReply"));
				q.setqDate(rset.getDate("qDate"));
				
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
