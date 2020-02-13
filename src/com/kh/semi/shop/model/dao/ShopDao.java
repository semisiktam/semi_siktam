package com.kh.semi.shop.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

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
import com.kh.semi.shop.model.vo.Shop;

public class ShopDao {

	private Properties prop;
	public ShopDao() {
		prop = new Properties();

		String filePath=MemberDao.class.getResource("/config/shop-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}

	}


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
				s.setsTime(rset.getString("sTime"));
				s.seteTime(rset.getString("eTime"));
				s.setShopDay(rset.getString("shopDay"));
				s.setMenuCategory(rset.getString("menuCategory"));
				s.setTableType(rset.getString("tableType"));
				s.setAvgPay(rset.getInt("avgPay"));
				s.setOutYn(rset.getString("outYn"));

				list.add(s);

			}
		}catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("SQL이외의 에러발생");
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);

		return list;


	}

	public int insertShop(Connection con, Shop s) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertShop");
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, s.getShopName());
			pstmt.setString(2, s.getShopImg());
			pstmt.setString(3, s.getsAddr());
			pstmt.setString(4, s.getsPhone());
			pstmt.setString(5, s.getsInfo());
			pstmt.setString(6, s.getOwnerId());
			pstmt.setString(7, s.getShopDay());
			pstmt.setString(8, s.getMenuCategory());
			pstmt.setString(9, s.getTableType());

			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(sql+"확인");
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Shop> SearchCondition(Connection con, String[] table, String[] category, String[] price) {
		ArrayList<Shop> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("SearchCondition");
		
		try {
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<table.length; i++) {
				pstmt.setString(i+1, table[i]);
			}
			
			for(int j=0; j<category.length; j++) {
				pstmt.setString(j+6, category[j] );
			}
			
			for(int k=0; k<price.length; k++) {
				if(price[k].equals("10000")) {
					pstmt.setInt(18, 10000);
				}else {
					pstmt.setInt(18, 0);
				}if(price[k].equals("10000~20000")) {
					pstmt.setInt(19, 10000);
					pstmt.setInt(20, 20000);
				}else {
					pstmt.setInt(19, 0);
					pstmt.setInt(20, 0);
				}if(price[k].equals("20000~30000")) {
					pstmt.setInt(21, 20000);
					pstmt.setInt(22, 30000);
				}else {
					pstmt.setInt(21, 0);
					pstmt.setInt(22, 0);
				}if(price[k].equals("30000")) {
					pstmt.setInt(23, 30000);
				}else {
					pstmt.setInt(23, 0);
				}
			}
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Shop>();
			
			while(rset.next()) {
				Shop s = new Shop();
				
				s.setShopPid(rset.getString("SHOP_PID"));
				s.setUserId(rset.getString("USERID"));
				s.setShopName(rset.getString("SHOP_NAME"));
				s.setShopImg(rset.getString("SHOP_IMG"));
				s.setsAddr(rset.getString("SHOP_ADDR"));
				s.setsPhone(rset.getString("SHOP_PHONE"));
				s.setsInfo(rset.getString("SHOP_INFO"));
				s.setOwnerId(rset.getString("OWNER_ID"));
				s.setsTime(rset.getString("SHOP_STARTTIME"));
				s.seteTime(rset.getString("SHOP_ENDTIME"));
				s.setShopDay(rset.getString("SHOP_DAY"));
				s.setMenuCategory(rset.getString("MENU_CATEGORY"));
				s.setTableType(rset.getString("TABLE_TYPE"));
				s.setAvgPay(rset.getInt("AVG_PAY"));
				s.setOutYn(rset.getString("OUT_YN"));

				list.add(s);
			}
			
				System.out.println(list);
				
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con);
			close(pstmt);
		}
		
		return list;
	}
}
