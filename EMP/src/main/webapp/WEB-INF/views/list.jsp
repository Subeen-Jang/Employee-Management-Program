<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h1 align="center">직원 리스트</h1>
<div>
<form name="empSearch" id="empSearch" action="empSearch.do" method="post">
<div id="wrapper">
	<select name="category" id="category">
		<option value="idx" selected>직원번호</option>
		<option value="rank">직급</option>
		<option value="name">이름</option>
		<option value="tel">전화번호</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" name="keyword" id="keyword" placeholder = "검색어를 입력하세요">
	<input type="submit" value="검색">
</div>
</form>
</div>
<table  border ="1" width="550" cellspacing="0">
<thead>
	<tr>
		<th>직원번호</th>
		<th>직급</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5" align="center">
			등록된 직원이 없습니다
			</td>
		</tr>
	</c:if>
	<c:forEach var="list" items="${list}">
	
		<tr>
			<td><fmt:formatNumber value="${list.idx}" pattern="000"></fmt:formatNumber></td>
			<td>${list.rank}</td>
			<c:url var="infoUrl" value="empInfo.do">
					<c:param name="idx">${list.idx}</c:param>
			</c:url>
				<td><a href="${infoUrl}">${list.name}</td></a>
			<td>${list.tel}</td>
			<td>${list.email}</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<div id="wrapper">
<a href="downCsv.do"><input type="button" value="csv파일 다운"></a>
<a href="downExcel.do"><input type="button" value="엑셀파일 다운"></a>
</div>
</body>
</html>