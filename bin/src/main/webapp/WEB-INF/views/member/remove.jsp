<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

    
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
    <!-- App -->
    <div id="app">

       

      <div class="container">
            <!-- Breadcrumbs -->
            <nav>
                <div class="nav-wrapper cyan">
                    <div class="col s12">
                        <a href="/" class="breadcrumb">홈</a>
                        <a href="/member/remove" class="breadcrumb">회원탈퇴</a>
                    </div>
                </div>
            </nav>
            <!-- end of Breadcrumbs -->


            <!-- Forms -->
            <div class="row">
                <h4 class="center-align">회원탈퇴</h4>
                <hr style="margin-bottom: 50px;">

                <form id="frm" class="col s12 l6 offset-l3" action="/member/remove" method="post">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">assignment_ind</i>
                            <input type="text" id="member_id" class="validate" name="id" value="${ memberVO.username }" disabled>
                            <label for="member_id">아이디</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">lock</i>
                            <input type="password" id="password" class="validate" name="password">
                            <label for="password">비밀번호</label>
                        </div>
                    </div>


                    <div class="row center-align">
                        <button type="submit" class="btn waves-effect waves-light">
                           회원탈퇴하기
                            <i class="material-icons right">directions_run</i>
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
       
       frm.addEventListener('submit', function (event) {
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






