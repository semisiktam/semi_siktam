package com.kh.semi.shop.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.Pixels.Format;

import sun.text.resources.bg.FormatData_bg;

/**
 * Servlet implementation class ShopInsertServlet
 */
@WebServlet("/sInsert.sh")
public class ShopInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String shopPid = request.getParameter("shopName"); //매장명
      String shopImg = request.getParameter("shopImg"); //매장사진
      String sAddr = request.getParameter("address"); //매장주소
      String sPhone = request.getParameter("phone"); //매장전화번호
      String ownerId = request.getParameter("pid"); //사업자번호
      
//      영업  시간 / 종료 시간 
      String startTime = request.getParameter("startTime"); //영업시작시간
      String endTime = request.getParameter("endTime"); //영업종료시간
      System.out.println(startTime);
      
      String shopDay = request.getParameter("Day"); //휴무일
      
      String menuCategory = String.join(", ", request.getParameterValues("eatType")); //메뉴카테고리
      
      String tableType = String.join(", ", request.getParameter("table")); //테이블형태
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}