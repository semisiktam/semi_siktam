<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/siktam/resources/css/header_idpw.css">
    <link rel="stylesheet" href="/siktam/resources/css/HowFindPassword_1.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Find Id</title>
    
</head>

<body>
    <%@ include file="common/header_idpw.jsp" %>

    <!-- 여기부터 -->
    <div id="container">
        
        <div id="area1">
            <a href="/siktam/view/main_6.jsp">
            <div id="area1Img">
                <img src="/siktam/resources/images/KakaoTalk_20200101_193858750.png" alt="">
            </div>
            </a>
        <div id="area3">
            <a href="/siktam/view/IdFind_1.jsp">
            <div class="idDiv">
                <h1>아이디 찾기</h1>
                <hr class="hr">
            </div>
            </a>
            <a href="/siktam/view/FindPassword_1.jsp">
            <div class="pwdDiv">
                <h1>비밀번호 찾기</h1>
                <hr class="hr">
            </div>
        </a>
        </div>
        <div id="area2">
        <div class="div2">
            <h4>유승제님, 인증 가능한 연락처를 선택해주세요</h4>
        <br>
            <div>
                <input type="radio" id="phone" class="radio" name="find" onclick="divshow();">&nbsp;<div class="phoneHint">회원 정보에 등록된 휴대폰 번호 <br> 010-****-*245</div><br>
                <div id="f1" class="radioDiv" style="display: none;">
                    이름 &nbsp;&nbsp;<input type="text" class="text" placeholder="이름을 입력해주세요"> <br>
                    휴대폰 번호 &nbsp;&nbsp;<input type="text" class="text" placeholder="휴대폰번호를 입력해주세요"><br>
                    <button>인증번호 요청</button>
                    
                </div>
            </div>
            <div>
                <input type="radio" id="email" class="radio" name="find" onclick="divshow();">&nbsp;<label for="email">등록된 이메일로 찾기</label><br>
                <div id="f3" class="radioDiv">
                    <input type="email" class="text" placeholder="이메일을 입력해주세요">&nbsp;<button>인증번호 요청</button>
                </div>
            </div>
            <div>
                <input type="radio" id="rphone"  class="radio" name="find" onclick="divshow();">&nbsp;<label for="rphone">등록된 핸드폰으로 찾기</label><br>
                <div id="f2" class="radioDiv">
                    <input type="text" class="text" placeholder="이름을 입력해 주세요"><br>
                    <input type="text" class="text" placeholder="가입했을때 등록된 핸드폰 번호">&nbsp;<button>인증번호요청</button>
                </div>
            </div>
            
           
        </div>


    <script>
        function divshow() {
            if ($('input:radio[id=phone]').is(':checked')) {
                $('#f1').slideDown();
            } else {
                $('#f1').slideUp();
            }
            if ($('input:radio[id=rphone]').is(':checked')) {
                $('#f2').slideDown();
            } else {
                $('#f2').slideUp();
            }
            if ($('input:radio[id=email]').is(':checked')) {
                $('#f3').slideDown();
            } else {
                $('#f3').slideUp();
            }
            if ($('input:radio[id=pid]').is(':checked')) {
                $('#f4').slideDown();
            } else {
                $('#f4').slideUp();
            }
        }



    </script>

        <div class="div3">
            아이디를 잊으셨나요? &nbsp;<a href="FindPassword.jsp" style="color: black;">아이디 찾기 (이동)</a>
        </div>
        <br>
        </div>
    </div>
    
    
</body>

</html>
