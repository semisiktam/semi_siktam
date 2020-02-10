package com.kh.semi.eventBanner.model.vo;

import java.io.Serializable;

public class EventBanner implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1746921829697456340L;
	private String eventNo; //이벤트번호
	private String eventName; //이벤트명
	private int shopPid; //매장등록번호
	private String eventImg; //이벤트이미지
	public EventBanner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventBanner(String eventNo, String eventName, int shopPid, String eventImg) {
		super();
		this.eventNo = eventNo;
		this.eventName = eventName;
		this.shopPid = shopPid;
		this.eventImg = eventImg;
	}
	public String getEventNo() {
		return eventNo;
	}
	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public int getShopPid() {
		return shopPid;
	}
	public void setShopPid(int shopPid) {
		this.shopPid = shopPid;
	}
	public String getEventImg() {
		return eventImg;
	}
	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}
	@Override
	public String toString() {
		return "EventBanner [eventNo=" + eventNo + ", eventName=" + eventName + ", shopPid=" + shopPid + ", eventImg="
				+ eventImg + "]";
	}
	
}

