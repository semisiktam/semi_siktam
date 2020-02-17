package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.FindIdService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class FindIdBirthGender
 */
@WebServlet("/fibg.me")
public class FindIdBirthGender extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdBirthGender() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String name = request.getParameter("BirthName");
		String birth = request.getParameter("Birth");// 890717-2
		String gender = request.getParameter("Gender"); //여성(글자로)
		

		
		
		int checkGender = 1;
		if(gender.equals("남성")) {
			checkGender = 1;
		}else {
			checkGender = 2;
		}
		
		String pid = birth + "-" + checkGender;
		
		System.out.println(pid);
		System.out.println(name);
		System.out.println(birth);
		System.out.println(gender);

		
		Member m = new Member();
		m.setName(name);
		m.setPid(pid);
		System.out.println(m);
		
		FindIdService fId = new FindIdService();

		String mem = fId.FindIdBirthGender(m);
		
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
		
		
		
		
	}
	
	
	/*	
    String job= request.getParameter("job");
    String interests[] = request.getParameterValues("interest");
    
//    안적어도 되는 부분
    response.setContentType("text/html; charset=UTF-8");
//    출력문 시작
    PrintWriter out = response.getWriter();
    out.print("<html><body>");
    out.println("당신이 선택한 직업: <b>");
//    jsp에서 적은 job의 값을 가져오기
    out.print(job);
    
    out.println("</b><hr>당신이 선택한 관심 분야: <b>");
    if(interests ==null){
        out.print("선택한 항목이 없어요");
        
    }else{
        for(String interest:interests){
            out.print(interest +" ");
        }
    }
//    뒤로가기 버튼
    out.println("</b><br><a href='javascript:history.go(-1)'>뒤로가기</a>");
    out.print("</body></html>");
//    출력문 종료
    out.close();
}
[출처] [Jsp] select문 값 받기|작성자 sunghyun1200*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
