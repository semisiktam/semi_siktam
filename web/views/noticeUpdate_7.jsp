<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.notice.model.vo.*"%>
    <%
    	Notice n = (Notice)request.getAttribute("notice");
    	String nno = request.getParameter("nno");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/qna_form_5.css">
    <script src="/siktam/resources/js/jquery-3.4.1.min.js"></script>
    
    
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
    <div class="wrap" align="center">
    
            <div class="noticeTitle">
                <h1>공지사항</h1>
            </div>
            <div class="qnaDiv">
                <form id="updateForm" method="post">
                    <div id="qna_write">
                        <table class="qna_tab">
                            <tbody>
                                <tr>
                                    <td class="qna_write_td">작성자</td>
                                    <td><input type="text" name="nwriter" value="<%=m.getUserId()%>" readonly></td>
                                </tr>
                                <tr>
                                    <td class="qna_write_td">제목</td>
                                    <td>
                                        <input type="text" name="ntitle" id="qna_write_title_input" value="<%=n.getnTitle()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="qna_write_td">내용</td>
                                    <td>
                                        <textarea name="ncontext" class="qna_write_textarea" style="resize:none"><%=n.getnContext()%></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="confirm">
                   	   		<input type="submit" id="submitBtn" value="수정하기" onclick="location.href='nUpdate.no?nno=<%=nno%>'">
                            <input type="submit" id="submitBtn" value="삭제하기" onclick="deleteNotice();">
                        </div>
                    </div>
                </form>
            </div>
            
    </div>
	<!--
	<script>
	
		function complete(){
			$("#updateForm").attr("action","/nUpdate.no?nno="+nno);
		};
		function deleteNotice(){
			$("#updateForm").attr("action","/nDelete.no");
		};
	
	</script>
	-->



   


    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
    