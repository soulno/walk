<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">



<style>
body{
margin-top: 300px;


}

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
h2{
font-family: poppins;
color: #ff695f;
}
</style>



</head>

<body>

	<center>
		<div id="input-wrap">
			<h2>로그인</h2>
			<form action="login" method="post">
				<table>
		<br/>
					<tr>
						<td><h3>Name :</h3></td>
						<td><input type="text" name="username"></td>
					</tr>
	
					<tr>
						<td><h3>Password :</h3></td>
						<td><input type="password" name="password"></td>
					</tr>


				</table>
				<br>
				<div id="bt">
					<button>로그인</button>
				</div>
			</form>
		</div>

	</center>
	
	<div class="footer-dec">
		<img src="assets/images/footer-dec.png" alt="">
	</div>
</body>
</html>