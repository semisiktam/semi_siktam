<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.qna.model.vo.*"%>
    
<% ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list"); %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의사항</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/qna_5.css">
    <script src="/siktam/resources/js/jquery-3.4.1.min.js"></script>
    
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
    <div class="wrap" align="center">
            <div class="noticeTitle">
                <h1>문의사항</h1>
            </div>
            <div class="tableDiv">
                    <table id="listArea">
                        <thead>
                            <tr>
                              <th>번호</th>
                              <th style="width:70%">제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for(Qna q : list){ %>
                            <tr>
                              <td><%= q.getqNo() %></td>
                              <td><%= q.getqTitle() %></td>
                              <td><%= q.getUserId() %></td>
                              <td><%= q.getqDate() %></td>
                            </tr>
                         <% } %>
                            
                        </tbody>
                    </table>
            </div>
            <fieldset>
                <label for="name"><input type="radio" name="search" id="name">이름</label>
                <label for="title"><input type="radio" name="search" id="title">제목</label>
                <label for="text"><input type="radio" name="search" id="text">내용</label>
                <input type="text" id="searchTxt">
                <input type="button" id="searchBtn" value="검색">
                <input type="button" id="writeBtn" value="작성하기" onclick="location.href='views/qna_form_5.jsp'">
            </fieldset>
    </div>

	<script>  
		$(function(){
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var qno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/qSelectOne.qn?qno=" + qno;
			});
		});
		
		<%-- $('#searchBtn').click(function(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}); --%>
	</script>




   


    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
