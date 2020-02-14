package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.FindIdService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class FindIdPhoneServlet
 */
@WebServlet("/fip.me")
public class FindIdPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("phoneName");
		String phone = request.getParameter("phoneNumber");
		
		System.out.println(name);
		System.out.println(phone);
		
		Member m = new Member();
		m.setName(name);
		m.setPhone(phone);
		
		FindIdService fId = new FindIdService();
		
		// String userId = fId.FindIdPhone(m);
		// System.out.println(m);

		
		String mem= fId.FindIdPhone(m);
		System.out.println("뭐나오나" + m);
		System.out.println("서블릿:"+mem);
		String page = "";
		if(mem != null) { 
			
			page = "views/IdFind_1.jsp";
			
			request.setAttribute("mem", mem);
		}else {
			page="views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		/* response.getWriter().print(userId);
		 System.out.println(userId);*/
		
		
	/*	try {
			
			fId.FindIdPhone(userId);
			System.out.println("찾으시는 아이디는" + userId +"입니다");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("해당하는 비밀번호가 없습니다.");
		}
		*/
	
		
		/*try {
			userId
			System.out.println("아이디찾기완료");
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류");
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


