package com.kh.semi.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nNo     ; //notice번호
	private String nTitle  ; //제목
	private String nWriter ; //작성자
	private Date nDate   ; //작성일
	private int nCount  ; //조회수
	private String nContext; //글내용
}
