<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style>

.container {
     width: 1200px;
 }

 h1, h2, h3, h4, h5, h6 {
     margin-top: 0;
     margin-bottom: 0;
 }

            ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            table {
                border:0;
                padding:0;
                margin:0;

            }

 
            table caption { 
                display:none; 
            }

             a {
                display: inline-block;
                text-decoration: none;
                vertical-align: middle;
            }

            textarea, .inp, a:link, a:visited, a:hover, a:active {
                color: #555555;
            }
            
            .bbsList { 
                display: table;
                clear:both; 
                width:1400px; 
                border-collapse: collapse; 
              }
            
            .bbsList th { 
                border-color:#333333; 
                background: #fcfcfc;
                padding:10px 0 10px 0; 
                text-align:center; 
                border-top-width: 2px;
                border-bottom-width: 1px;
                border-top-style: solid;
                border-bottom-style: solid;

                font-weight: 400;
             }

            .bbsList .checkbox {
                  -ms-transform: scale(1.5); /* IE */
                 -moz-transform: scale(1.5); /* FF */
                -webkit-transform: scale(1.5); /* Safari and Chrome */
                 -o-transform: scale(1.5); /* Opera */

                -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
                box-shadow:inset 0px 1px 0px 0px #ffffff;
                background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fff), color-stop(1, #fff) );
                background:-moz-linear-gradient( center top, #fff 5%, #fff 100% );
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff', endColorstr='#fff');
                background-color:#fff;
             
                text-indent:0;
                border:1px solid #dcdcdc;
                display:inline-block;
                color:#000000;
               
                font-size:10px;
                width:10px;
                height:10px;
                line-height:12px;

                text-decoration:none;
                text-align:center;
                text-shadow:1px 1px 0px #ffffff;
            }

            .bbsList .checkbox_checked {
                -ms-transform: scale(1.5);
                -moz-transform: scale(1.5);
                -webkit-transform: scale(1.5);
                -o-transform: scale(1.5);
                -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
                box-shadow: inset 0px 1px 0px 0px #ffffff;
                background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fff), color-stop(1, #fff) );
                background: -moz-linear-gradient( center top, #fff 5%, #fff 100% );
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff', endColorstr='#fff');
                background-color: #fff;
 
                text-indent: 0;
                border: 1px solid #ffaa89;
                display: inline-block;
                color: #ea4d10;
                font-size: 10px;
                width: 10px;
                height: 10px;
                line-height: 10px;
                text-decoration: none;
                text-align: center;
                text-shadow: 1px 1px 0px #ffffff;
            }


            .bbsList .body td {
                text-align: center;
                padding:5px 9px 5px 9px; 
                border-bottom-color: #eeeeee;
                border-bottom-width: 1px;
                border-bottom-style: solid;
            }
            
            /*  */
            
            .bbsList .foot td{
                height: 60px;
                line-height: 60px;

                text-align: center;

                border-bottom-color: #eeeeee;
                border-bottom-width: 1px;
                border-bottom-style: solid;

                padding-bottom: 20px;
            }


            .foot .arrow {
                -ms-transform: scale(1.5); /* IE */
                -moz-transform: scale(1.5); /* FF */
                -webkit-transform: scale(1.5); /* Safari and Chrome */
                -o-transform: scale(1.5); /* Opera */

                -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
                box-shadow:inset 0px 1px 0px 0px #ffffff;
                background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fff), color-stop(1, #fff) );
                background:-moz-linear-gradient( center top, #fff 5%, #fff 100% );
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff', endColorstr='#fff');
                background-color:#fff;
                -webkit-border-top-left-radius: 3px;
                -moz-border-radius-topleft: 3px;
                border-top-left-radius: 3px;
                -webkit-border-top-right-radius: 3px;
                -moz-border-radius-topright: 3px;
                border-top-right-radius: 3px;
                -webkit-border-bottom-right-radius: 3px;
                -moz-border-radius-bottomright: 3px;
                border-bottom-right-radius: 3px;
                -webkit-border-bottom-left-radius: 3px;
                -moz-border-radius-bottomleft: 3px;
                border-bottom-left-radius: 3px;
                text-indent:0;
                border:1px solid #d4d4d4;
                display:inline-block;
                color:#d4d4d4;
               
                font-size:10px;
                width:16px;
                height:16px;
                line-height:16px;

                text-decoration:none;
                text-align:center;
                text-shadow:1px 1px 0px #ffffff;
            }

            .foot .radius-right {  
                -webkit-border-top-right-radius: 1px;
                -moz-border-radius-topright: 1px;
                border-top-right-radius: 1px;

                -webkit-border-bottom-right-radius: 1px;
                -moz-border-radius-bottomright: 1px;
                border-bottom-right-radius: 1px;

                margin-left: 10px;
             }

            .foot .radius-left {
                -webkit-border-top-left-radius: 1px;
                -moz-border-radius-topleft: 1px;
                border-top-left-radius: 1px;

                -webkit-border-bottom-left-radius: 1px;
                -moz-border-radius-bottomleft: 1px;
                border-bottom-left-radius: 1px;

                margin-right: 10px;
             }
            
            .num_box {
                margin:  0 5px 0 5px;
                border-width: 0px;
                font-weight: bold;
             }
            .txt_point {
                 -ms-transform: scale(1.5); /* IE */
                -moz-transform: scale(1.5); /* FF */
                -webkit-transform: scale(1.5); /* Safari and Chrome */
                -o-transform: scale(1.5); /* Opera */

                -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
                box-shadow:inset 0px 1px 0px 0px #ffffff;
                background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fff), color-stop(1, #fff) );
                background:-moz-linear-gradient( center top, #fff 5%, #fff 100% );
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff', endColorstr='#fff');
                background-color:#fff;
                -webkit-border-top-left-radius: 3px;
                -moz-border-radius-topleft: 3px;
                border-top-left-radius: 3px;
                -webkit-border-top-right-radius: 3px;
                -moz-border-radius-topright: 3px;
                border-top-right-radius: 3px;
                -webkit-border-bottom-right-radius: 3px;
                -moz-border-radius-bottomright: 3px;
                border-bottom-right-radius: 3px;
                -webkit-border-bottom-left-radius: 3px;
                -moz-border-radius-bottomleft: 3px;
                border-bottom-left-radius: 3px;
                text-indent:0;
                border:1px solid #ffaa89;
                display:inline-block;
                color:#ea4d10;
               
                font-size:10px;
                width:16px;
                height:16px;
                line-height:16px;

                text-decoration:none;
                text-align:center;
                text-shadow:1px 1px 0px #ffffff;
             }
            
            .txt_point, .txt_point a:link, .txt_point a:visited, .txt_point a:active, a.txt_point:link,
              a.txt_point:visited, a.txt_point:hover, a.txt_point:active {
                color: #fa7102;
            }

</style>

</head>
<body>

<br/>
<table class="bbsList" >
                <thead class="head">
                    <tr>
                        <th><a class="checkbox" href="" ></a></th> 
                        <th>번호</th>
                        <th>제목</th>   
                        <th>이메일</th>
                        <th>주소</th>
                        <th>가입일</th>
                        
                    </tr>    
                </thead>
                <tbody class="body">
                <c:forEach items="${ lists }" var="membervo"><br/>
                    <tr>
                        <td class=""><a class="checkbox_checked" href="javascript:;" >✓</a></td>
                        <td class=""><a href="/member/detail/${membervo.id }">${ membervo.id } </a></td>
                        <td class="">${ membervo.username }</td>
                        <td class="">${ membervo.email }</td>
                        <td class="">${ membervo.addr }</td>
                        <td class=""><fmt:formatDate value="${ membervo.regdate }" pattern="yyyy-MM-dd"/></td>
                        
                    </tr>
                    </c:forEach>
                    
                </tbody>

</table>
</body>
</html>