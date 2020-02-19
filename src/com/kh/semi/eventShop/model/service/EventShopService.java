package com.kh.semi.eventShop.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.eventShop.model.dao.EventShopDao;
import com.kh.semi.eventShop.model.vo.EventShop;

public class EventShopService {

	private EventShopDao esDao = new EventShopDao();
	
	public ArrayList<EventShop> selectList() {
		Connection con = getConnection();
		
		ArrayList<EventShop> list = esDao.selectList(con);
		
		close(con);
		
		return list;
	}

}
