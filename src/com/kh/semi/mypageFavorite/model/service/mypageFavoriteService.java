package com.kh.semi.mypageFavorite.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.mypageFavorite.model.dao.mypageFavoriteDao;
import com.kh.semi.shop.model.vo.Shop;
import static com.kh.semi.common.JDBCTemplate.*;

public class mypageFavoriteService {

	private mypageFavoriteDao mfDao;

	public ArrayList<Shop> selectFavoriteShop(String userId) {
		Connection con = getConnection();
		
		ArrayList<Shop> favorShopList = mfDao.selectFavoriteShop(con,userId);
		
		close(con);
		
		return favorShopList;
	}

}
