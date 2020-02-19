package com.kh.semi.eventShop.model.dao;

import java.beans.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.eventBanner.model.vo.EventBanner;
import com.kh.semi.eventShop.model.vo.EventShop;

public class EventShopDao {
	
	private Properties prop;

	public EventShopDao() {
		prop = new Properties();
		
		String filePath= EventBanner.class.getResource("/config/eventshop-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<EventShop> selectList(Connection con) {
		
		ArrayList<EventShop> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty(null);
		return null;
	}

}
