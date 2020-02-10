<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/register_person_5_7.css">
    
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
            <form action="" method="post">
                <div class="wrap" align="center">
                    <h1 align="center">회원정보 수정</h1>
                    <h4 align="center">수정정보 입력</h4><br>
                <table class="regist">
                    <tr>
                        <th align="left">아이디 </th>
                        <td><input type="text" class="form-control" name="id" value="tamhee0110" disabled></td>      
                    </tr>
                    <tr>
                        <th align="left">비밀번호 </th>
                        <td><input type="password" class="form-control" name="pass1" placeholder="비밀번호를 입력해주세요"></td>      
                    </tr>  
                    <tr>
                        <th align="left">비밀번호 확인 </th>
                        <td><input type="password" class="form-control" name="pass2" placeholder="비밀번호를 다시 입력해주세요"></td>        
                    </tr> 
                    <tr>
                        <th align="left">주소 </th>
                        <td><input type="address" class="form-control" name="address" value="의정부시 곱창동"></td>       
                    </tr>
                     
                    <tr>
                        <th align="left">이름 </th>
                        <td><input type="text" class="form-control" name="name" value="이탐희"></td>       
                    </tr>

                    <tr>
                        <th align="left">휴대폰 번호 </th>
                        <td><input type="tel" class="form-control" name="tel" value="01012345678" disabled></td>
                        <td><button id="confirm">휴대폰인증</button></td>
                    </tr>
                    <tr>
                        <th align="left">인증번호 입력 </th>
                        <td><input type="tel" class="form-control" name="tel"></td>
                    </tr>
         
                </table><br>
                <input type="submit" class="btn" value="수정" onclick="return check();">
                <input type="reset" class="btn" value="탈퇴" onclick="location.href = 'mypagePerson_5.jsp'">

                <br><br>
            </div>
       </form>
       

    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
