<%@page import="com.kh.semi.menu.model.vo.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<Menu> mlist=null;
      if(request.getAttribute("mlist")!=null){
    	  mlist=new ArrayList<Menu>();
    	  mlist=(ArrayList)request.getAttribute("mlist");
      }
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴 등록하기</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/registerMenu_5.css">

</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
    <div id="wrap">
        <div id="modal1">
            <div class="modal_content">
                <h2>메뉴 등록 및 수정</h2>
                <br><br>
                <table id="reservationTb1">
                    <thead>
                        <tr class="reservationTr">
                            <th>메뉴명</th>
                            <th>메뉴 사진</th> 
                            <th>메뉴 가격</th> 
                            <th>설명</th> 
                            <th colspan="2">메뉴 수정/삭제</th>
                         </tr>
                    </thead>
                    <tbody>
                    <%for(int i=0; i<mlist.size();i++){ %>
                        <tr class="reservationTr">
                            <td><input type="text" placeholder="<%=mlist.get(i).getMenuName()%>"></td>
                            <td><input type="file"><%=mlist.get(i).getMenuImg()%></td>
                            <td><input type="text" placeholder="<%=mlist.get(i).getMenuPrice()%>">&nbsp;원</td>
                            <td><input type="text" placeholder="<%=mlist.get(i).getMenuInfo()%>"></td>
                            <td><input type="button" value="수정" class="btn" id="change" onclick="location.href='registerCompany_2_5.jsp'">
                                <input type="button" value="삭제" class="btn" id="cancel"></td>
                        </tr>
                        <%} %>
                        <!-- <tr class="reservationTr">
                            <td><input type="text" placeholder="해물순듀뷰"></td>
                            <td><input type="file"></td>
                            <td><input type="text" placeholder="7000">&nbsp;원</td>
                            <td><input type="text" placeholder="순듀뷰와 해물"></td>
                            <td><input type="button" value="수정" class="btn" id="change" onclick="location.href='registerCompany_2_5.jsp'">
                                <input type="button" value="삭제" class="btn" id="cancel"></td>
                        </tr>
                        <tr class="reservationTr">
                            <td><input type="text" placeholder="곱창"></td>
                            <td><input type="file"></td>
                            <td><input type="text" placeholder="22000">&nbsp;원</td>
                            <td><input type="text" placeholder="이탐희 최애"></td>
                            <td><input type="button" value="수정" class="btn" id="change" onclick="location.href='registerCompany_2_5.jsp'">
                                <input type="button" value="삭제" class="btn" id="cancel"></td>
                        </tr> -->
                        
                    </tbody>
                </table><br>
                <button id="plus" class="btn" name="plus">추가하기</button><br><br><br>
                <button class="btn" name="confirm">완료</button>
                <button class="btn" name="cencel" onclick="location.href='views/mypageShop_5.jsp'">취소</button>
                
            </div>
        </div>
        </div>

    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>

