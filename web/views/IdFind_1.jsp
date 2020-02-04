<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/IdFind_1.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Find Id</title>
    
</head>

<body>
    <%@ include file="common/header.jsp" %>

    <!-- 여기부터 -->
    <div id="container">

        <div id="area1">
            <a href="/siktam/view/main_6.jsp">
                <div id="area1Img">
                    <img src="/siktam/resources/images/KakaoTalk_20200101_193858750.png" alt="">
                </div>
            </a>
        <a href="/siktam/view/IdFind_1.jsp">
        <div id="area3">
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
        </div>
        </a>
        <div id="area2">
        <div class="div2">
            <h4>아이디 찾기 방법 중 가능한 방법을 선택해 주세요.</h4>
        <br>
            <div>
                <input type="radio" id="phone" class="radio" name="find" onclick="divshow();">&nbsp;<label for="phone">핸드폰 인증</label><br>
                <div id="f1" class="radioDiv" style="display: none;">
                    내 명의로 가입한 아이디와, 이름/핸드폰번호가 일치하는 아이디를 찾습니다<br>
                    <button>다음단계</button>
                    
                </div>
            </div>
            <div>
                <input type="radio" id="rphone"  class="radio" name="find" onclick="divshow();">&nbsp;<label for="rphone">등록된 핸드폰으로 찾기</label><br>
                <div id="f2" class="radioDiv">
                    <input type="text" class="text" placeholder="이름을 입력해 주세요"><br>
                    <input type="text" class="text" placeholder="가입했을때 등록된 핸드폰 번호">&nbsp;<button>다음단계</button>
                </div>
            </div>
            <div>
                <input type="radio" id="email" class="radio" name="find" onclick="divshow();">&nbsp;<label for="email">등록된 이메일로 찾기</label><br>
                <div id="f3" class="radioDiv">
                    <input type="email" class="text" placeholder="이메일을 입력해주세요">&nbsp;<button>다음단계</button>
                </div>
            </div>
            <div>
                <input type="radio" id="pid" class="radio" name="find" onclick="divshow();">&nbsp;<label for="pid">등록된 이름/생년월일/성별 찾기</label><br>
                <div id="f4" class="radioDiv">
                    <input type="text" class="text" placeholder="이름을 입력해 주세요">&nbsp;<input type="date" class="text">&nbsp;
                    <select style="height: 29px;">
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                    </select>
                    <br><button>다음단계</button>
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
            비밀번호 찾으시나요? &nbsp;<a href="FindPassword_1.jsp" style="color: black;">비밀번호 찾기 (이동)</a>
        </div>
        <br>
        </div>
    </div>
    
   
</body>

</html>
    