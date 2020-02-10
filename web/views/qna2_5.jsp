<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의사항 상세</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/qna2_5.css">
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
                   <table>
                       <thead>
                        <tr>
                            <th>
                                <div class="tb-center">결제 문의</div>
                            </th>
                        </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td class="line">
                                   <div class="line-sub">
                                       <div>
                                           <span>
                                               <em>작성일 :</em>
                                               "2020/01/25"
                                           </span>
                                       </div>
                                       <div>
                                           <span>
                                               <em>작성자 : </em>
                                               "이탐희"
                                           </span>
                                       </div>
                                       <div class="hit">
                                           <span>
                                               <em>조회수 : </em>
                                               "155"
                                           </span>
                                       </div>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <td>
                                   <div class="data-cont">
                                       문의 내용
                                   </div>
                               </td>
                           </tr>
                       </tbody>
                   </table>
                   <div class="replyDiv">
                    <form action="" method="">					
                        <table align="center">
                            <tr>
                                <td>댓글 작성</td>
                                <td><textArea rows="3" cols="120" id="replyContent" name="replyContent"></textArea></td>
                                <td><button type="submit" id="addReply">댓글 등록</button></td>
                            </tr>
                        </table>
                    </form>
                </div>
                   <div class="list">
                       <input type="button" value="목록" onclick="location.href='qna_5.html'">
                   </div>
            </div>
            
            
    </div>






   


    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
