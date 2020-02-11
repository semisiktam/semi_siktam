package com.kh.semi.shop.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.shop.model.vo.Shop;

public class ShopDao {
	
	private Properties prop;

	public ArrayList<Shop> searchMain(Connection con, String keyword) {
		ArrayList<Shop> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAddrMain");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Shop>();
			
			while(rset.next()) {
				Shop s = new Shop();
				
				s.setShopPid(rset.getString("shopPid"));
				s.setUserId(rset.getString("userId"));
				s.setShopName(rset.getString("shopName"));
				s.setShopImg(rset.getString("shopImg"));
				s.setsAddr(rset.getString("sAddr"));
				s.setsPhone(rset.getString("sPhone"));
				s.setsInfo(rset.getString("sInfo"));
				s.setOwnerId(rset.getString("ownerId"));
				s.setsTime(rset.getDate("sTime"));
				s.seteTime(rset.getDate("eTime"));
				s.setShopDay(rset.getString("shopDay"));
				s.setMenuCategory(rset.getString("menuCategory"));
				s.setTableType(rset.getString("tableType"));
				s.setAvgPay(rset.getInt("avgPay"));
				s.setOutYn(rset.getString("outYn"));
				
				list.add(s);
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
  
}
