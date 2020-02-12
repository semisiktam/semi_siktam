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
				String[] table = new String[5];
				String[] category = new String[12];
				String[] price = new String[4];
				
				for(int i=0; i<tlist.length; i++) {
					if(tlist[i].equals("1인석")||tlist[i].equals("2인석")||
							tlist[i].equals("칸막이")||tlist[i].equals("바테이블")||tlist[i].equals("셀프주문")) {
							table[i] = tlist[i];
							System.out.print(table[i]);
					}
					
					if(tlist[i].equals("한식")||tlist[i].equals("중식")||tlist[i].equals("분식")||tlist.equals("양식")
							||tlist[i].equals("일식")||tlist[i].equals("카페/디저트")||tlist[i].equals("치킨")||
							tlist[i].equals("피자")||tlist[i].equals("족발/보쌈")||tlist[i].equals("도시락")||
							tlist[i].equals("찜/탕")||tlist[i].equals("프랜차이즈")) {
						category[i] = tlist[i];
						System.out.print(category[i]);
					}
					
					if(tlist[i].equals("10000")||tlist[i].equals("10000~20000")
							||tlist.equals("20000~30000")||tlist.equals("30000")) {
						price[i] = tlist[i];
						System.out.print(price[i]);
					}
				}
				
				ArrayList<Shop> list = new ShopService().SearchCondition(table,category,price);
				
				String page="";
				
				if(list != null) {
					page = "view/searchCondition";
					request.setAttribute("list", list);
					
				}else {
					
				}
				
				request.getRequestDispatcher(page).forward(request, response);
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
