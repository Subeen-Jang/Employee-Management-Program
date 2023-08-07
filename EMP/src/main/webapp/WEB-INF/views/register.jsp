<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>

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
<form name="empInsert" id="empInsert" action="register.do" method="post">
<table border ="1" width="550" cellspacing="0">
	<tr>
		<th>직원번호</th>
		<td><input type="text" name="idx"></td>
	</tr>
	
	<tr>
		<th>직급</th>
		<td><input type="text" name="rank"></td>
	</tr>
	
	<tr>
		<th>이름</th> 
		<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<th>전화번호</th> 
		<td><input type="text" name="tel" id="tel" placeholder ="000-0000-0000 형식으로 등록해주세요"  onchange = "validatTel()"></td>
	</tr>
	
	<tr>
		<th>이메일</th> 
		<td><input type="text" name="email" id="email" onchange = "validateEmail()"></td>
	</tr>
</table>

<div id="wrapper" > 
	<input type="submit"  value="직원등록" class="button">
	<input type="reset" value="다시 작성" class="button">
	<a href="list.do"><input type="button" value="목록" class="button"></a>
</div>

</form>

</body>
</html>