package com.kh.semi.shop.model.service;

import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.shop.model.dao.ShopDao;
import com.kh.semi.shop.model.vo.Shop;

import static com.kh.semi.common.JDBCTemplate.*;

public class ShopService {
	
	private ShopDao sDao = new ShopDao();

	/**
	 * 메인 페이지 검색
	 * @param keyword
	 * @return
	 */
	public ArrayList<Shop> searchMain(String keyword) {
		Connection con = getConnection();
		 
		ArrayList<Shop> list = null;
		
		if(keyword.length() > 0) {
			list=new ArrayList<Shop>();
			list = sDao.searchMain(con,keyword);
			
		}else {
			
			// 모든 shop리스트 조회
//			list = sDao.selectList(con);
		}
		
		close(con);
		
		return list;
	}

	public ArrayList<Shop> SeachCondition(String tableType, String category) {
		// TODO Auto-generated method stub
		return null;
	}
 
} 
