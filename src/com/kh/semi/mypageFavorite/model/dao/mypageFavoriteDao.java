package com.kh.semi.mypageFavorite.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.MemberReservationList;
import com.kh.semi.shop.model.vo.Shop;
import static com.kh.semi.common.JDBCTemplate.*;

public class mypageFavoriteDao {
	private Properties prop;
	
	public mypageFavoriteDao() {
		prop = new Properties();
		
		String filePath=MemberDao.class.getResource("/config/myfavorite-query.properties").getPath();
	      
	      try {
	         prop.load(new FileReader(filePath));
	      }catch(FileNotFoundException e) {
	         e.printStackTrace();
	      }catch(IOException e) {
	         e.printStackTrace();
	      }
	}

	/**
	 * 마이페이지(개인) 즐겨찾기 조회용
	 * @param con
	 * @param userId
	 * @return
	 */
	public ArrayList<Shop> selectFavoriteShop(Connection con, String userId) {
		ArrayList<Shop> favorShopList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFavorite");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			favorShopList = new ArrayList<Shop>();
			
			while(rset.next()) {
				Shop s = new Shop();
				
				s.setShopPid(rset.getString("shop_pid"));
				s.setUserId(rset.getString("userid"));
				s.setShopName(rset.getString("shop_name"));
				s.setShopImg(rset.getString("shop_img"));
				s.setsAddr(rset.getString("shop_addr"));
				s.setsPhone(rset.getString("shop_phone"));
				s.setsInfo(rset.getString("shop_info"));
				s.setOwnerId(rset.getString("owner_id"));
				s.setsTime(rset.getString("shop_starttime"));
				s.seteTime(rset.getString("shop_endtime"));
				s.setShopDay(rset.getString("shop_day"));
				s.setMenuCategory(rset.getString("menu_category"));
				s.setTableType(rset.getString("table_type"));
				s.setAvgPay(rset.getInt("avg_pay"));
				s.setOutYn(rset.getString("out_yn"));
				
				favorShopList.add(s);
				
				
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		for(Shop n : favorShopList) {
			System.out.println(n);
		}
		return favorShopList;
	}

}
