package com.kh.semi.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId       ; //사용자아이디
	private String password     ; //비밀번호 
	private String addr      ; //주소
	private String name         ; //이름
	private String pid          ; //주민번호
	private String phone        ; //핸드폰번호
	private String shopYN      ; //업체유무
	private int mileage      ; //마일리지
	private int couponNo    ; //쿠폰번호
	private String blackYN    ; //블랙리스트유무
	private String outYN       ; //회원유무
	private Date enrolldate   ; //가입일
}
