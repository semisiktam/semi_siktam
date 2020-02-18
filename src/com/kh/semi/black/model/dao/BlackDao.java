package com.kh.semi.black.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.black.model.vo.BlackList;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class BlackDao {
	
	private Properties prop;
	
	public BlackDao() {
		prop = new Properties();
	    
	    String filePath=MemberDao.class.getResource("/config/black-query.properties").getPath();
	    
	    try {
	       prop.load(new FileReader(filePath));
	    }catch(FileNotFoundException e) {
	       e.printStackTrace();
	    }catch(IOException e) {
	       e.printStackTrace();
	    }
	}
	
	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<BlackList> selectList(Connection con, int currentPage, int limit) {
		ArrayList<BlackList> blist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			 pstmt = con.prepareStatement(sql);
	         int startRow = (currentPage-1)*limit+1;
	         int endRow = startRow + limit - 1;
	         
	         pstmt.setInt(1, endRow);
	         pstmt.setInt(2, startRow);
	         
	         rset = pstmt.executeQuery();
	         
	         blist = new ArrayList<BlackList>();
	         
	         while(rset.next()) {
	        	BlackList bl = new BlackList();
	        	bl.setBno(rset.getString("bno"));
	        	bl.setUserId(rset.getString("userid"));
	        	bl.setBanDate(rset.getDate("ban_date"));
	        	bl.setBanTerm(rset.getString("ban_term"));
	        	bl.setBanReason(rset.getString("ban_reason"));
	            
	            blist.add(bl);
	         }
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return blist;
	}

}
