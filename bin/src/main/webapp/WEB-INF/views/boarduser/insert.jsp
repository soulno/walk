<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
</head>
<body>
	<h2 style="text-align: center;">글 작성</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		<form method="post" action="/boarduser/insert" enctype="multipart/form-data">
			<input type="text" name="writer" style="width: 20%;" value="${ memberVO.username }" readonly="readonly"/><br> 
			<input type="text" name="title" style="width: 40%;" placeholder="제목" />
			<input type="hidden" name="membervo_id"  value="${memberVO.id}" />

			<!-- 파일 업로드 시작 -->
			
			<br><br>
			<div class="row" id="fileContainer">
				<div class="file-field input-field col s12">
					<div class="btn">
						<span><i class="material-icons left"></i></span> 
						<input type="file" name="files" multiple required="required">
					</div>
					<div class="file-path-wrapper">
						<br>
					</div>
					<span class="helper-text">첨부파일 업로드 가능한 용량은 최대 50MB 입니다.</span>
				</div>
			</div>

			<!--  파일 업로드 끝 -->

			<br>
			<br>
			<textarea id="summernote" name="content"></textarea>
			<button type="submit" style="float: right;">글 쓰기 완료</button>
		</form>
	</div>

</body>
</html>