package com.kh.semi.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.menu.model.sevice.MenuService;
import com.kh.semi.menu.model.vo.Menu;
import com.kh.semi.shop.model.service.ShopService;
import com.kh.semi.shop.model.vo.Shop;

/**
 * Servlet implementation class ShopSelectOneServlet
 */
@WebServlet("/sSelect.so")
public class ShopSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String shopPid = request.getParameter("shopPid");
		
		ShopService ss = new ShopService();
		
		Shop s = ss.selectOne(shopPid);
		
		ArrayList<Menu> list = new ArrayList<Menu>();
		
		MenuService ms = new MenuService();
		
		list = ms.selectList(shopPid);
		
		ArrayList<Shop> mList = new ArrayList<Shop>();
		
		
		String page = "";
		
		if(s != null) {
			page = "views/productDetailPage_6.jsp";
			request.setAttribute("mList", list);
			request.setAttribute("shop", s);
			
			mList.add(s);
			// 탐희
			HttpSession session = request.getSession();
			session.setAttribute("selectShop", mList);
		}else {
			request.setAttribute("msg", "공지사항 상세보기 실패");
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
