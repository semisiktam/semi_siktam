package com.kh.semi.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MemberReservationList implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6959044670422678075L;
	// 마이페이지(개인) 예약,결제 내역 vo
	
	/**
	 * 
	 */
//	private static final long serialVersionUID = 7985536287173821183L;
	
	private String shopName; //매장명
	private Date rDate  ;//예약날짜
	private String rTime  ;//예약시간
	private String menuName    ; //메뉴명
	private String acceptYN     ;//수락여부
	private String payType; // 결제방식
	private int totalPay; // 총 결제금액

	
	public MemberReservationList() {}

	public MemberReservationList(String shopName, Date rDate, String rTime, String menuName, String acceptYN, String payType, int totalPay) {
		super();
		this.shopName = shopName;
		this.rDate = rDate;
		this.rTime = rTime;
		this.menuName = menuName;
		this.acceptYN = acceptYN;
		this.payType = payType;
		this.totalPay = totalPay;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrTime() {
		return rTime;
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getAcceptYN() {
		return acceptYN;
	}

	public void setAcceptYN(String acceptYN) {
		this.acceptYN = acceptYN;
	}
	
	

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public int getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}

	@Override
	public String toString() {
		return "MemberReservationList [shopName=" + shopName + ", rDate=" + rDate + ", rTime=" + rTime + ", menuName="
				+ menuName + ", acceptYN=" + acceptYN + ", payType=" + payType + ", totalPay=" + totalPay + "]";
	}

	
	
	

}
