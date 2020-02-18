package com.kh.semi.eventBanner.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.semi.eventBanner.model.dao.EventBannerDao;
import com.kh.semi.eventBanner.model.vo.EventBanner;


public class EventBannerService {

	private EventBannerDao eDao = new EventBannerDao();
	
	public int InsertEvent(EventBanner eb) {

		Connection con = getConnection();
		
		int result = eDao.insertNotice(con,eb);
		
		if(result >= 1) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
