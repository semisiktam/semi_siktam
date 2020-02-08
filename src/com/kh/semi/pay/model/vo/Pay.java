package com.kh.semi.pay.model.vo;

import java.sql.Date;

public class Pay {
	private String payNo       ; //결제고유번호
	private String resNo   ; //예약고유번호
	private String payType     ; //결제방식
	private Date payDate     ; //결제일
	private int totalPay    ; //총 결제금액
	private int mileage       ; //마일리지
	private int couponNo    ; //쿠폰번호
}                       
