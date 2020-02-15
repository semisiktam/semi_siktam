package com.kh.semi.menu.model.sevice;

import com.kh.semi.menu.model.dao.MenuDao;
import com.kh.semi.menu.model.vo.Menu;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class MenuService {

	private MenuDao mDao = new MenuDao();

	public ArrayList<Menu> selectList(String shopPid) {
		
		Connection con = getConnection();
		
		ArrayList<Menu> list = mDao.selectList(con,shopPid);
		
		close(con);
		
		return list;
	}

	
	
	
	
}
