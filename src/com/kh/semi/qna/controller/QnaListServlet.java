package com.kh.semi.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.qna.model.service.QnaService;
import com.kh.semi.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/QnaListServlet")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB에 sql구문을 전달해서 받아온 결과를 받을 변수를 지정
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		// QnA의 내용을 검색하기 위해서 Service호출
		QnaService qs = new QnaService();
		
		// Sevice-> Dao를 거쳐서 QnA에 결과물을 실행하고 받아오기
		list = qs.selectList();
		
		String page = "";
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("member");
		
        if(list != null) {
        if(mem != null) {
				page = "views/qna_5.jsp";
				request.setAttribute("list", list);
			}else {
				request.setAttribute("msg", "공지사항 목록 불러오기 에러 ");
			}
		}else {
			page = "views/login_2.jsp";
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
