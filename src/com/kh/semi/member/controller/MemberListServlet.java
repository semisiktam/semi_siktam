package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/selectList.me")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> mlist = null;
		MemberService ms = new MemberService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int memberListCount = ms.getMemberListCount();
		
		System.out.println("총 페이지 수 : " + memberListCount);
		
		maxPage = (int)((double)memberListCount/limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		mlist = ms.selectMemberList(currentPage, limit);
		
		String page = "";
		if(mlist!=null) {
			page="views/admin_memberList_4.jsp";
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 목록 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
