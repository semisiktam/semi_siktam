<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.semi.reservation.model.vo.*,java.util.*"%>

<%
	ArrayList<ReservationTest> list = (ArrayList<ReservationTest>) request.getAttribute("list");
	int shopDay = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<link rel="stylesheet"
	href="/siktam/resources/css/headerfooterLayout.css">
<!-- 추가 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- x버튼 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/siktam/resources/css/reservation_4.css">
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- timepicker -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link
	href="${pageContext.servletContext.contextPath}/resources/jquery/jquery-ui.css?version=1.3"
	rel="stylesheet" type="text/css" media="screen">
<script
	src="${pageContext.servletContext.contextPath}/resources/js//jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/jquery/jquery-ui.js?version=1.3"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>

<body>
	<!-- 헤더 시작 -->
	<%@ include file="common/header.jsp"%>

	<!-- 이 안에 작업하기 -->
	<form method="POST" target="_self" action="pay_5.jsp">
		<div id="title">
			<div id="titleImg">
				<img src="/siktam/resources/images/udon.png" alt="">
			</div>
			<div id="titleText">
				<h1>
					<b><%=list.get(0).getShopName()%></b>(예약하기)
				</h1>
				<p><%=list.get(0).getShopAddr()%>
				</p>
			</div>
		</div>

		<hr>

		<div id="date-time">
			<div id="date">
				<p>
					<span class="glyphicon glyphicon-calendar"></span> 예약 일자
				</p>
				<p>
					<input type="text" id="datepicker" name="date">
					<!-- <input name="date" type="date" value="minDate();" min="" max=""> -->
					<!-- <input type="text" id="datepicker1" placeholder="예약 일자"> -->
				</p>
			</div>

			<div id="time">
				<p>
					<span class="glyphicon glyphicon-time"></span> 예약 시간
				</p>
				<p>
					<!-- <input name="time" type="time" > -->
					<input type="text" id='timepicker' name="time">
				</p>
			</div>
		</div>

		<div id="menu-result">
			<div id="menu1">
				<p>
					<span class="glyphicon glyphicon-list-alt"></span> 메뉴
				</p>
				<div id="menuType">
					<!-- <ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">짜잔</li>
						<li class="tab-link" data-tab="tab-2">피자</li>
                <li class="tab-link" data-tab="tab-3">짜장면</li>
					</ul> -->
				</div>
				<div id="tab-1" class="tab-content current">
					<table id="tbl">
						<%
							for (ReservationTest r : list) {
						%>
						<tr>
							<td><img src="/siktam/resources/images/03.png"
								style="width: 100px" alt="Image" class="img-thumbnail"></td>
							<td><%=r.getMenuName()%></td>
							<td><%=r.getMenuPrice()%></td>
							<td><img src="/siktam/resources/images/leftArrow.png" alt=""
								width="10" height="10" class="bt_down" /> <input type="text"
								name="num" value="0" id="" class="num" size="1" /> <img
								src="/siktam/resources/images/rightArrow.png" alt="" width="10"
								height="10" class="bt_up" /></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>

			<div id="result1">
				<p>
					<span class="glyphicon glyphicon-check"></span> 주문표
				</p>
				<div id="result2">
					<div id="result3">
						<table id="resultTable">
							<tr>
								<td>후라이드 치킨</td>
								<td>5000원</td>
							</tr>
						</table>
					</div>
					<div id="result5">
						<table id="tblSum">
							<tr>
								<td>결제 금액</td>
								<td>30000원</td>
							</tr>
						</table>
					</div>
					<div id="result4">
						<input type="submit" value="결제" id="btnSubmit" class="btn">
						<input type="reset" value="취소" id="btnReset" class="btn"
							onclick="location.href = 'productDetailPage_6.jsp';">
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		$(function() {
			$('#timepicker').timepicker({
				timeFormat : 'HH:mm',
				interval : 30,
				minTime :
	<%=list.get(0).getShopStartTime().toString()%>
				maxTime :
	<%=list.get(0).getShopEndTime().toString()%>
		,
				defaultTime : '14',
				startTime : '00:00',
				dynamic : false,
				dropdown : true,
				scrollbar : true
			});

		});
	</script>

	<!-- 메뉴 수량 -->
	<script>
		$(function() {
			$('.bt_up').click(function() {
				var n = $('.bt_up').index(this);
				var num = $(".num:eq(" + n + ")").val();
				num = $(".num:eq(" + n + ")").val(num * 1 + 1);
			});
			$('.bt_down').click(function() {
				var n = $('.bt_down').index(this);
				var num = $(".num:eq(" + n + ")").val();
				if (parseInt(num) > 0) {
					num = $(".num:eq(" + n + ")").val(num * 1 - 1);
				}
			});
		})
	</script>

	<script>
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //Input Display Format 변경
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
							,
							changeYear : true //콤보박스에서 년 선택 가능
							,
							changeMonth : true //콤보박스에서 월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
							,
							buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
							,
							yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
							,
							monthNamesShort : [ '1', '2', '3', '4', '5', '6',
									'7', '8', '9', '10', '11', '12' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
							,
							minDate : "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
							maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
							,
							beforeShowDay : function(date) {
								var day = date.getDay();
								return [ (day != 0) ];
							}
						});

		//초기값을 오늘 날짜로 설정
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
</script>

	<!-- 메뉴탭키 -->
	<!-- <script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		})
	</script> -->

	<!-- 푸터 시작 -->
	<%@ include file="common/footer.jsp"%>
</body>
</html>
