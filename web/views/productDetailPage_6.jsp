<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.shop.model.vo.*, com.kh.semi.menu.model.vo.* , com.kh.semi.member.model.vo.*"%>

<% 
	Shop s = (Shop)request.getAttribute("shop");
	ArrayList<Menu> list = (ArrayList<Menu>)request.getAttribute("menu");
	Member mem = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세페이지</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/productDetailPage_6.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <!-- 지도 설치 스크립트 -->
    
    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>


</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->

    <div id="detailbox">
        <!-- 메인 이미지 -->
        <div class="pagemainimg"></div>
        
        <!-- 2020.02.10 수정 시작(현희) < 즐겨찾기 추가 > -->

        <div class="bookmark">
            <p id="star">★</p>
        </div>
   
        <script>
            $(document).ready(function(){
                $('#star').toggle(function(){
                    $(this).css({'color':'rgb(255, 184, 53)'});
                },function(){
                    $(this).css({'color':'#eee'});
                });
            })
        </script>
    
        <!-- 2020.02.10 수정 끝 (현희) -->

        
        <div class="pageselect">
            <!-- %% 업체정보연결-->
            <a href="productDetailPage_6.jsp"><div id="information"><span>업체정보</span></div></a>
            <!-- %% 리뷰연결-->
            <a href="productReviewPage_7.jsp"><div id="review"><span>리뷰(1,389)</span></div></a>
        </div>
        <!-- 상단 업체명/설명/예약버튼 -->
        <div id="pagetop">
            <h3><%= s.getShopName() %></h3>
            <span><%= s.getsInfo() %></span>
            <!-- %% 예약페이지연결-->
            <a href="reservation_4.jsp"><input type="button" id="reservation" value="예약하기"></a>
        </div>

    <!-- 매장정보 -->
    <div id="pageinfo">
        <div id="pageinfodiv">
            <div id="infospan"> 매장정보 </div><div id="infohr"><hr></div>
            <div class="pageicon">
                <img class="iconimg" src="/siktam/resources/images/search.png" alt="">
                <p class="icontext">1인 테이블</p>
            </div>
            <div class="pageicon">
                <img class="iconimg" src="/siktam/resources/images/search.png" alt="">
                <p class="icontext">1인 테이블</p>
            </div>
            <div class="pageicon">
                <img class="iconimg" src="/siktam/resources/images/search.png" alt="">
                <p class="icontext">1인 테이블</p>
            </div>
            <div class="pageicon">
                <img class="iconimg" src="/siktam/resources/images/search.png" alt="">
                <p class="icontext">1인 테이블</p>
            </div><br>
            <p class="infop">매장 전화번호 : </p> <p class="infop2"><%= s.getsPhone() %></p><br>
            <p class="infop">매장 주소 : </p> <p class="infop2"><%=s.getsAddr() %></p><br>
            <p class="infop">매장 영업시간 : </p> <p class="infop2"><%= s.getsTime() %> ~ <%= s.geteTime() %></p><br>
        </div>
    </div>

    <!-- 메뉴 -->
    <div id="pagemenu">
        <div id="pagemenudiv">
            <div id="menuspan"> 메뉴 </div><div id="menuhr"><hr></div>
            <div class="menubox">
            <!-- 지원 잠시 주석처리 -->
            <%-- <% for(Menu me : list) { %>
                <div class="menuimg"><img src="<%=me.getMenuImg() %>" alt=""></div>
                <div class="menutext">
                    <h4><%=me.getMenuName() %></h4>
                    <p><%=me.getMenuInfo() %></p>
                    <p class="menuprice"><b><%=me.getMenuPrice() %></b></p>
                </div>
            <% } %> --%>
            </div>
        </div>
    </div>

    <!-- 상세주소 -->
    <div id="pageaddress">
        <div id="pageaddressdiv">
            <div id="addressspan">상세 주소</div><div id="addresshr"><hr></div>
            <div id="addinfo">
                <p><%=s.getsAddr() %></p>
                <p class="infop">대표자명 : </p> <p class="infop2"><%--<%=mem.getName() %> --%></p><br>
                <p class="infop">사업자 등록번호 : </p> <p class="infop2"><%=s.getOwnerId() %></p><br>
            </div>
            <div id="daumRoughmapContainer1578697903624" 
            class="root_daum_roughmap root_daum_roughmap_landing">
            </div>

            <script charset="UTF-8">
                new daum.roughmap.Lander({
                   "timestamp" : "1578697903624",
                   "key" : "wk9k",
                   "mapWidth" : "400",
                   "mapHeight" : "200"
                }).render();
             </script>
        </div>
    </div>






    </div>
 

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
