<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	margin-left:auto;
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
<h1 align="center">직원 리스트</h1>
<div>
<form name="empSearch" id="empSearch" action="empSearch.do" method="post">
<div class="input-group mb-3">
	<select name="category" id="category" >
		<option value="idx" selected>직원번호</option>
		<option value="rank">직급</option>
		<option value="name">이름</option>
		<option value="tel">전화번호</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" name="keyword" id="keyword" placeholder = "검색어를 입력하세요">
	<input type="submit" value="검색" class="btn btn-outline-secondary">
</div>
</form>
</div>


<table  border ="1" width="550" cellspacing="0" class="table table-striped">
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
			   <td>
                <a href="#"  data-bs-toggle="dropdown" aria-expanded="false" data-bs-target="maillist">
                            ${list.email}
                </a>
                        <div class="dropdown-menu" id="list">
                        	<div class="layer_common layer_user_profile" style="top: 397.667px; left: 413px;">
							<strong class="user_name">
								<span>${list.name}</strong></span><div class="email_wrap">
								<span class="email">${list.email}</span>
							</div>
                        	 <hr class="dropdown-divider">
                        	 <c:url var="goMail" value="mail.do">
							<c:param name="email">${list.email}</c:param>
							</c:url>
                            <li><a href="${goMail}">메일 쓰기</a></li>
                        </div>
            </td>
			
		</tr>
	</c:forEach>
</tbody>
</table>


<div id="wrapper">
<a href="downCsv.do"><input type="button" value="csv파일 다운" class="btn btn-primary"></a>
<a href="downExcel.do"><input type="button" value="엑셀파일 다운" class="btn btn-primary"></a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

</body>
</html>


