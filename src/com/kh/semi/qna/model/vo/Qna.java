package com.kh.semi.qna.model.vo;

import java.io.Serializable;

public class Qna implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5783420113925221129L;
	private String qNo      ; //qna글번호
	private String userId   ; //사용자아이디
	private String qTitle   ; //글제목
	private String qContext ; //글내용
	private String qReply   ; //답변
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(String qNo, String userId, String qTitle, String qContext, String qReply) {
		super();
		this.qNo = qNo;
		this.userId = userId;
		this.qTitle = qTitle;
		this.qContext = qContext;
		this.qReply = qReply;
	}
	public String getqNo() {
		return qNo;
	}
	public void setqNo(String qNo) {
		this.qNo = qNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContext() {
		return qContext;
	}
	public void setqContext(String qContext) {
		this.qContext = qContext;
	}
	public String getqReply() {
		return qReply;
	}
	public void setqReply(String qReply) {
		this.qReply = qReply;
	}
	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", userId=" + userId + ", qTitle=" + qTitle + ", qContext=" + qContext + ", qReply="
				+ qReply + "]";
	}
	
	
}
