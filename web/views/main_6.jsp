<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>식탐메인</title>
    <!-- <script src="/siktam/resources/js/jquery-3.4.1.min.js"></script> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/siktam/resources/css/main_6.css">

    <style>
        /* 이벤트 배너(bootstrap)*/
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 521px;
            height: 196px;
            margin: auto;
        }

        .carousel-control {
            width: 0;
        }

        .container{
            width: 550px;
        }

        a:link, a:visited, a:hover {text-decoration: none;}
        /* rgb(13, 78, 100); */

        hr{
            width: 70%;
            height: 1px;
            background-color: lightslategrey;
        }
        
        @font-face{
            font-family:'배달의민족 주아'; 
            src:url('/siktam/resources/fonts/BMJUA_ttf.ttf');
        }

        body{
            font-family: '배달의민족 주아';
            font-size: 18px;
        }

    </style>
</head>
<body>
	<!-- (테스트) 값  넘어가는지 체크용 -->
	아이디 : <%= id %>
	비밀번호 : <%= pwd %>
    <!-- 헤더 시작 -->
    <!-- 로고 / 로그인 -->
    <header>
        <nav>
            <div id="nav">
                <div id="logodiv"><a href="main_6.jsp"><img id="logo" src="/siktam/resources/images/KakaoTalk_20200101_193858750.png" alt=""></a></div>
                <div id="navp">
                    <a class="navp" href="notice_5.jsp"><span>공지사항</span></a>
                    <a class="navp" href="notice_5.jsp"><span>문의사항</span></a>
                    <a class="navp" href="mypagePerson_5.jsp"><span>마이페이지</span></a>
                    <a class="navp" href="login_2.jsp"><span style="border: 2px solid rgb(13, 78, 100); color:white; background-color: rgb(13, 78, 100);">로그인</span></a>
                </div>
            </div>
        </nav>
    </header>

    <hr shadow><br>

    <!-- 검색창 -->
    <div id="div1">
        <img src="/siktam/resources/images/searchbar.png" alt="">
        <input id="searchtext" type="text" placeholder="지역을 입력해주세요" id="searchcontent">
        <a href="searchConditions_4.jsp"><button id="searchbtn"><span class="glyphicon glyphicon-search"></span></button></a>
    </div>

    <!-- 이벤트배너 -->
    <div class="container">
        <br>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
          </ol>
      
          <div class="carousel-inner" role="listbox">
      
            <div class="item active">
              <img src="/siktam/resources/images/banner1.png" alt="img" width="800" height="400">
              <!-- <div class="carousel-caption">
                <h3>Chania</h3>
                <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
              </div> -->
            </div>
      
            <div class="item">
                <img src="/siktam/resources/images/banner2.png" alt="img" width="800" height="400">
            </div>
          
            <div class="item">
                <img src="/siktam/resources/images/banner3.png" alt="img" width="400" height="200">
            </div>
      
            <div class="item">
                <img src="/siktam/resources/images/banner4.png" alt="img" width="400" height="200">
            </div>
        
          </div>
      
          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
    </div>

    <br><hr>

    <!-- TOP5 배너 -->
    <div id="bannersection">
        <ul>
            <li class="banner">               
                <div class="bannertext1">서울 곱창 맛집<br>TOP 5</div>
                <div class="bannerimgb1"></div>                              
            </li>
            
            
            <li class="banner" onclick="location.href = 'eventView_6.jsp'">               
                <div class="bannertext2">전국 쌀국수 맛집<br>TOP 5</div>
                <div class="bannerimgb2"></div>                              
            </li>
            <li class="banner">               
                <div class="bannertext3">서울 닭발 맛집<br>TOP 5</div>
                <div class="bannerimgb3"></div>                              
            </li>
            <li class="banner">               
                <div class="bannertext4">서울 초계탕 맛집<br>TOP 5</div>
                <div class="bannerimgb4"></div>                              
            </li>
            <li class="banner">               
                <div class="bannertext5">서울 족발 맛집<br>TOP 5</div>
                <div class="bannerimgb5"></div>                              
            </li>
            <li class="banner">               
                <div class="bannertext6">서울 돈까스 맛집 <br>TOP 5</div>
                <div class="bannerimgb6"></div>                              
            </li>
        </ul>
    </div>
    

    <script>
        $(function(){
            // 배너 1
            $('.bannerimgb1').hover(function(){
                $('.bannertext1').css({
                    'color':'white',
                    'cursor':'pointer'
                });
                $('.bannerimgb1').css({
                    'opacity':'1',
                    'cursor':'pointer'
                });                
            },function(){
                $('.bannertext1').css('color','black');
                $('.bannerimgb1').css('opacity','0.3');
            });
            // 배너 2
            $('.bannerimgb2').hover(function(){
                $('.bannertext2').css({
                    'color':'white',
                    'cursor':'pointer'
                });
                $('.bannerimgb2').css({
                    'opacity':'1',
                    'cursor':'pointer'
                });                
            },function(){
                $('.bannertext2').css('color','black');
                $('.bannerimgb2').css('opacity','0.3');
            });
            // 배너 3
            $('.bannerimgb3').hover(function(){
                $('.bannertext3').css({
                    'color':'white',
                    'cursor':'pointer'
  
                });
                $('.bannerimgb3').css({
                    'opacity':'1',
                    'cursor':'pointer'
                });                
            },function(){
                $('.bannertext3').css('color','black');
                $('.bannerimgb3').css('opacity','0.3');
            });
            // 배너 4
            $('.bannerimgb4').hover(function(){
                $('.bannertext4').css({
                    'color':'white',
                    'cursor':'pointer'
                });
                $('.bannerimgb4').css({
                    'opacity':'1',
                    'cursor':'pointer'
                });                
            },function(){
                $('.bannertext4').css('color','black');
                $('.bannerimgb4').css('opacity','0.3');
            });
            // 배너 5
            $('.bannerimgb5').hover(function(){
                $('.bannertext5').css({
                    'color':'white',
                    'cursor':'pointer'
                });
                $('.bannerimgb5').css({
                    'opacity':'1',
                    'cursor':'pointer'
                });                
            },function(){
                $('.bannertext5').css('color','black');
                $('.bannerimgb5').css('opacity','0.3');
            });
            // 배너 6
            $('.bannerimgb6').hover(function(){
                $('.bannertext6').css({
                    'color':'white',
                    'cursor':'pointer'
                });
                $('.bannerimgb6').css({
                    'opacity':'1',
                    'cursor':'pointer'
                });                
            },function(){
                $('.bannertext6').css('color','black');
                $('.bannerimgb6').css('opacity','0.3');
            });
        });
    </script>

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
