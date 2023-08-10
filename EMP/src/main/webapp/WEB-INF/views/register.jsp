<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>


<style>
body{
	font-family: 'GmarketSansMedium';
	align: center;
	margin: 50px;
}

input[type="text"]{
	width:400px;
}

table{
	border:1px solid black;
	margin-left:auto;
	margin-right:auto;
}

 #wrapper{
        width:300px;
        margin:auto;
}
</style>

<script>
function validatTel(){
	const regex = /\d{3}-\d{4}-\d{4}/; 
	const tell = document.getElementById('tel');

	if(regex.test(tell.value)===false){
		window.alert('000-0000-0000 형식만 등록 가능합니다');
		tell.focus();
		tell.value = null;
	}
}

function validateEmail(){
	const regex =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	const email = document.getElementById('email');
	
	if(regex.test(email.value)===false){
		alert('올바른 이메일 형식이 아닙니다');
		email.focus();
		email.value = null;
	} 
}
</script>


<body>
<h1 align="center">직원 관리 프로그램</h1>

<h3 align="center">직원 등록</h3>

<div class="d-flex justify-content-center align-items-center">
<form name="empInsert" id="empInsert" action="register.do" method="post">
  <div class="mb-3">
    <label for="InputIdx" class="form-label">직원번호</label>
    <input type="text" class="form-control" id="idx" name="idx">
    <div id="idxHelp" class="form-text">숫자를 입력해주세요</div>
  </div>
  
  <div class="mb-3">
    <label for="InputRank" class="form-label">직급</label>
    <input type="text" class="form-control" id="rank" name="rank">
    <div></div>
  </div>
  
  <div class="mb-3">
    <label for="InputRank" class="form-label">이름</label>
    <input type="text" class="form-control" id="name" name="name">
    <div></div>
  </div>
  
  <div class="mb-3">
    <label for="InputTel" class="form-label">전화번호</label>
    <input type="text" class="form-control" id="tel" name="tel" placeholder ="000-0000-0000 형식으로 등록해주세요"  onchange = "validatTel()">
    <div id="telHelp" class="form-text"></div>
  </div>
  
  <div class="mb-3">
    <label for="InputEmail" class="form-label">이메일</label>
    <input type="text" class="form-control" id="email" name="email" onchange = "validateEmail()">
    <div></div>
  </div>
  
<div id="wrapper" > 
	<input type="submit"  value="직원등록" class="btn btn-primary">
	<input type="reset" value="다시 작성" class="btn btn-secondary">
	<a href="list.do"><input type="button" value="목록" class="btn btn-light"></a>
</div>

</form>
</div>

</body>
</html>