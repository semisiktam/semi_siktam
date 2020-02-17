package com.kh.semi.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberAdminUpdateServlet
 */
@WebServlet("/mAdminUpdate.me")
public class MemberAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String addr = request.getParameter("addr");
		String name = request.getParameter("name");
		String pid = request.getParameter("pid");
		String phone = request.getParameter("phone");
		String shopyn = request.getParameter("shopyn");
		int mileage = Integer.parseInt(request.getParameter("mileage"));
		int couponno = Integer.parseInt(request.getParameter("couponno"));
		String blackyn = request.getParameter("blackyn");
		String outyn = request.getParameter("outyn");
		
		Member m = new Member(userId, password, addr, name, pid, phone, shopyn, mileage, couponno, blackyn, outyn);
		
		int result = new MemberService().updateAdminMember(m);
		System.out.println("controller" + result);
		if(result>0) {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<html><script>alert('"+ userId +"님 회원정보의 변경이 적용되었습니다');");
			out.println("document.location.href='selectList.me'");
			out.println("</script></html>");
			out.flush();
			out.close();
		}else {
			request.setAttribute("msg", "회원정보 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
