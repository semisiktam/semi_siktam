<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/siktam/views/main_6.jsp">식탐</a>
      </div>
      <ul class="nav navbar-nav">
        <li class=""><a href="admin_main_4.jsp">메인</a></li>
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="admin_memberList_4.jsp">회원리스트</a></li>
            <li><a href="admin_storeList_4.jsp">업체리스트</a></li>
            <li><a href="admin_blackList_4.jsp">블랙리스트</a></li>
            <li><a href="admin_storeRegister_4.jsp">업체등록관리</a></li>
            <li><a href="admin_storeSalesManagement_4.jsp">매출관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">사이트관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="admin_notice_4.jsp">공지사항</a></li>
            <li><a href="admin_eventBanner_4.jsp">이벤트배너</a></li>
            <li><a href="admin_questions_4.jsp">문의사항</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header>