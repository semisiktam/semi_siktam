<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*"%>

<%
	 Member m = (Member)session.getAttribute("member");
%>

<header>
    <nav id="nav">
    <div id="logodiv"><a href="/siktam/views/main_6.jsp"><img id="logo" src="../resources/images/KakaoTalk_20200101_193858750.png" alt=""></a></div>
    <div id="navp">
    	<a class="navp" href="/siktam/views/notice_5.jsp"><span>공지사항</span></a>
    	<a class="navp" href="/siktam/QnaListServlet"><span>문의사항</span></a>
        <a class="navp" href="/siktam/views/login_2.jsp"><span>로그인</span></a>
        <a class="navp" href="/siktam/views/mypagePerson_5.jsp"><span>마이페이지</span></a>
    </div>
    </nav>
</header>