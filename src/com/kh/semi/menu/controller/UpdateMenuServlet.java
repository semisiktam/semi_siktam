package com.kh.semi.menu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.menu.model.sevice.MenuService;
import com.kh.semi.menu.model.vo.Menu;

/**
 * Servlet implementation class UpdateMenuServlet
 */
@WebServlet("/UpdateMenuServlet")
public class UpdateMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMenuServlet() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menuNo=request.getParameter("menuNo");
		System.out.println("menuNo"+menuNo);
		String shopPid=request.getParameter("shopPid");
		System.out.println("shopPid"+shopPid);
		String menuName=request.getParameter("menuName");
		System.out.println("menuName"+menuName);
		String menuImg=request.getParameter("menuImg");
		System.out.println(menuImg+":menuImg");
		int menuPrice=Integer.parseInt(request.getParameter("menuPrice"));
		System.out.println(menuPrice+":menuPrice");
		String menuInfo=request.getParameter("menuInfo");
		System.out.println(menuInfo+":menuInfo");
		Menu m=new Menu(menuNo,shopPid, menuName, menuImg, menuPrice, menuInfo);
		System.out.println(m);
		int result=new MenuService().updateMenu(m);
		if(result>0) {
			request.setAttribute("shopPid", shopPid);
			request.getRequestDispatcher("/views/registerMenu_5.jsp").forward(request, response);
			
		}else {
			
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
