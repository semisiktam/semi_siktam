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

	/**
	 * 공지사항 상세 보기용
	 * @param nno
	 * @return
	 */
	public Notice selectOne(int nno) {
		
		Connection con = getConnection();
		
		Notice n = nDao.selectOne(con,nno);
		
		if(n != null) {
			int result = nDao.updateReadCount(con,nno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		close(con);
		
		return n;
		
	}
	
	
	
}
