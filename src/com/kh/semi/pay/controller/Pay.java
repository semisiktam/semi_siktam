package com.kh.semi.pay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Pay
 */
@WebServlet("/pay.pc")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String total =request.getParameter("hdtotal");
		String[] menuName = request.getParameterValues("menuName");
		String[] menuCount = request.getParameterValues("menuCount");
		String[] menuPrice = request.getParameterValues("menuPrice");
		String time = request.getParameter("time");
		String shopPid = request.getParameter("shopPid");
		String date = request.getParameter("date");
		
		System.out.println(shopPid);
		System.out.println(time);
		System.out.println(total);
		for(int i=0; i<menuName.length; i++) {
			
			System.out.println("메뉴이름 :" + menuName[i]);
			System.out.println("메뉴 수량 : " + menuCount[i]);
			System.out.println("메뉴 가격 : " + menuPrice[i]);
		}
		System.out.println(date);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
