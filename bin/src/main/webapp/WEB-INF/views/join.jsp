<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>

    
<!DOCTYPE html>


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


table {
  border-collapse: separate;
  border-spacing: 0 30px;
}

</style>



  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  


  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>

  <script>
  // Acc
    $(document).on("click", ".naccs .menu div", function() {
      var numberIndex = $(this).index();

      if (!$(this).is("active")) {
          $(".naccs .menu div").removeClass("active");
          $(".naccs ul li").removeClass("active");

          $(this).addClass("active");
          $(".naccs ul").find("li:eq(" + numberIndex + ")").addClass("active");

          var listItemHeight = $(".naccs ul")
            .find("li:eq(" + numberIndex + ")")
            .innerHeight();
          $(".naccs ul").height(listItemHeight + "px");
        }
    });
  </script>
  
<center><br/><br/><br/><br/><br/><br/>
<div id="login">
<form action="join" method="post">
<table>


<tr>
<td>Name :  </td>
<td><input type="text" name="username"><br/></td>
</tr>

<tr>
<td>Password : </td>
<td><input type="password" name="password"><br/></td>
</tr>

<tr>
<td>email : </td>
<td><input type="email" name="email"><br/></td>
</tr>

<tr>
<td>addr : </td>
<td><input type="text" name="addr"><br/></td>
</tr>

</table>

<button>회원가입</button>
</form>
</div>
</center>






<div class="footer-dec">
    <img src="assets/images/footer-dec.png" alt="">
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <div class="about footer-item">
            <div class="logo">
              <a href="#"><img src="assets/images/banner20.png" alt="Onix Digital TemplateMo"></a>
            </div>
            <a href="#">soulno@naver.com</a>
            <ul>
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#"><i class="fa fa-behance"></i></a></li>
              <li><a href="#"><i class="fa fa-instagram"></i></a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="services footer-item">
            <h4>서비스</h4>
            <ul>
              <li><a href="#">개발</a></li>
              <li><a href="#">성장</a></li>
              <li><a href="#">소셜 미디어 관리</a></li>
              <li><a href="#">웹 사이트 최적화</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="community footer-item">
            <h4>이용 약관</h4>
            <ul>
              <li><a href="#">사용방법</a></li>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">Q & A</a></li>
              <li><a href="#">소개</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="subscribe-newsletters footer-item">
            <h4>구독</h4>
            <p>자신의 아이디어를 메일로 보내주세요.</p>
            <form action="#" method="get">
              <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="이메일을 입력하세요." required="">
              <button type="submit" id="form-submit" class="main-button "><i class="fa fa-paper-plane-o"></i></button>
            </form>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="copyright">
            <p>2021 walk-Project. 
            <br>
            <a rel="nofollow" href="https://templatemo.com" title="free CSS templates"></a>Thanks you<br>
            
          </p>
          </div>
        </div>

      </div>
    </div>
  </footer>
</body>
</html>