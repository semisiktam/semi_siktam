package com.kh.semi.eventBanner.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.eventBanner.model.vo.EventBanner;
import static com.kh.semi.common.JDBCTemplate.*;

public class EventBannerDao {

	private Properties prop;
	
	public int insertNotice(Connection con, EventBanner eb) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEvent");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, eb.getEventName());
			pstmt.setString(2, eb.getEventImg());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

}
