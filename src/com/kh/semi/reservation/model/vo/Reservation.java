package com.kh.semi.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private String resNo    ; //예약내역고유번호
	private String userId        ; //사용자아이디
	private String shopPid      ; //매장등록번호
	private Date rDate  ;//예약날짜
	private Date rTime  ;//예약시간
	private int mNo       ;//메뉴번호
//	private int mprice    ;//메뉴가격
	private char acceptYN     ;//수락여부
}
