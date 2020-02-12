package com.kh.semi.notice.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop;
	
	public NoticeDao() {
		prop = new Properties();
		
		String filePath= Notice.class.getResource("/config/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Notice> selectList(Connection con) {
		
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setnNo(rset.getInt(1));
				n.setnTitle(rset.getString("ntitle"));
				n.setnWriter(rset.getString("nwriter"));
				n.setnDate(rset.getDate("ndate"));
				n.setnCount(rset.getInt("ncount"));
				n.setnContext(rset.getString("ncontext"));
				
				list.add(n);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	/**
	 * 공지사항 상세보기용
	 * @param con
	 * @param nno
	 * @return
	 */
	public Notice selectOne(Connection con, int nno) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice();
				
				n.setnNo(rset.getInt("nno"));				
				n.setnTitle(rset.getString("ntitle"));
				n.setnContext(rset.getString("ncontext"));
				n.setnWriter(rset.getString("nwriter"));
				n.setnCount(rset.getInt("ncount"));
				n.setnDate(rset.getDate("ndate"));
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return n;
	}

	/**
	 * 공지사항 상세보기 카운트용
	 * @param con
	 * @param nno
	 * @return
	 */
	public int updateReadCount(Connection con, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	/**
	 * 공지사항 검색용
	 * @param con
	 * @param category
	 * @param keyword
	 * @return
	 */
	public ArrayList<Notice> searchNotice(Connection con, String category, String keyword) {
		
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(category) {
		case "writer" : sql = prop.getProperty("searchWriterNotice"); break;
		case "title" : sql = prop.getProperty("searchTitleNotice"); break;
		case "context" : sql = prop.getProperty("searchContextNotice"); break;
		}
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setnNo(rset.getInt("nno"));
				n.setnTitle(rset.getString("ntitle"));
				n.setnContext(rset.getString("ncontext"));
				n.setnWriter(rset.getString("nwriter"));
				n.setnCount(rset.getInt("ncount"));
				n.setnDate(rset.getDate("ndate"));
				
				list.add(n);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
}
