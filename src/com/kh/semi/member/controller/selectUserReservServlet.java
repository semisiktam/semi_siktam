package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.member.model.vo.MemberReservationList;

/**
 * Servlet implementation class selectUserReservServlet
 */
@WebServlet("/selectUserReserv.re")
public class selectUserReservServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectUserReservServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("application/json; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Member m  = (Member)session.getAttribute("member");
		
		String id = m.getUserId();
		
		Map hmap =new HashMap();
		
		ArrayList<Shop> shop = new ArrayList<Shop>();
		ArrayList<Reservation> reservation = new ArrayList<Reservation>();
		ArrayList<Menu> menu = new ArrayList<Menu>();
		
		
		
		MemberService ms = new MemberService();
		
		shop = ms.selectUserShop(id);
		reservation = ms.selectUserReserve(id);
		menu = ms.selectUserMenu(id);
		
		
		hmap.put("shop", shop);
		hmap.put("reservation", reservation);
		hmap.put("menu",menu);
				
		new Gson().toJson(hmap, response.getWriter());*/
//		response.setContentType("application/json;");
		ArrayList<MemberReservationList> mrList= new ArrayList<MemberReservationList>();
		
		HttpSession session = request.getSession();
		Member m=(Member)session.getAttribute("member");
		
		MemberService ms = new MemberService();
		
		mrList = ms.selectUserReserve(m.getUserId());
		
		
		
		
		JSONObject userInfo = null;
		JSONArray result = new JSONArray();
		
		for(MemberReservationList user : mrList) {
			userInfo = new JSONObject();
			
			userInfo.put("shopName", user.getShopName());
			userInfo.put("rDate", user.getrDate());
			userInfo.put("rTime", user.getrTime());
			userInfo.put("menu", user.getMenuName());
			userInfo.put("acceptYn", user.getAcceptYN());
			
			result.add(userInfo);
		}
		
		response.getWriter().print(result.toJSONString());
		
		
		
		/*String page = "";
		
		System.out.println(mrList);
		
		if(mrList!=null) {
			page = "views/mypagePerson_5.jsp";
			request.setAttribute("mrList", mrList);			
		}else {
			request.setAttribute("msg", "예약내역 불러오기 에러 ");
		}
		
		request.getRequestDispatcher(page).forward(request, response);*/

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
