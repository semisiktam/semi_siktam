package com.kh.semi.black.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.black.model.dao.BlackDao;
import com.kh.semi.black.model.vo.BlackList;

import static com.kh.semi.common.JDBCTemplate.*;

public class BlackService {
	private Connection con;
	private BlackDao bDao = new BlackDao();
	
	public int getListCount() {
		con = getConnection();
		
		int listCount = bDao.getListCount(con);
		
		close(con);
				
		return listCount;
	}

	public ArrayList<BlackList> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<BlackList> blist = bDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return blist;
	}

}
