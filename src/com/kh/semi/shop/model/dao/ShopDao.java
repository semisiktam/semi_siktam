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

}
