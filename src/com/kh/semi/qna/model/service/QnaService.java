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

	public Qna qSelectOne(int qno) {
		Connection con = getConnection();
		
		Qna q = qDao.qSelectOne(con,qno);
		
		// 카운트
		
		close(con);
		
		return q;
	}

	public ArrayList<Qna> searchQna(String category, String keyword) {
		
		Connection con = getConnection();
		
		ArrayList<Qna> list = null;
		
		if(category.length()>0) {
			list = qDao.searchQna(con,category,keyword);
		}else {
			list = qDao.selectList(con);
		}
		
		return list;
	}

	public int insertQna(Qna q) {
		
		Connection con = getConnection();
		int result = qDao.insertQna(con,q);
		
		if(result >=1) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}



































