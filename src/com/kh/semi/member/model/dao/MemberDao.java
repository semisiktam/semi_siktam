package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.member.model.vo.Member;

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
   
   public int insertMember2(Connection con, Member m) {
      int result=0;
      PreparedStatement pstmt=null;
      String sql=prop.getProperty("insertMember2");
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

   public int idDupCheck(Connection con, String id) {
      int result = -1;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("idDupCheck");
      
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            result = rset.getInt(1);
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return result;
   }

   public int upDateMember(Connection con, Member m) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("upDateMember");
      
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, m.getPassword());
         pstmt.setString(2, m.getAddr());
         pstmt.setString(3, m.getName());
         pstmt.setString(4, m.getPhone());
         pstmt.setString(5, m.getUserId());
         
         result = pstmt.executeUpdate();
         
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }
   
   public ArrayList<Member> selectList(Connection con, int currentPage, int limit) {
      ArrayList<Member> list = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectList");
      try {
         pstmt = con.prepareStatement(sql);
         int startRow = (currentPage-1)*limit+1; // 1  11
         int endRow = startRow + limit - 1;
         
         pstmt.setInt(1, endRow);
         pstmt.setInt(2, startRow);
         
         rset = pstmt.executeQuery();
         
         list = new ArrayList<Member>();
         
         while(rset.next()) {
            Member m = new Member();
            m.setUserId(rset.getString("userid"));
            m.setPassword(rset.getString("password"));
            m.setAddr(rset.getString("addr"));
            m.setName(rset.getString("name"));
            m.setPid(rset.getString("pid"));
            m.setPhone(rset.getString("phone"));
            m.setShopYN(rset.getString("shop_yn"));
            m.setMileage(rset.getInt("mileage"));
            m.setCouponNo(rset.getInt("coupon_no"));
            m.setBlackYN(rset.getString("black_yn"));
            m.setOutYN(rset.getString("out_yn"));
            m.setEnrolldate(rset.getDate("enrolldate"));
            
            list.add(m);
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
   }

   public int getListCount(Connection con) {
      int listCount = 0;
      Statement stmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("listCount");
      
      
      try {
         stmt = con.createStatement();
         rset = stmt.executeQuery(sql);
         
         if(rset.next()) {
            listCount = rset.getInt(1);
         }
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(stmt);
      }
      
      return listCount;
   }
}