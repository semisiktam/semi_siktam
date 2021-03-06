package com.kh.semi.reservation.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.member.model.vo.MemberReservationList;
import com.kh.semi.reservation.model.vo.ReservationTest;
import static com.kh.semi.common.JDBCTemplate.*;
public class ReservationDao {

	private Properties prop;
	
	public ReservationDao() {
		prop = new Properties();
		
		String filePath = ReservationDao.class.getResource("/config/reservation-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReservationTest> Reservation(Connection con, String shopPid) {
		
		ArrayList<ReservationTest>list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reservation");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopPid);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReservationTest>();
			
			while(rset.next()) {
				ReservationTest r = new ReservationTest();
				
				r.setShopPid(rset.getString("SHOP_PID"));
				r.setMenuImg(rset.getString("MENU_IMG"));
				r.setMenuName(rset.getString("MENU_NAME"));
				r.setMenuPrice(rset.getInt("MENU_PRICE"));
				r.setShopAddr(rset.getString("SHOP_ADDR"));
				r.setShopDay(rset.getString("SHOP_DAY"));
				r.setShopEndTime(rset.getString("SHOP_ENDTIME"));
				r.setShopName(rset.getString("SHOP_NAME"));
				r.setShopStartTime(rset.getString("SHOP_STARTTIME"));
				r.setUserId(rset.getString("USERID"));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<MemberReservationList> reservationModify(Connection con, String userid, String reserveNo) {
		ArrayList<MemberReservationList> mrList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reservationModify");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, reserveNo);
			
			rset = pstmt.executeQuery();
			
			mrList = new ArrayList<MemberReservationList>();
			while(rset.next()) {
				MemberReservationList mr = new MemberReservationList();
				mr.setResNo(rset.getString("RESERVE_NO"));
				mr.setmNo(rset.getString("MENU_NO"));
				mr.setpNo(rset.getString("PAY_NO"));
				mr.setShopPid(rset.getString("SHOP_PID"));
				mr.setsAddr(rset.getString("SHOP_ADDR"));
				mr.setMenuImg(rset.getString("MENU_IMG"));
				mr.setMenuPrice(rset.getInt("MENU_PRICE"));
				mr.setShopName(rset.getString("SHOP_NAME"));
				mr.setrDate(rset.getDate("RESERVE_DATE"));
				mr.setrTime(rset.getString("RESERVE_TIME"));
				mr.setMenuName(rset.getString("MENU_NAME"));
				mr.setAcceptYN(rset.getString("ACCEPT_YN"));
				mr.setPayType(rset.getString("PAY_TYPE"));
				mr.setTotalPay(rset.getInt("TOTAL_PAY"));
				
				mrList.add(mr);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mrList;
	}

}
