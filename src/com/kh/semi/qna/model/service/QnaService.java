package com.kh.semi.qna.model.service;
import java.sql.Connection;
import static com.kh.semi.common.JDBCTemplate.*;

import java.util.ArrayList;

import com.kh.semi.qna.model.dao.QnaDao;
import com.kh.semi.qna.model.vo.Qna;

public class QnaService {

	private QnaDao qDao = new QnaDao();
	
	/**
	 * 문의사항 조회용
	 * @return
	 */
	public ArrayList<Qna> selectList() {
		Connection con = getConnection();
		
		ArrayList<Qna> list = qDao.selectList(con);
		
		close(con);
		
		return list;
	}

}
