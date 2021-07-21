<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>


<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>유저 정보 보기</title>
</head>
<body>
	<div class="container">
		<br />
		<h2>회원 정보</h2>
		<br />
		<div>
			회원 등록번호: <input type="text" id="id" name="id" value="${member.id}"
				readonly="readonly">
		</div>
		<div>
			유저명 : <input type="text"
				 id="username" name="username"
				value="${member.username}" readonly="readonly">
		</div>
		<div>
			가입일: <input type="text"
				id="regdate" name="regdate"
				value="${member.regdate}" readonly="readonly">
		</div>
		<div>
			이메일: <input type="text"
				 id="email" name="email"
				value="${member.email}" readonly="readonly">
		</div>
		<div>
			주소:<input type="text"
				 id="addr" name="addr"
				value="${member.addr}" readonly="readonly">
		</div>

		<button type="button" id="btnUpdate" >수정</button>
		<button type="button" id="btnDelete" >탈퇴</button>

	</div>
	<br />
	<br />
<c:choose>
    <c:when test="${ member.auth eq 3 }"><br/>    
		<input type="button" value="매니저 권한 부여"  id="giveAuth" name="giveAuth">
	</c:when>
	<c:when test="${ member.auth eq 2 }"><br/>    
		<input type="button" value="매니저 권한 회수" id="removeAuth" name="removeAuth">
	</c:when>
</c:choose>	
<script>
$("#giveAuth").click(function(){
	data = {
			"id" : $("#id").val(),
	}
	$.ajax({
		type:"POST",
		url:"/member/giveAuth/"+${member.id},
 		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
 	})
	.done(function(){
		alert("관리자 권한을 부여했습니다.");
		location.href = "/member/detail/"+${member.id};
	})
	.fail(function(){
		alert("잘못된 작업입니다.");
	})
})
$("#removeAuth").click(function(){
	data = {
			"id" : $("#id").val(),
	}
	$.ajax({
		type:"POST",
		url:"/member/giveAuth/"+${member.id},
 		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
 	})
	.done(function(){
		alert("관리자 권한을 회수했습니다.");
		location.href = "/member/detail/"+${member.id};
	})
	.fail(function(){
		alert("잘못된 작업입니다.");
	})
})
</script>
</body>
</html>