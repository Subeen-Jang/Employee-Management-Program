<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
<h3 align="center">직원 정보</h3>
<form name="empUpdate" id="empUpdate" action="update.do" method="post">
<table>
	<tr>
		<th>직원번호</th>
		<td><input type="text" name="idx" value="${dto.idx}"></td>
	</tr>
	
	<tr>
		<th>직급</th>
		<td><input type="text" name="rank" value="${dto.rank}"></td>
	</tr>
	
	<tr>
		<th>이름</th> 
		<td><input type="text" name="name" value="${dto.name}"></td>
	</tr>
	
	<tr>
		<th>전화번호</th> 
		<td><input type="text" name="tel" value="${dto.tel}"></td>
	</tr>
	
	<tr>
		<th>이메일</th> 
		<td><input type="text" name="email" value="${dto.email}"></td>
	</tr>
</table>
<div id="wrapper">
	<input type="submit" value="직원 정보 수정">
	<c:url var="deleteUrl" value="delete.do">
		<c:param name="idx">${dto.idx}</c:param>
	</c:url>
	<a href="${deleteUrl}"><input type="button" value="삭제"></a>
	<a href="list.do"><input type="button" value="목록"></a>
</div>

</body>
</html>