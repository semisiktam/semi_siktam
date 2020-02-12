<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입(개인)</title>
    <link rel="stylesheet" href="/siktam/resources/css/headerfooterLayout.css">
    <link rel="stylesheet" href="/siktam/resources/css/registerCompany_2.css">
    <script src="/siktam/resources/js/jquery-3.4.1.min.js"></script>

    
</head>
<body>
    <!-- 헤더 시작 -->
    <%@ include file="common/header.jsp" %>

    <!-- 이 안에 작업하기 -->
    <input type="file" id="file" style="display:none;">
    <form action="/siktam/test1.do" method="get">
        <div class="wrap" align="center">
            <h1 align="center">업체등록</h1>
            <h4 align="center">식탐과 함께 할 매장을 등록해주세요!</h4><br>
        <table class="regist">
            <tr>
                <th align="left">매장명 </th>
                <td><input type="text" class="form-control" name="shopName" placeholder="매장명을 등록해주세요"></td>  
                <!-- <td><button id="confirm">중복 확인</button></td>       -->
            </tr>
            <tr>
                <th align="left">매장 사진 </th>
                <td>
                    <!-- <input type="text" class="form-control" name="pass1" placeholder=""> -->
                    <!-- <button id="upload" type="button" onclick="oncolick=document.all.file.click()">매장 사진 등록하기</button> -->
                    <!--평소에는 보이지 않다가 사진을 등록하면 script를 통해 div를 추가시킬 예정-->
                    <!--버튼 클릭시 파일을 삽입할 수 있도록 할 예정 -->
                    <!-- <input type="file" name="uploadFile" id="uploadFile" multiple>
                    <div id="preview"></div> -->
                    <input type="file" name="shopImg" style="width:500px;" accept="image/*" multiple onchange="fileInfo(this)" /><br>
                    <div id="img_box"></div>
                
                </td>    
            </tr>  
            <tr>
                <th align="left">매장주소 </th>
                <td><input type="text" class="form-control" name="address" placeholder=""></td>        
            </tr> 
            <tr>
                <th align="left">매장 전화번호 </th>
                <td><input type="text" class="form-control" name="phone"></td>       
            </tr>
             
            <tr>
                <th align="left">사업자 등록번호 </th><!--사업자 등록 조회 API삽입-->
                <td><input type="text" class="form-control" name="pid">
                    <button id="shopNum">사업자 번호</button>
                </td>       
                
            </tr>
             
            <tr>
                <th align="left">영업시간 </th>
                <td>
                    <input type="time" name="startTime">부터
                    <input type="time" name="endTime">까지
                    <br>
                    <input type="text" style="width:200px" name="Day" placeholder="휴무일을 입력해주세요">
                    
                </td>
                <!-- <td><input type="text" class="form-control" id="pid1" name="pid" maxlength="6"> -  -->
                <!-- <input type="text" class="form-control" id="pid2" name="pid" maxlength="1"> ****** -->
                <!-- </td>       -->
            </tr>

            <tr>
                <th align="left">메뉴 카테고리 </th>
                <td><div id="category">
                    <input type="checkbox" name="eatType" id="a"><label for="a">한식</label>
                    <input type="checkbox" name="eatType" id="b"><label for="b">중식</label>
                    <input type="checkbox" name="eatType" id="c"><label for="c">분식</label>
                    <input type="checkbox" name="eatType" id="d"><label for="d">양식</label>
                    <input type="checkbox" name="eatType" id="e"><label for="e">일식</label><br>
                    <input type="checkbox" name="eatType" id="f"><label for="f">카페/디저트</label>&nbsp;
                    <input type="checkbox" name="eatType" id="g"><label for="g">치킨</label>
                    <input type="checkbox" name="eatType" id="h"><label for="h">피자</label>
                    <input type="checkbox" name="eatType" id="i"><label for="i">족발/보쌈</label><br>
                    <input type="checkbox" name="eatType" id="j"><label for="j">도시락</label>
                    <input type="checkbox" name="eatType" id="k"><label for="k">찜/탕</label>
                    <input type="checkbox" name="eatType" id="l"><label for="l">프랜차이즈</label>
                </div></td>
                <!-- <td><input type="tel" class="form-control" name="tel"></td> -->
                <!-- <td><button id="confirm">휴대폰인증</button></td> -->
            </tr>
                <tr>
                    <th align="left">메뉴 등록 </th>
                    <td>
                        <h4>메뉴명<br></h4><input type="text" class="form-control" name="menuName"><br>
                        <h4>사진등록<br></h4><input type="text" class="form-control" name="menuImg"><!--등록한 사진의 경로를 표시-->
                        &nbsp;
                        <button type="button" id="upload2" onclick="document.all.file.click();">메뉴사진등록</button><br>
                        <h4>가격<br></h4>
                        <input type="text" class="form-control" name="menuPrice"><br>
                        
                        <h4>기타설명<br></h4>
                        <input type="text" class="form-control" name="menuInfo"><br><br>
                        
                        <button type="button" id="menu" ><h3>메뉴 등록</h3></button><!--메뉴등록 버튼을 누르면 등록한 사진과 value를 바탕으로 하단에 메뉴 생성-->
                        
                        <div id="uploadpic2" style="width: 100px; height: auto; background: white; color:black; margin-top:10px;">
                           <!--이미지를 디코드 할 방법 모색이 필요해 보임 size를 설정해도 div 태그를 넘어감-->
                        </div><!--메뉴명의 vaule와 등록한 사진 경로로 이미지 등록할 예정-->
                    </td>
                </tr>


            <tr>
                <th align="left">테이블형태</th>
                <td><div id="tableForm">
                    <input type="checkbox" name="table" id="t1"><label for="t1">1인석</label>
                    <input type="checkbox" name="table" id="t2"><label for="t2">2인식</label>
                    <input type="checkbox" name="table" id="t3"><label for="t3">칸막이</label>
                    <input type="checkbox" name="table" id="t4"><label for="t4">바테이블</label>
                    <input type="checkbox" name="table" id="t5"><label for="t5">셀프주문</label>
                </div></td>
            </tr>
            
 
        </table><br>
        </form>
        
        <button class="button" type="submit">업체 등록 완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="button" type="reset">업체 등록 취소</button>
        
        <script>
            $("#upload").click(function(){
                $("#uploadpic1").css("display","block");
                console.log("aaaa")
            });
            $("#menu").click(function(){
                $("#uploadpic2").css("display","block").css("background","gray");
                
                console.log("aaaa")
            });
        </script>
    </div>
    <!-- 푸터 시작 -->
    <%@ include file="common/footer.jsp" %>
</body>
</html>