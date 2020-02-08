package com.kh.semi.shop.model.vo;

import java.sql.Date;

public class Shop {
	private String shopPid      ;
	private String userId        ;
	private String shopName		;
	private String shopImg      ;
	private String sAddr     ;
	private String sPhone    ;
	private String sInfo     ;
	private String ownerId      ;
	private Date sTime     ;//매장시작시간
	private Date eTime	   ;//매장종료시간
	private String shopDay ;//휴무일
	private String menuCategory ;
	private String tableType    ;
	private int avgPay       ;
	private String outYn; //폐업유무
}
