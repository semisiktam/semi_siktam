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

import com.kh.semi.common.SelectQueryMaker;
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
			pstmt.setString(1, s.getUserId());
			pstmt.setString(2, s.getShopName());
			pstmt.setString(3, s.getShopImg());
			pstmt.setString(4, s.getsAddr());
			pstmt.setString(5, s.getsPhone());
			pstmt.setString(6, s.getsInfo());
			pstmt.setString(7, s.getOwnerId());
			pstmt.setString(8, s.getShopDay());
			pstmt.setString(9, s.getMenuCategory());
			pstmt.setString(10, s.getTableType());

			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(sql+"확인");
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Shop> SearchCondition(Connection con, String[] tlist, String[] clist, String[] plist) {
		ArrayList<Shop> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql =null;
		SelectQueryMaker query = null;
		
		String avgPay1 = null;
		String avgPay2 = null;
		String avgPay3 = null;
		String avgPay4 = null;
		String avgPay5 = null;
		String avgPay6 = null;
		
		if(plist == null) {
			avgPay1 = "0";
			avgPay2 = "0";
			avgPay3 = "1";
			avgPay4 = "0";
			avgPay5 = "0";
			avgPay6 = "0";
		}else {
			for(int i=0; i<plist.length; i++) {
				if(plist[i].equals("10000")) {
					avgPay1 = "10000";
				}else {
					avgPay1 = "0";
				}if(plist[i].equals("10000~20000")) {
					avgPay2 = "10000";
					avgPay3 = "20000";
				}else {
					avgPay2 = "0";
					avgPay3 = "1";
				}if(plist[i].equals("20000~30000")) {
					avgPay4 = "20000";
					avgPay5 = "30000";
				}else {
					avgPay4 = "0";
					avgPay5 = "1";
				}if(plist[i].equals("30000")){
					avgPay6 = "30000";
				}else {
					avgPay6 = "99999999";
				}
			}
		}
		
		if(tlist == null) {
			query = new SelectQueryMaker.Builder()
					.select().column("*").enter()
					.from().tableName("Shop").enter()
					.where().column("MENU_CATEGORY").in().condition(clist).enter()
					.and().column("AVG_PAY").space().inequalityRigth(avgPay1).enter()
					.or().column("AVG_PAY").space().betweenAnd(avgPay2, avgPay3).enter()
					.or().column("AVG_PAY").space().betweenAnd(avgPay4, avgPay5).enter()
					.or().column("AVG_PAY").space().inequalityLeft(avgPay6)
					.build();
		}else if(clist == null) {
			query = new SelectQueryMaker.Builder()
					.select().column("*").enter()
					.from().tableName("Shop").enter()
					.where().columnName("TABLE_TYPE").in().condition(tlist).enter()
					.and().column("AVG_PAY").inequalityRigth(avgPay1).enter()
					.or().column("AVG_PAY").betweenAnd(avgPay2, avgPay3).enter()
					.or().column("AVG_PAY").betweenAnd(avgPay4, avgPay5).enter()
					.or().column("AVG_PAY").inequalityLeft(avgPay6)
					.build();
		}if(plist == null){
			
			query = new SelectQueryMaker.Builder()
					.select().column("*").enter()
					.from().tableName("Shop").enter()
					.where().columnName("TABLE_TYPE").in().condition(tlist).enter()
					.and().column("MENU_CATEGORY").in().condition(clist).enter()
					.build();
		}
		
	
		System.out.println(query.getQuery());
				
		sql = query.getQuery().toString();
		
		try {
			pstmt = con.prepareStatement(sql);
			
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
