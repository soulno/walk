<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<title>작성 글 수정 화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
body {
	margin-top: 0px
}
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}
input {
	border-radius:10px;
	width:500px;
}
button {
	border-radius:20px;
	width:80px;
	height:30px;
}
</style>

</head>
<body>
<br><br><br><br>
<form action="/boarduser/update" method="post"> 
      
      
      <!--  -->
      <div class="container">
		
			<input type="hidden" id="username" name="username" value="${memberVO.username }"> <br />
			<input type="hidden" id="id" name="id" value="${boarduser.id }"> <br />
			
			<table class="table table-bordered">
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%">
				</colgroup>
				<tr>
					<th>게시글 번호</th>

					<td><input type="text"
           id="bnum" name="bnum" value="${boarduser.bnum}"
            readonly="readonly"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text"
           id="writer" name="writer" value="${boarduser.writer}"
            readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text"
           id="title" name="title" value="${boarduser.title}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text"
           id="content" name="content" value="${boarduser.content}"></td>
				</tr>

				<tr>
					<th>첨부파일</th>
					<td>
				 <a href="${boarduser.uploadpath}">${boarduser.uploadpath}</a>
					</td>
				</tr>

				<tr>
					<th>등록일</th>
					<td><input type="text"
           id="regDate" name="regDate" value="${boarduser.regDate}"
            readonly="readonly"></td>
				</tr>

			</table>
			<div class="ln_solid"></div>



	</div>
	<div align="center">
	<button type="submit" id="btnUpdate" >수정완료</button>
	</div>
		</form>
	
      
      
</body>
</html>