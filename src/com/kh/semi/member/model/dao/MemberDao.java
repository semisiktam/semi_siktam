package com.kh.semi.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

public class MemberDao {
	
	private Properties prop;
	
	public MemberDao() {
		prop = new Properties();
		
		String filePath=MemberDao.class.getResource("/config/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
			
	}
	
	public Member selectMember(Connection con, Member m) {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
				
		try {
			String sql = prop.getProperty("selectMember");
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				
				result.setUserId(m.getUserId());
				result.setPassword(m.getPassword());
				
				result.setAddr(rset.getString("addr"));
				result.setName(rset.getString("name"));
				result.setPid(rset.getString("pid"));
				result.setPhone(rset.getString("phone"));
				result.setShopYN(rset.getString("shop_yn"));
				result.setMileage(rset.getInt("mileage"));
				result.setCouponNo(rset.getInt("COUPON_NO"));
				result.setBlackYN(rset.getString("BLACK_YN"));
				result.setOutYN(rset.getString("OUT_YN"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertMember(Connection con, Member m) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertMember");
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getAddr());
			pstmt.setString(4, m.getName());
			pstmt.setString(5, m.getPid());
			pstmt.setString(6, m.getPhone());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
