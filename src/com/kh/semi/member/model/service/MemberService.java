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

}
