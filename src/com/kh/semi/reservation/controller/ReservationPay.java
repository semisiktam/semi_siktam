package com.kh.semi.reservation.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReservationPay
 */
@WebServlet("/reservationPay.rc")
public class ReservationPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
			
		//String[] mlist = request.getParameter("m0list").split(",");
		String[] mlist = request.getParameterValues("m0list");
		System.out.println(Arrays.toString(mlist));
		System.out.println(mlist.length);
		for(int i=0; i<mlist.length; i=i+3) {
			System.out.println(mlist[i] + " " +mlist[i+1]+" "+ mlist[i+2]);
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
