<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>



<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>


<style>
input {
	border-radius: 20px;
}

button {
	width: 200px;
	color: white;
	font-size: 15px;
	background-color: #4CAF50;
	border-radius: 20px;
	margin-bottom: 10%;
}
</style>


</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- App -->
	<div id="app">



		<div class="container">
			<!-- Breadcrumbs -->
			<nav>
				<div class="nav-wrapper cyan">
					<div class="col s12"></div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->
			<div align="center">
				<span style="font: italic bold 1.5em/1em Georgia, serif;"> 회원탈퇴 </span>
			</div>
			<br>
			<hr>
			<!-- Forms -->
			<div align="center">
				

				<form id="frm" class="col s12 l6 offset-l3" action="/member/remove" method="post">
					<div class="text1">
						<div class="input-field col s12">
						<label for="member_id">아이디 : </label>
							<input type="text" id="member_id" class="validate" name="id" value="${ memberVO.username }" disabled>
						</div>
					</div>
					<div class="row">
						<div class="text1">
						<br>
							 <label for="password">비밀번호 : </label>
							 <input type="password" id="password" class="validate" name="password">
						</div>
					</div>

					<br>
					<div class="btn1">
						<button type="submit" width:100px;>
							회원 탈퇴
						</button>
					</div>

				</form>
			</div>
			<!-- end of Forms -->

		</div>
		<!-- end of Container -->




	</div>
	<!-- end of App -->



	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});
	</script>
	<script>
		var frm = document.querySelector('#frm');

		frm.addEventListener('submit', function(event) {
			// 기본동작이 있는 대표적인 태그 2개 : a태그, form태그
			event.preventDefault(); // 기본동작 막기

			var isRemove = confirm('정말 회원탈퇴 하시겠습니까?');

			if (!isRemove) {
				return;
			}

			frm.submit();
		});
	</script>
</body>

</html>






