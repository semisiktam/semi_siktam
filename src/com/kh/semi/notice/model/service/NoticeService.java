package com.kh.semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.Notice;

import static com.kh.semi.common.JDBCTemplate.*;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();

	/**
	 * 공지 사항 조회용
	 * @return
	 */
	public ArrayList<Notice> selectList() {
		
		Connection con = getConnection();
		
		ArrayList<Notice> list = nDao.selectList(con);
		
		close(con);
		
		return list;
	}
	
	
	
}
