<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지(개인)</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/mypage_person_5.css">
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
    <div id="wrap">
        <div class ="content" id="content1">
            <h1 align="center">마이페이지_개인</h1><br>
            <hr>
            <div id="imgDiv"><div id="storeImg"></div></div>
            <div id="storeInfo1">
                <ul class="storeInfo2">
                    <li id="userName"><b>유승제</b>님 안녕하세요</li>
                    <li><b>내 프로필</b>
                    <a href="registerPerson_5_7.jsp"><input type="button" class="btn1" value="수정하기"></a></li><hr>
                    <li><b>예약 내역</b>
                    <input type="button" class="btn1" value="수정하기" onclick="test1();"></li><hr>
                    <li><b>결제 내역</b>
                    <input type="button" class="btn1" value="확인하기" onclick="test3();"></li><hr>
                </ul>
            </div>
        </div>

        <div id="modal1">
            <div class="modal_content">
                <h2>예약 내역</h2>
                <br><br>
                <table id="reservationTb1">
                    <thead>
                        <tr class="reservationTr">
                            <th>매장명</th>
                            <th>예약날짜</th>
                            <th>예약시간</th> 
                            <th>예약메뉴</th> 
                            <th colspan="2">예약 변경/취소</th> 
                         </tr>
                    </thead>
                    <tbody>
                        <tr class="reservationTr">
                            <td>역전우동</td>
                            <td>2020.01.24</td>
                            <td>13:00~14:00</td>
                            <td>김치우동 1</td>
                            <!-- 변경 클릭 시 예약변경 페이지로 이동 -->
                            <td><input type="button" value="변경" class="confirm" id="change" onclick="location.href='modify_3.jsp'"> &nbsp;
                            <input type="button" value="취소" class="confirm" id="cancel" onclick="location.href='mypagePerson_5.jsp'"></td>
                        </tr>
                        <tr class="reservationTr">
                            <td>청목</td>
                            <td>2020.01.25</td>
                            <td>17:00~18:00</td>
                            <td>오늘의메뉴 1</td>
                            <!-- 변경 클릭 시 예약변경 페이지로 이동 -->
                            <td><input type="button" value="변경" class="confirm" id="change" onclick="location.href='modify_3.jsp'"> &nbsp;
                            <input type="button" value="취소" class="confirm" id="cancel" onclick="location.href='mypagePerson_5.jsp'"></td>
                        </tr>
                        <tr class="reservationTr">
                            <td>곱창이야기</td>
                            <td>2020.01.26</td>
                            <td>18:00~19:00</td>
                            <td>소막창 1</td>
                            <!-- 변경 클릭 시 예약변경 페이지로 이동 -->
                            <td><input type="button" value="변경" class="confirm" id="change" onclick="location.href='modify_3.jsp'"> &nbsp;
                            <input type="button" value="취소" class="confirm" id="cancel" onclick="location.href='mypagePerson_5.jsp'"></td>
                        </tr>
                        <tr class="reservationTr">
                            <td>싸움의고수</td>
                            <td>2020.01.27</td>
                            <td>13:00~14:00</td>
                            <td>보쌈정식XL 1</td>
                            <!-- 변경 클릭 시 예약변경 페이지로 이동 -->
                            <td><input type="button" value="변경" class="confirm" id="change" onclick="location.href='modify_3.jsp'"> &nbsp;
                            <input type="button" value="취소" class="confirm" id="cancel" onclick="location.href='mypagePerson_5.jsp'"></td>
                        </tr>
                        
                        
                    </tbody>
                </table>
                <br><br>
                <button id="modal_close_btn1" onclick="test2();">창 닫기</button>
            </div>
            <div class="modal_layer"></div>
        </div>

        <div id="modal2">
            <div class="modal_content">
                <h2>결제 내역</h2>
                <br><br>
                <table id="reservationTb2">
                    <thead>
                        <tr class="reservationTr">
                            <th>매장명</th>
                            <th>메뉴</th> 
                            <th>결제금액</th>  
                            <th>결제방식</th>  
                         </tr>
                    </thead>
                    <tbody>
                        <tr class="reservationTr">
                            <td>역전우동</td>
                            <td>김치우동 1</td>
                            <td>3,500원</td>
                            <td>네이버페이</td>
                        </tr>
                        <tr class="reservationTr">
                            <td>청목</td>
                            <td>오늘의메뉴 1</td>
                            <td>7,000원</td>
                            <td>신용카드</td>
                        </tr>
                        <tr class="reservationTr">
                            <td>곱창이야기</td>
                            <td>소막창 1</td>
                            <td>11,000원</td>
                            <td>카카오페이</td>
                        </tr>
                        <tr class="reservationTr">
                            <td>싸움의고수</td>
                            <td>보쌈정식XL 1</td>
                            <td>7,000원</td>
                            <td>네이버페이</td>
                        </tr>
                        
                    </tbody>
                </table>
                <br><br>
                <button id="modal_close_btn2" onclick="test4();">창 닫기</button>
            </div>
            <div class="modal_layer"></div>
        </div>

        <script>
            function test1(){

                document.getElementById('modal1').style.display = "block";
                document.getElementById('content2').style.display = "none";

                /* var popupX = (document.body.offsetWidth / 2) - (200 / 2);// 초기값 var popupX = (document.body.offsetWidth / 2) - (200 / 2);
                var popupY= (document.body.offsetHeight / 2) - (300 / 2);

                window.open("mypageShopReservationList_5.jsp","popup",'width=300, height=400, scrollbars= no, toolbar=no, menubar=no,location=no,left='+ popupX + ', top='+ popupY+"'"); */ 
            }

            function test2(){
                document.getElementById('modal1').style.display = "none";
                document.getElementById('content2').style.display = "block";
            }

            function test3(){
                document.getElementById('modal2').style.display = "block";
                document.getElementById('content2').style.display = "none";
            }
            function test4(){
                document.getElementById('modal2').style.display = "none";
                document.getElementById('content2').style.display = "block";
            }
            function informationChange(){
                window.open("registerPerson_5_7.jsp");
            }
        </script>

        <div class ="content" id="content2">


            <h3 id="contentTxt" align="left">내가 즐겨찾기 한 음식점</h3>


            <div id="registStore">
                <ul>
                    <li>
                        <div class="registStore2" onclick="location.href='productDetailPage_6.jsp'">
                            <img src="/siktam/resources/images/역전우동.png" class="registStoreImg" alt="역전우동" width="170px" height="120px"><br>
                            <h4 align="center">역전우동</h4>
                            <p align="center"><small>서울 강남구 테헤란로10길 25</small></p>
                        </div>
                    </li>
                    <li>
                        <div class="registStore2" onclick="location.href=''">
                            <img src="/siktam/resources/images/곱창이야기.png" class="registStoreImg" alt="곱창이야기" width="170px" height="120px"><br>
                            <h4 align="center">곱창이야기</h4>
                            <p align="center"><small>서울 서초구 강남대로69길 10</small></p>
                        </div>
                    </li>
                    <li>
                        <div class="registStore2" onclick="location.href=''">
                            <img src="/siktam/resources/images/싸움의고수.png" class="registStoreImg" alt="싸움의고수" width="170px" height="120px"><br>
                            <h4 align="center">싸움의고수</h4>
                            <p align="center"><small>서울 서대문구 명물길 20</small></p>
                        </div>
                    </li>
                    <li class="registStore2Add">
                        <div>
                            <div id="plusBtn1">
                            <input type="button" id="plusBtn2" value="+" onclick="location.href='searchConditions_4.jsp'">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>




        <div class ="content" id="content3">
            <h3 id="contentTxt" align="left">최근 들여다 본 음식점</h3 id="contentTxt">
                
            
                <div id="registStore">
                    <ul>
                        <li>
                            <div class="registStore2" onclick="location.href='productDetailPage_6.jsp'">
                                <img src="/siktam/resources/images/역전우동.png" class="registStoreImg" alt="역전우동" width="170px" height="120px"><br>
                                <h4 align="center">역전우동</h4>
                                <p align="center"><small>서울 강남구 테헤란로10길 25</small></p>
                            </div>
                        </li>
                        <li>
                            <div class="registStore2" onclick="location.href=''">
                                <img src="/siktam/resources/images/곱창이야기.png" class="registStoreImg" alt="곱창이야기" width="170px" height="120px"><br>
                                <h4 align="center">곱창이야기</h4>
                                <p align="center"><small>서울 서초구 강남대로69길 10</small></p>
                            </div>
                        </li>
                        <li>
                            <div class="registStore2" onclick="location.href=''">
                                <img src="/siktam/resources/images/싸움의고수.png" class="registStoreImg" alt="싸움의고수" width="170px" height="120px"><br>
                                <h4 align="center">싸움의고수</h4>
                                <p align="center"><small>서울 서대문구 명물길 20</small></p>
                            </div>
                        </li>
                        <li class="registStore2Add">
                            <div>
                                <div id="plusBtn1">
                                <input type="button" id="plusBtn2" value="+" onclick="location.href='searchConditions_4.jsp'">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            
            
           
        </div>
        </div>
    
        
    </div>
            
    

    <!-- 푸터 시작 -->
   <%@ include file="common/footer.jsp" %>
</body>
</html>
    