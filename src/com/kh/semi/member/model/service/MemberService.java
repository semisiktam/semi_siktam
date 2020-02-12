package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {
	private Connection con;
	private MemberDao mDao = new MemberDao();
	
	
	public Member selectMember(Member m) {
		con = getConnection();
		
		Member result = mDao.selectMember(con, m);
		
		close(con);
		
		return result;
	}
	
	public int insertMember(Member m) {
		con = getConnection();
		// 연결객체와 member객체 넘기기
		int result = mDao.insertMember(con,m);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int idDupCheck(String id) {
		con = getConnection();
		
		int result = mDao.idDupCheck(con,id);
		
		close(con);
		
		return result;
	}


}
