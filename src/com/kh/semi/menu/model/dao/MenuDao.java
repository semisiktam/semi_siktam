package com.kh.semi.menu.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.menu.model.vo.Menu;
import com.kh.semi.notice.model.vo.Notice;

public class MenuDao {

	private Properties prop;
	
	public MenuDao() {
		prop = new Properties();
		
		String filePath= Notice.class.getResource("/config/menu-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Menu> selectList(Connection con, String shopPid) {
		
		ArrayList<Menu> list = new ArrayList<Menu>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopPid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Menu m = new Menu();
				
				m.setMenuNo(rset.getString("menu_no"));
				m.setShopPid(rset.getString("shop_pid"));
				m.setMenuName(rset.getString("menu_name"));
				m.setMenuImg(rset.getString("menu_img"));
				m.setMenuPrice(rset.getInt("menu_price"));
				m.setMenuInfo(rset.getString("menu_info"));
				
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
	
}
