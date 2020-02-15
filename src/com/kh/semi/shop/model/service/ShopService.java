package com.kh.semi.shop.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.shop.model.dao.ShopDao;
import com.kh.semi.shop.model.vo.Shop;

public class ShopService {
	
	private ShopDao sDao;
	public ShopService(){
		sDao=new ShopDao();
	}

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

	public ArrayList<Shop> SearchCondition(String keyword,String[] tlist, String[] clist, String[] plist) {
		Connection con = getConnection();
		
		ArrayList<Shop> list = sDao.SearchCondition(con,keyword,tlist,clist,plist);
		
		close(con);
		return list;
	}

	public void insertShop(Shop s) {
		int result=0;
		Connection con= getConnection();
		result=sDao.insertShop(con,s);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
	}

	public ArrayList<Shop> selectList(String userId) {
		
		Connection con=getConnection();
		
		ArrayList<Shop> s=new ShopDao().selectList(con,userId);
		close(con);
		return s;
	}

	public Shop selectOne(String shopPid) {
		
		Connection con = getConnection();
		
		Shop s = sDao.selectOne(con,shopPid);
		
		close(con);
		
		return s;
	}

	
 
} 
