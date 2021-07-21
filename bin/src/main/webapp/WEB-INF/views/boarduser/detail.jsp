<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>



<!DOCTYPE html>
<html>
<title>게시글 상세 보기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<style>
body {
   margin-top: 0px
}

* {
   margin: 0px;
   padding: 0px;
   box-sizing: border-box;
}
</style>
</head>
<!--  -->
<body>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <div class="container">
		<form>
			<br />
			<h2>게시글 상세보기</h2>
			<input type="hidden" id="username" name="username"
				value="${memberVO.username }"> <br />
			<table class="table table-bordered">
            <colgroup>
               <col style="width: 20%;">
               <col style="width: 80%">
            </colgroup>	

			           <tr>
               <th>게시글 번호</th>

               <td id="id" name="id" readonly="readonly">${boarduser.bnum}</td>
            </tr>
            <tr>
			               <th>제목</th>
               <td id="title" name="title" readonly="readonly">${boarduser.title}</td>
            </tr>
            <tr>
               <th>작성자</th>
               <td id="writer" name="writer" readonly="readonly">${boarduser.writer}</td>
            </tr>
            <tr>
              <th>내용</th>
               <td id="email" name="email" readonly="readonly">${boarduser.content}</td>
            </tr>
            <tr>
              <th>첨부파일</th>
               <td>
                  <a href="${boarduser.uploadpath}"><img src="${boarduser.uploadpath}"/></a>
               </td>
            </tr>
                        <tr>
               <th>등록일</th>
               <td id="regDate" name="regDate" readonly="readonly">${boarduser.regDate}</td>
            </tr>

         </table>
         <div class="ln_solid"></div>
         
         <c:choose>
            <c:when test="${ not empty memberVO }">
               <p>추천수 :${ bl.cntlike }</p>
               <input type="button" value="좋아요" id="likeit" name="likeit" class="btn btn-danger  btn-sm">
               <a href="/boarduser/update/${boarduser.id}" class="btn btn-danger  btn-sm">수정하기</a>
               <button type="button" id="btnDelete" class="btn btn-danger  btn-sm">삭제</button>
            </c:when>
         </c:choose>
		</form><br /><hr />
	<br />
<div>
	<textarea rows="3" cols="50" id="msg"></textarea>
	<input type="button" value="댓글쓰기" id="btnComment">
</div>
<div id="replyResult"></div></div>
<script>
var init = function() {
	$.ajax({
		type : "get",
		url : "/reply/commentList",
		data : {
			"boarduservo_id" : ${boarduser.id}
		}
	}).done(
			function(resp) {				
				var str ="";
				$.each(resp, function(key, val){
					str += "작성자: " + val.username
					str += "내용: " + val.content
					str += "작성일: " + val.regdate
					str +=" <a href='javascript:fdel(" + val.id + ")'>삭제</a><br>"
					
				})		
				$("#replyResult").html(str);
	}).fail(function(e) {
		alret("실패")
	})
}
// 댓글쓰기
$("#btnComment").click(function() {
	if ($("#msg").val() == "") {
		alert("댓글을 입력하세요!");
		return;
	}
	data = {
		"username" : $("#username").val(),
		"boarduservo_id" : ${boarduser.id},
		"content" : $("#msg").val()
	}
	$.ajax({
		type : "post",
		url : "/reply/commentInsert",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	}).done(function() {
		alert("댓글 작성 성공")
		init()
	}).fail(function() {
		alert("댓글 작성 실패")
	})
})

// 게시판 글 수정
$("#btnUpdate").click(function() {
	if (!confirm('정말 수정할까요?'))
		return false;
	location.href = "/boarduser/update/${boarduser.id}"
})

// 게시판 글 삭제
$("#btnDelete").click(function() {
	if (!confirm('정말 삭제할까요?'))
		return false;
	$.ajax({
		type : "delete",
		url : "/boarduser/delete/"+${boarduser.id},
		success : function(resp) {
			if (resp == "success") {
				alert("삭제성공");
				location.href = "/boarduser/list";
			}//if
		}//success
	})//ajax
}) //btnDelete

/* 댓글 삭제  */
function fdel(id) {
	//alert(id)
	$.ajax({
		type : "DELETE",
		url : "/reply/delete/" + id
	}).done(function(resp) {
		alert("댓글이 삭제되었습니다.")
		init()
	}).fail(function(e) {
		alert("댓글 삭제 실패")
	})
} // fdel
init();

$("#likeit").click(function(){
	data = {
			"b_id" : ${boarduser.id},
			"m_id" : $("#username").val()
	}
	$.ajax({
		type:"POST",
		url:"/boarduser/like/"+$("#id").val(),
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(){
		alert("'좋아요'가 성공적으로 반영되었습니다.");
		location.href = "/boarduser/detail/"+${boarduser.id};
	})
	.fail(function(){
	})
})
</script>
</body>
</html>