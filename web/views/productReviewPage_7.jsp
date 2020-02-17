<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.review.model.vo.*"%>
<%
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("reviewList"); 
	Member mem = (Member)request.getAttribute("member");
	Shop s = (Shop)request.getAttribute("shop");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>   

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 페이지</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/productReviewPage_7.css">
    <script src="/siktam/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->

    <div id="all"> <!-- 전체 div-->
        <div class="pagemainimg"></div>
        <div class="pageselect">
            <!-- %% 업체정보연결-->
            <a href="productDetailPage_6.jsp"><div id="information"><span>업체정보</span></div></a>
            <!-- %% 리뷰연결-->
            <a href="productReviewPage_7.jsp"><div id="review"><span>리뷰</span></div></a>
        </div>

        <div id="pagetop">
            <h3>역전 우동 0416</h3>
            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>
        </div>

        <br>
        <h3>매장 평점</h3>
        <hr>

        <div id="score"> <!-- 평점 -->
            <div id="number" class="scoreIn">
                <h3 id="numberScore">4.0점</h3><br>
                <!--<img id="scoreNumber" src="/siktam/resources/images/star.png" alt="">-->
                <!-- <div class="starRev">
                    <span class="starR on">별1</span>
                    <span class="starR">별2</span>
                    <span class="starR">별3</span>
                    <span class="starR">별4</span>
                    <span class="starR">별5</span>
                </div> -->
                <p id="star_grade">
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </p>
            </div>
            <div id="scores" class="scoreIn">
                <h4 class="jum">5점&nbsp;&nbsp;<progress value="25" max="100" class="var">Progress : 30%</progress></h4><br>
                <h4 class="jum">4점&nbsp;&nbsp;<progress value="40" max="100" class="var"></progress></h4><br>
                <h4 class="jum">3점&nbsp;&nbsp;<progress value="60" max="100" class="var"></progress></h4><br>
                <h4 class="jum">2점&nbsp;&nbsp;<progress value="35" max="100" class="var"></progress></h4><br>
                <h4 class="jum">1점&nbsp;&nbsp;<progress value="10" max="100" class="var"></progress></h4><br>
                
            </div>
        </div>

        <br>
        <h4>리뷰</h4>
        <hr>
        <br>

        <div>

            <div id="wReview">
                <button id="wReviewbtn">리뷰 작성</button>
                <p>리뷰 쓰기</p>
            </div>
            <br>
            <div id="select1"> <!-- 리뷰 시작 -->
                <label>정렬방식</label> <!-- 리뷰 정렬 방식 선택-->
                <select> <!-- TODO -->
                    <option value="최신순">최신순</option>
                    <option value="별점순">별점순</option>
                </select>
            </div>
            <br>
        </div>
        
        <br>

        <div id="reviewWriteText">
            <div class="allReview" id="writeReview">
                <div>
                    <img class="id1" src="/siktam/resources/images/person1.png" alt="">&nbsp;&nbsp;<label class="idLabel">id</label>
                </div>
                <br>
                <label>별점 : </label>
                <label id="star_grade_review">
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </label>
                <br><br>
                <div>
                    <label>사진 등록 : </label>
                    <label>
                        <input type="file" id="ex_file">
                    </label>
                    <br><br>
                    <textarea name="review" id="reviewText" cols="105" rows="10" placeholder="리뷰를 작성해 주세요"></textarea>
                    <br>
                    <button id="rwbtn" class="rwbtn">리뷰등록</button>
                </div>
            </div>
        </div>
        
        <br><br><br>

        <!-- 각 버튼은 리뷰 상세를 열고 닫는 버튼 설정 TODO-->

		<% for(Review r : rList){ %>
			<div class="allReview">
            <div class="personInfo">
                <img class="id1" src="/siktam/resources/images/person1.png" alt="">&nbsp;&nbsp;<label class="idLabel"><%= r.getUserId() %></label>
                <div class="bottomBtn"><button id="btn1" class="reviewBtn">▼</button>▼</div>
            </div>
            <div id="personReview1" class="personReview">
                <label>별점 : </label>
                <label id="star_view1">
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </label>
                <br><br>
                <div class="imgDiv">
                    <img src="/siktam/resources/images/<%=r.getReviewImg() %>" class="reviewImg" alt="">
                </div>
                <br>
                <p><%= r.getrContent() %></p>
            </div>
        </div>
		<% } %>
		
        <div class="allReview">
            <div class="personInfo">
                <img class="id1" src="/siktam/resources/images/person1.png" alt="">&nbsp;&nbsp;<label class="idLabel">hyeonhee9411</label>
                <div class="bottomBtn"><button id="btn1" class="reviewBtn">▼</button>▼</div>
            </div>
            <div id="personReview1" class="personReview">
                <label>별점 : </label>
                <label id="star_view1">
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </label>
                <br><br>
                <div class="imgDiv">
                    <img src="/siktam/resources/images/07.png" class="reviewImg" alt="">
                </div>
                <br>
                <p>족발이 사진과 너무 다르게 와서 양도 적고 아쉽지만 맛은 정말 맛있습니다!<br>다음에 또 시켜먹을께요!</p>
            </div>
        </div>

        <br>

        <!-- <div class="allReview">
            <div class="personInfo">
                <img class="id1" src="/siktam/resources/images/person1.png" alt="">&nbsp;&nbsp;<label class="idLabel">tamheekim0110</label>
                <div class="bottomBtn"><button id="btn2" class="reviewBtn">▼</button>▼</div>
            </div>
            <div id="personReview2" class="personReview">
                <label>별점 : </label>
                <label id="star_view2">
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </label>
                <br><br>
                <div class="imgDiv">
                    <img src="/siktam/resources/images/tamlove1.jpg" class="reviewImg" alt="">
                </div>
                <br>
                <p>매주 찾아가서 먹는 곱찾이지만 전혀 느끼하지 않고 생간과 천엽이 너무너무 신선해요!<br>
                   종업원 분들도 너무 친절하게 해주셔서 잘 먹었습니다!
                </p>
            </div>
        </div>

        <br>

        <div class="allReview">
            <div class="personInfo">
                <img class="id1" src="/siktam/resources/images/person1.png" alt="">&nbsp;&nbsp;<label class="idLabel">jiwonseo309</label>
                <div class="bottomBtn"><button id="btn3" class="reviewBtn">▼</button>▼</div>
            </div>
            <div id="personReview3" class="personReview">
                <label>별점 : </label>
                <label id="star_view3">
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </label>
                <br><br>
                <div class="imgDiv">
                    <img src="/siktam/resources/images/05.png" class="reviewImg" alt="">
                </div>
                <br>
                <p>역시 한국인의 해장에는 빨간 국물이 최고인거 같네요!<br>
                   김치가 맛있어서 그런지 깊은 맛이 있고 국물의 감칠맛이 좋습니다!
                </p>
            </div>
        </d -->iv>
        
        <br>
        
        <!-- 버튼 -->
        
        <div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/rPage.ro?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/rPage.ro?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/rPage.ro?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/rPage.ro?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/rPage.ro?currentPage=<%= maxPage %>'">>></button>
			
		</div>
        <br>
		
        <script>
            $(function(){

                $('.personReview').css('display','none');
                

                $('#btn1').click(function(){
                   /*  $('.personReview1').css('display','block'); */
                    $('#personReview1').slideToggle();
                });
                $('#btn2').click(function(){
                    $('#personReview2').slideToggle();
                });
                $('#btn3').click(function(){
                    $('#personReview3').slideToggle();
                });

                $('#reviewWriteText').css('display','none');

                /* $('#reviewWriteText').slideUp(); */

                $('#wReviewbtn').click(function(){
                    $('#reviewWriteText').slideToggle();
                });

                $("#star_grade a").eq(3).addClass("on").prevAll("a").addClass("on");
                $('#star_view1 a').eq(2).addClass("on").prevAll("a").addClass("on");
                $('#star_view2 a').eq(4).addClass("on").prevAll("a").addClass("on");
                $('#star_view3 a').eq(3).addClass("on").prevAll("a").addClass("on");

            /* $('.starRev span').click(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                return false;
            }); */

            $('#star_grade a').click(function(){
                $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
                $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
                return false;
            });

            $('#star_grade_review a').click(function(){
                $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
                $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
                return false;
            });
            $('#star_view1 a').click(function(){
                $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
                $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
                return false;
            });

            $('#star_view2 a').click(function(){
                $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
                $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
                return false;
            });

            $('#star_view3 a').click(function(){
                $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
                $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
                return false;
            });
        });
        </script>

    </div>


    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
