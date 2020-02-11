package com.kh.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 1. 사용자페이지(회원가입페이지)에서 전달받은 값을 가져오기
      String userId = request.getParameter("id");
      String password = request.getParameter("pass1");
      String addr = request.getParameter("address");
      String name = request.getParameter("userName");
      String pid = request.getParameter("pid1")+"-"+request.getParameter("pid2");
      String phone = request.getParameter("tel");
      
      Member m = new Member(userId, password, addr, name, pid, phone);
      
      System.out.println("가입 회원 정보 확인 : " + m);
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}