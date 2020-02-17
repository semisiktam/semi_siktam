package com.kh.semi.review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.review.model.vo.Review;

import static com.kh.semi.common.JDBCTemplate.*;

public class ReviewDao {

	private Properties prop;
	
	public ReviewDao() {
		prop = new Properties();
		
		String filePath = Review.class.getResource("/config/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	public int getListCount(Connection con, String shopPid) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopPid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Review> selectReviewList(Connection con, String shopPid, int currentPage, int limit) {
		ArrayList<Review> rList = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow + limit -1;
			
			pstmt.setString(1, shopPid);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setrNo(rset.getString("review_no"));
				r.setUserId(rset.getString("userid"));
				r.setShopPid(rset.getString("shop_pid"));
				r.setrContent(rset.getString("review_content"));
				r.setReviewImg(rset.getString("review_img"));
				r.setScore(rset.getInt("score"));
				r.setrDate(rset.getDate("review_date"));
				
				rList.add(r);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rList;
	}
	
	
	
	
	
	
	
	
}
