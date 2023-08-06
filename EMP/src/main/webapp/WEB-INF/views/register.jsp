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
		<td><input type="text" name="tel" placeholder ="000-0000-0000 형식으로 등록해주세요"  onchange = "validatTel()"></td>
	</tr>
	
	<tr>
		<th>이메일</th> 
		<td><input type="text" name="email" onchange = "validateEmail()"></td>
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