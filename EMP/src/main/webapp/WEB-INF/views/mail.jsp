<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<form name="mailForm" id="mailSend" action="mailSend.do" method="post" enctype="multipart/form-data">
<div class="mb-3">
  <label for="emailAddress" class="form-label">받는사람</label>
  <input type="text" class="form-control" name="address" id="address" value="${email}">
</div>

<div id="container">
<div class="mb-3">
  <label for="ccAddress" class="form-label">참조</label>
  <input type="text" class="form-control" name="ccAdress" id="ccAdress">
  <input type="button" value="추가" class="addCC">
</div>
</div>

<div class="mb-3">
  <label for="emailTitle" class="form-label">제목</label>
  <input type="text" class="form-control" name="title" id="title">
</div>

<div class="mb-3">
  <label for="emailContent" class="form-label">내용</label>
  <textarea class="form-control" name="content" id="content" rows="5"></textarea>
</div>
<div class="mb-3">
  <label for="attachment" class="form-label">첨부파일</label>
  <input type="file" class="file-input" name="file" >
</div>

  
<div id="wrapper" > 
	<input type="submit"  value="보내기" class="btn btn-primary">
</div>

</form>
</div>

<script>

$(document).ready(function() {
    $("#container").on("click", ".addCC", function() {
        var newHTML = `
            <div class="mb-3">
                <label for="ccAddress" class="form-label">참조</label>
                <input type="text" class="form-control" name="ccAdress">
                <input type="button" value="추가" class="addCC">
                <input type="button" value="삭제" class="rmCC">
            </div>
        `;
        $(this).parent().parent().append(newHTML);
    });
    
    $("#container").on("click", ".rmCC", function() {
        $(this).parent().remove();
    });
});
</script>

</body>
</html>