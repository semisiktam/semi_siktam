<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*, java.util.*"%>

<% 
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); 
	MemberPageInfo mpi = (MemberPageInfo)request.getAttribute("mpi");
	int listCount = mpi.getListCount();
	int currentPage = mpi.getCurrentPage();
	int maxPage = mpi.getMaxPage();
	int startPage = mpi.getStartPage();
	int endPage = mpi.getEndPage();	
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
  .wrap{
  	padding-top: 50px;
  }
  
  th, td{
  	font-size: 12px;
  }

  </style>
</head>

<body style="height:1080px">

<%@ include file="common/admin_header.jsp" %>

	<div class="wrap" align="center">
            <div class="noticeTitle">
                <h1>회원리스트</h1>
            </div>
            <div class="tableDiv">
                    <table id="listArea">
                        <thead>
                            <tr>
                              <th>아이디</th>
                              <th width="110px">주소</th>
                              <th width="110px">이름</th>
                              <th>주민번호</th>
                              <th>전화번호</th>
                              <th width="60px">업체</th>
                              <th width="110px">마일리지</th>
                              <th>쿠폰</th>
                              <th width="110px">블랙리스트</th>
                              <th width="110px">탈퇴</th>
                              <th>가입일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Member mem : list){ %>
							<tr>
								<td><%= mem.getUserId() %></td>
								<td><%= mem.getAddr() %></td>		
								<td><%= mem.getName() %></td>		
								<td><%= mem.getPid() %></td>		
								<td><%= mem.getPhone() %></td>		
								<td><%= mem.getShopYN() %></td>		
								<td><%= mem.getMileage() %></td>		
								<td><%= mem.getCouponNo() %></td>		
								<td><%= mem.getBlackYN() %></td>		
								<td><%= mem.getOutYN() %></td>		
								<td><%= mem.getEnrolldate() %></td>
							</tr>
							<% } %>
                        </tbody>
                    </table>
            </div>
            
            <br>
            
            <%-- 페이지 처리 --%>
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=1'"><<</button>
				<%  if(currentPage <= 1){  %>
				<button disabled></button>
				<%  }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%=currentPage - 1 %>'"><</button>
				<%  } %>
				
				<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){
				%>
					<button disabled style="background: gray; color: white"><%= p %></button>
				<%      }else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= p %>'"><%= p %></button>
				<%      } %>
				<% } %>
					
				<%  if(currentPage >= maxPage){  %>
				<button disabled>></button>
				<%  }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%=currentPage + 1 %>'">></button>
				<%  } %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.,me?currentPage=<%= maxPage %>'">>></button>
				
			</div>
            
            <fieldset>
                <!--<label for="name"><input type="radio" name="search" value="writer">작성자</label>
                <label for="title"><input type="radio" name="search" value="title">제목</label>
                <label for="text"><input type="radio" name="search" value="text">내용</label>  -->
                <select id="searchCondition">
                	<option>---</option>
                	<option value="writer">작성자</option>
                	<option value="title">제목</option>
                	<option value="context">내용</option>
                </select>
                <input type="text" id="keyword">
                <input type="button" id="searchBtn" value="검색">
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
				//var nno = $(this).parent().children().eq(0).text();
				//location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno;
			});
		});
		
		$('#searchBtn').click(function(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		});
	</script>
</body>


</html>
    