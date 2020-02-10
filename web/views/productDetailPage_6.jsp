<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            <p id="star">★</a>
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
            <h3>역전 우동 0416</h3>
            <span>맛있는 김이 서리는 감칠맛 진한 국물 매끄러운 질감 속 숨은 쫄깃한 면발의 식감 역전우동0410은 외식경영전문가 백종원의 우동&소바 전문점입니다.
                유난히 지친 하루의 끝자락에서 문득 따끈한 우동 국물이 떠오를 때 언제든 누구든 부담없이 문을 열고 들어가서 든든한 한끼를 대접받을 수 있는 곳입니다.</span>
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
            <p class="infop">매장 전화번호 : </p> <p class="infop2">02-123-4567</p><br>
            <p class="infop">매장 주소 : </p> <p class="infop2">서울특별시 서초구 테헤란로34길 1층</p><br>
            <p class="infop">매장 영업시간 : </p> <p class="infop2">09:00 ~ 20:30</p><br>
        </div>
    </div>

    <!-- 메뉴 -->
    <div id="pagemenu">
        <div id="pagemenudiv">
            <div id="menuspan"> 메뉴 </div><div id="menuhr"><hr></div>
            <div class="menubox">
                <div class="menuimg"><img src="/siktam/resources/images/tamhate1.jpg" alt=""></div>
                <div class="menutext">
                    <h4>옛날 우동</h4>
                    <p>진한 가츠오 국물맛과 쫄깃한 면발의 만남이 달콤한 역전우동의 대표 우동메뉴</p>
                    <p class="menuprice"><b>3,500</b></p>
                </div>
            </div>
            <div class="menubox">
                <div class="menuimg"><img src="/siktam/resources/images/tamhate1.jpg" alt=""></div>
                <div class="menutext">
                    <h4>냉모밀</h4>
                    <p>사계절 내내 사랑받는 역전우동0410의 시원,담백한 냉모밀</p>
                    <p class="menuprice"><b>5,000</b></p>
                </div>
            </div>
            <div class="menubox">
                <div class="menuimg"><img src="/siktam/resources/images/tamhate1.jpg" alt=""></div>
                <div class="menutext">
                    <h4>김치 우동</h4>
                    <p>볶음 김치가 얹어져 더욱 시원하고 깊은 맛을 내는 역전우동0410만의 특별한 우동</p>
                    <p class="menuprice"><b>4,000</b></p>
                </div>
            </div>
            <div class="menubox">
                <div class="menuimg"><img src="/siktam/resources/images/tamhate1.jpg" alt=""></div>
                <div class="menutext">
                    <h4>야채 튀김 우동</h4>
                    <p>겉은 바삭하고 속은 부드러운 야채튀김과 우동의 환상조합</p>
                    <p class="menuprice"><b>5,000</b></p>
                </div>
            </div>
        </div>
    </div>

    <!-- 상세주소 -->
    <div id="pageaddress">
        <div id="pageaddressdiv">
            <div id="addressspan">상세 주소</div><div id="addresshr"><hr></div>
            <div id="addinfo">
                <p>역삼동 828-21번지 1층 104호 플안애아파트 강남구 서울특별어쩌고</p>
                <p class="infop">대표자명 : </p> <p class="infop2">안도건</p><br>
                <p class="infop">사업자 등록번호 : </p> <p class="infop2">02-123-4567</p><br>
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
