<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입(개인)</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/register_person_5.css">
    
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
            <form action="/siktam/mInsert.me" method="get">
                <div class="wrap" align="center">
                    <h1 align="center">회원가입</h1>
                    <h4 align="center">회원정보 입력</h4><br>
                <table class="regist">
                    <tr>
                        <th align="left">아이디 </th>
                        <td><input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요"></td>  
                        <td><button id="confirm">중복 확인</button></td>      
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
                        <td><input type="address" class="form-control" name="address"></td>       
                    </tr>
                     
                    <tr>
                        <th align="left">이름 </th>
                        <td><input type="text" class="form-control" name="name"></td>       
                    </tr>
                     
                    <tr>
                        <th align="left">주민번호 </th>
                        <td><input type="text" class="form-control" id="pid1" name="pid1" maxlength="6"> - 
                        <input type="text" class="form-control" id="pid2" name="pid2" maxlength="1"> ******
                        </td>      
                    </tr>

                    <tr>
                        <th align="left">휴대폰 번호 </th>
                        <td><input type="tel" class="form-control" name="tel"></td>
                        <td><button id="confirm">휴대폰인증</button></td>
                    </tr>
                    <tr>
                        <th align="left">인증번호 입력 </th>
                        <td><input type="tel" class="form-control" name="tel"></td>
                        
                    </tr>
         
                </table><br>
                <div id="chkwrap1" >
                    <h3>약관동의</h3>
                </div>
                <div id="chkwrap2">
                    
                    <div class="all-chk">
                        <label>
                            <input type="checkbox" class="chk_1" name="all_agree" id="all_agree" value="all_agree" onclick="allselect(this.checked)"> 전체동의
                        </label>
                    </div>
                    <div class="chk">
                        <ul>
                            <li class="chk-info">
                                <label>
                                    <input type="checkbox" class="chk_1" name="agree1" id="agree1" value="agree1">
                                    이용약관동의(필수)
                                </label>
                                <a href="termsOfUse_5.jsp" target="_blank"><sub>내용보기</sub></a>
                            </li>
                            <li class="chk-info">
                                <label>
                                    <input type="checkbox" class="chk_1" name="agree1" id="agree2" value="agree2">
                                    개인정보수집 및 이용동의(필수)
                                </label>
                                <a href="termsOfUse_5.jsp" target="_blank"><sub>내용보기</sub></a>
                            </li>
                            <li class="chk-info">
                                <label>
                                    <input type="checkbox" class="chk_1" name="agree1" id="agree3" value="agree3">
                                    전자금융거래 이용약관(필수)
                                </label>
                                <a href="termsOfUse_5.jsp" target="_blank"><sub>내용보기</sub></a>
                            </li>
                            <li class="chk-info">
                                <label>
                                    <input type="checkbox" class="chk_1" name="agree1" id="agree4" value="agree4">
                                    만 14세 이상 이용자(필수)
                                </label>
                                <a href="termsOfUse_5.jsp" target="_blank"><sub>내용보기</sub></a>
                            </li>
                            <li class="chk-info">
                                <label>
                                    <input type="checkbox" class="chk_1"name="agree1" id="agree5" value="agree5">
                                    식탐 혜택알림 동의(선택)
                                </label>
                                <a href="termsOfUse_5.jsp" target="_blank"><sub>내용보기</sub></a>
                            </li>
                            
                            
                        </ul>
                    </div>
                    
                </div>
                <input type="submit" class="btn" value="회원가입" onclick="return check();">
                
                
                <!-- <input type="reset" class="btn" value="취소"> -->
             </div>
        </form> 
    
        <script>
            function allselect(chd) {
            var agree1 = document.getElementsByName("agree1");
            for (var i = 0; i < agree1.length; i++) {
                agree1[i].checked = chd;
            }
        }
        </script>

    

    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>
