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
h1{
	margin-bottom:20px;
}
table{
	margin-left:auto;t
	margin-right:auto;
}

body{
	font-family: 'GmarketSansMedium';
	align: center;
	margin: 50px;
}

#wrapper{
        width:300px;
        margin:auto;
}
</style>
<body>
<h1>메일</h1>
<div class="d-flex justify-content-center align-items-center">

<form name="mailForm" id="mailSend" action="mailSend.do" method="post">
<div class="mb-3">
  <label for="emailAddress" class="form-label">받는사람</label>
  <input type="text" class="form-control" name="address" id="address" value="${email}">
</div>

<div class="mb-3">
  <label for="ccAddress" class="form-label">참조</label>
  <input type="text" class="form-control" name="ccAdress" id="ccAdress">
</div>

<div class="mb-3">
  <label for="emailTitle" class="form-label">제목</label>
  <input type="text" class="form-control" name="title" id="title">
</div>

<div class="mb-3">
  <label for="emailContent" class="form-label">내용</label>
  <textarea class="form-control" name="content" id="content" rows="5"></textarea>
</div>

  
<div id="wrapper" > 
	<input type="submit"  value="보내기" class="btn btn-primary">
</div>

</form>
</div>

</body>
</html>