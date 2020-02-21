<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="/siktam/resources/css/ShopPidCheck.css">
<title>사업자 번호 조회</title>
</head>
<body>

<div>
<form action="/siktam/spc.me" method="post">
사업자번호 : <input type="text" class="form-control" name="Shoppid" id="Shoppid">
사업장명 :<input type="text" class="form-control" name="Shopname" id="Shopname">
      <input type="button" id="shopNumChk" value="사업자번호 체크"> 
</form>

<form>
	<form action="registerCompany_2.jsp" method="post">
    <input type="button" id="shopPidInput" value="입력하기">

</form>                    
                    
 <!-- 사업자번호 체크 버튼 누른후 사업자번호 확인되어야 입력하기 버튼 활성화 되도록 -->                   
</form>
</div>

<script>

/* $("#shopPidInput")click.function(){
	$.ajax({
		url : "registerCompany_2.jsp",
		type : "get",
		date : {
			
		}
	}) */
	
	
</script>
</body>
</html>