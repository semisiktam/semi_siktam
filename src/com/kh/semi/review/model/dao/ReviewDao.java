package com.kh.semi.review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.kh.semi.review.model.vo.Review;

import static com.kh.semi.common.JDBCTemplate.*;

public class ReviewDao {

	private Properties prop;
	
	public ReviewDao() {
		prop = new Properties();
		
		String filePath = Review.class.getResource("/config/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
}
