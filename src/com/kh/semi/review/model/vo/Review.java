package com.kh.semi.review.model.vo;

import java.sql.Date;

public class Review {             
	private int rNo         ; //리뷰번호
	private String userId         ; //사용자아이디
	private String shopPid       ; //매장등록번호
	private String rContent ; //리뷰내용
	private String reviewImg     ; //리뷰이미지
	private int score             ; //별점
	private Date rDate      ; //작성일
}
