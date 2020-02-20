<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.semi.shop.model.vo.*"%>

<%
	
	ArrayList<Shop> list = (ArrayList<Shop>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>admin mode</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/siktam/resources/css/admin_4.css">
<link rel="stylesheet" href="/siktam/resources/css/notice_5.css">

<style>
.tbl td {
	height: 200px;
}

#deleteButton{
	width: 55px;
    color: #fff;
    background-color: #d9534f;
    border-color: #d43f3a;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    padding: 6px 12px;
    border-radius: 4px;
}

</style>
</head>
<body style="height: 1080px">

	<%@ include file="common/admin_header.jsp"%>

	<div class="container" style="margin-top: 50px">
		
		<div class="pagesearch"></div>

		<div class="noticeTitle">
                <h1>업체</h1>
            </div>
            <div class="tableDiv" style="border: 5px solid #ddd;">
                    <table id="listArea" style="margin-top:0;">
                        <thead>
                            <tr>
                              <th>매장등록번호</th>
                              <th>사용자아이디</th>
                              <th>매장명</th>
                              <th>매장주소</th>
                              <th>매장전화번호</th>
                              <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Shop s : list){ %>
							<tr>
								<td><%= s.getShopPid() %></td>
								<td><%= s.getUserId() %></td>		
								<td><%= s.getShopName() %></td>		
								<td><%= s.getsAddr() %></td>		
								<td><%= s.getsPhone() %></td>
								<td><input id="deleteButton" type="button" value="삭제"></td>			
							</tr>
							<% } %>
                        </tbody>
                    </table>
            </div>

	</div>
	<!-- class container -->
	<%-- <script>

$(function(){
	
	$("#tbl td").mouseenter(function(){
		$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white"});
	}).click(function(){
		//console.log($(this).parent().children().eq(0).text());
		var eno = $(this).parent().children().eq(0).text();
		location.href="<%=request.getContextPath()%>/eSelctOne.ev?eno=" + eno;
	});
});


</script> --%>


</body>
</html>