package com.kh.semi.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		QnaService qs = new QnaService();
		
		list = qs.selectList();
		
		String page = "";
		
		if(list != null) {
			page = "views/QnaList.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 목록 불러오기 에러 ");
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
