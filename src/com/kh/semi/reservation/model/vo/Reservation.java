package com.kh.semi.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int rno    ; //예약내역고유번호
	private String userid        ;
	private String shopPid      ;
	private Date rdate  ;//예약날짜
	private Date rtime  ;//예약시간
	private int mno       ;//메뉴넘버
	private int mprice    ;//메뉴가격
	private char acceptYN     ;//수락여부
}
