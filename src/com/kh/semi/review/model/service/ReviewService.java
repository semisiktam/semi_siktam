package com.kh.semi.review.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.notice.model.vo.Notice;
import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.Review;

public class ReviewService {

	private ReviewDao rDao = new ReviewDao();

	public int getListCount(String shopPid) {
		
		Connection con = getConnection();
		int listCount = rDao.getListCount(con,shopPid);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Review> selectReviewList(String shopPid, int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Review> rList = rDao.selectReviewList(con,shopPid,currentPage,limit);
		
		close(con);
		
		return rList;
	}
	
	
}
