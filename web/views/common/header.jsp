<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.shop.model.vo.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*"%>

<%
	Member m = (Member)session.getAttribute("member");
	if(m!=null&&m.getShopYN().equals("Y")){
		ArrayList<Shop> slist=(ArrayList<Shop>)session.getAttribute("shop");
	}
		
%>

<header>
    <nav id="nav">
    	<div id="logodiv"><a href="/siktam/views/main_6.jsp"><img id="logo" src="/siktam/resources/images/KakaoTalk_20200101_193858750.png" alt=""></a></div>

    	<div id="navp">
	        <% if(m!=null && m.getUserId().equals("4dich")){ %>
	        	<a class="navp" href="/siktam/views/admin_main_4.jsp"><span>관리자</span></a>
	        <% } %>
            <a class="navp" href="/siktam/nselectList.no"><span>공지사항</span></a>
            <a class="navp" href="/siktam/QnaListServlet"><span>문의사항</span></a>
            <%if(m==null) {%>
            <%}else if(m.getShopYN().equals("N")){%>
            	<a class="navp" href="/siktam/views/mypagePerson_5.jsp"><span>마이페이지</span></a>
            <%}else{ %>
            	<a class="navp" href="/siktam/views/mypageShop_5.jsp"><span>마이페이지</span></a>
            <%} %>
            
            <% if(m==null){ %>
				<a class="navp" href="/siktam/views/login_2.jsp"><span style="border: 2px solid rgb(13, 78, 100); color:rgb(13, 78, 100); background-color:white; padding:5px">로그인</span></a>
            <% }else{ %>
            	<a class="navp" onclick="location.href='/siktam/logout.do'; alert('로그아웃되었습니다')"><span style="cursor: pointer; border: 2px solid rgb(13, 78, 100); color:rgb(13, 78, 100); background-color:white; padding:5px">로그아웃</span></a>
            <% } %>
        </div>

    </nav>
    
    
</header>