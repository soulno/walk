<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
   rel="stylesheet">
<link rel="shortcut icon" href="/assets/images/walk.ico" type="image/x-icon">
<title>산책</title>

<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-onix-digital.css">
<link rel="stylesheet" href="/assets/css/animated.css">
<link rel="stylesheet" href="/assets/css/owl.css">

<style>
.container100 {
   margin-top: 100px;
   margin-bottom: 10%;
}
</style>


<!--
TemplateMo 565 Onix Digital
https://templatemo.com/tm-565-onix-digital
-->
</head>

<body>

   

   <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky wow slideInDown"
      data-wow-duration="0.75s" data-wow-delay="0s">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <nav class="main-nav">
                  <!-- ***** Logo Start ***** -->
                  <a href="/" class="logo"> <img
                     src="/assets/images/walk_photo_logo_small.png">
                  </a>
                  <!-- ***** Logo End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">

                  
                     <c:choose>
                        <c:when test="${ memberVO.auth eq 2 }">
                           <br />
                     <li class="scroll-to-section">
                     <a href="/" class="active">Home</a></li>
                           <li class="scroll-to-section"><a href="/member/logout">Logout</a></li>
                           <li class="scroll-to-section"><a href="/boardadmin/list">추천 산책로</a></li>
                           <li class="scroll-to-section"><a href="/boarduser/list">게시판</a></li>
                           <li class="scroll-to-section"><a href="/boarduser/best">Best 인기글</a></li>
                           <li class="scroll-to-section"><a href="/member/list">회원목록</a></li>

                        </c:when>
                        <c:when test="${ memberVO.auth eq 3 }">
                            <li class="scroll-to-section"><a href="/member/logout">Logout</a></li>
                           <li class="scroll-to-section"><a href="/boardadmin/list">추천 산책로</a></li>
                           <li class="scroll-to-section"><a href="/boarduser/list">게시판</a></li>
                           <li class="scroll-to-section"><a href="/boarduser/best">Best 인기글</a></li>
                           <li class="scroll-to-section"><a href="/member/detail/${memberVO.id}">내정보 보기</a></li>
                        </c:when>
                        <c:otherwise>
                           <li class="scroll-to-section"><a href="/join">회원가입</a></li>
                           <li class="scroll-to-section"><a href="/login">Login</a></li>
                           <li class="scroll-to-section"><a href="/boardadmin/list">추천 산책로</a></li>
                           <li class="scroll-to-section"><a href="/boarduser/list">게시판</a></li>
                           <li class="scroll-to-section"><a href="/boarduser/best">Best 인기글</a></li>
                        </c:otherwise>
                     </c:choose>
                     <li></li>
                     
                     <!-- ***** Menu End ***** -->

               </nav>
            </div>
         </div>
      </div>
   </header>
   <!-- ***** Header Area End ***** -->

</body>