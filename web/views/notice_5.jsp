<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/notice_5.css">
    <script src="/siktam/resources/js/jquery-3.4.1.min.js"></script>
    
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
    <div class="wrap" align="center">
            <div class="noticeTitle">
                <h1>공지사항</h1>
            </div>
            <div class="tableDiv">
                    <table>
                        <thead>
                            <tr>
                              <th>번호</th>
                              <th style="width:70%">제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                              <td>08</td>
                              <td><a href="notice2_5.jsp">결제 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>07</td>
                              <td><a href="notice2_5.jsp">적립금 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>06</td>
                              <td><a href="notice2_5.jsp">쿠폰 지급 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>05</td>
                              <td><a href="notice2_5.jsp">결제 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>04</td>
                              <td><a href="notice2_5.jsp">결제 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>03</td>
                              <td><a href="notice2_5.jsp">결제 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>02</td>
                              <td><a href="notice2_5.jsp">결제 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                            <tr>
                              <td>01</td>
                              <td><a href="notice2_5.jsp">결제 관련 안내</a></td>
                              <td>관리자</td>
                              <td>2020/01/25</td>
                              <td>151</td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            <fieldset>
                <label for="name"><input type="radio" name="search" id="name">이름</label>
                <label for="title"><input type="radio" name="search" id="title">제목</label>
                <label for="text"><input type="radio" name="search" id="text">내용</label>
                <input type="text" id="searchTxt">
                <input type="button" id="searchBtn" value="검색">
            </fieldset>
    </div>






   


    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
