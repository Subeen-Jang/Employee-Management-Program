<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

h3{
	magin-bottom: 20px;
}

#wrapper{
        width:300px;
        margin:auto;
}
</style>
<body>
<h3 align="center">직원 정보</h3>

<div class="d-flex justify-content-center align-items-center">
<form name="empUpdate" id="empUpdate" action="update.do" method="post">

  <div class="mb-3">
    <label for="InputIdx" class="form-label">직원번호</label>
    <input type="text" class="form-control" id="idx" name="idx" value="${dto.idx}">
  </div>
  
  <div class="mb-3">
    <label for="InputRank" class="form-label">직급</label>
    <input type="text" class="form-control" id="rank" name="rank" value="${dto.rank}">
    <div></div>
  </div>
  
  <div class="mb-3">
    <label for="InputRank" class="form-label">이름</label>
    <input type="text" class="form-control" id="name" name="name" value="${dto.name}">
    <div></div>
  </div>
  
  <div class="mb-3">
    <label for="InputTel" class="form-label">전화번호</label>
    <input type="text" class="form-control" id="tel" name="tel" placeholder ="000-0000-0000 형식으로 등록해주세요"  value="${dto.tel}" onchange = "validatTel()">
  </div>
  
  <div class="mb-3">
    <label for="InputEmail" class="form-label">이메일</label>
    <input type="text" class="form-control" id="email" name="email" value="${dto.email}" onchange = "validateEmail()">
    <div></div>
  </div>
 
<div id="wrapper">
	<input type="submit" value="직원 정보 수정" class="btn btn-primary">
	<c:url var="deleteUrl" value="delete.do">
		<c:param name="idx">${dto.idx}</c:param>
	</c:url>
	<a href="${deleteUrl}"><input type="button" value="삭제" class="btn btn-secondary"></a>
	<a href="list.do"><input type="button" value="목록" class="btn btn-light"></a>
</div>

</form>
</div>

</body>
</html>