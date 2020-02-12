package com.kh.semi.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.shop.model.service.ShopService;
import com.kh.semi.shop.model.vo.Shop;

/**
 * Servlet implementation class ShopSearchConditionServlet
 */
@WebServlet("/SearchCondition.sc")
public class ShopSearchConditionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopSearchConditionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		String[] tlist = request.getParameterValues("tlist");
		
		for(int i=0; i<tlist.length; i++) {
			if(tlist[i].equals("1인석")||tlist[i].equals("2인석")||tlist[i].equals("칸막이")||tlist[i].equals("")) {
				
			}
		}
		String[] table = new String[5];
		String[] category = new String[12];
		String[] price = new String[4];
		
		
		System.out.println(tlist);
		
//		ArrayList<Shop> list = new ShopService().SeachCondition();
		
		response.getWriter().print(tlist);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
