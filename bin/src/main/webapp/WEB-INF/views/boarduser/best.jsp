<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="../includes/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<style>
html {
  background: #f5f7f8;
  font-family: 'Roboto', sans-serif;
  -webkit-font-smoothing: antialiased;
  padding: 20px 0;
}

.band {
  width: 90%;
  max-width: 1240px;
  margin: 0 auto;
  text-align:center;
  
  display: grid;
  
  grid-template-columns: 1fr;
  grid-template-rows: auto;
  grid-gap: 20px;
  
}

@media only screen and (min-width: 500px) {
  .band {
    grid-template-columns: 1fr 1fr;
  }  
  .item-1 {
  grid-column: 1/ span 2;
  }
  .item-1 h1 {
    font-size: 30px;
  }
}

@media only screen and (min-width: 850px) {
  .band {
    grid-template-columns: 1fr 1fr 1fr 1fr;
  }
}

/* card */

.card {
  min-height: 100%;
  background: white;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  display: flex;
  flex-direction: column;
  text-decoration: none;
  color: #444;
  position: relative;
  top: 0;
  transition: all .1s ease-in;
}

.card:hover {
  top: -2px;
  box-shadow: 0 4px 5px rgba(0,0,0,0.2);
}

.card article {
  padding: 20px;
  display: flex;
  
  flex: 1;
  justify-content: space-between;
  flex-direction: column;
  
}
.card .thumb {
  padding-bottom: 0%;
  background-size: cover;
  background-position: center center;
}

.card p { 
  flex: 1; /* make p grow to fill available space*/
  line-height: 1.4;
}

/* typography */
h1 {
  font-size: 20px;
  margin: 0;
  color: #333;
}

.card span {
  font-size: 12px;
  font-weight: bold;
  color: #999;
  text-transform: uppercase;
  letter-spacing: .05em;
  margin: 2em 0 0 0;
}

</style>

</head>
<body>
<div>
  
</div>
<br/><br/><br/><br/>
<div class="support-grid"></div>

  <div class="band">
  <c:forEach var="bestuser" items="${b_lists}" varStatus="status" begin="0" end="0">
    <div class="item-1">
          <a href="/boarduser/detail/${bestuser.id }" class="card">
            <img class="thumb" src="${bestuser.uploadpath}" width="512" height="300"  />
            <article>
              <h1>제목 : ${bestuser.title }</h1>
              <span>조회수 : ${bestuser.hitCnt }<br/>
              추천수 : ${bestuser.likeCnt }</span>
            </article>
          </a>
    </div>
</c:forEach>
<c:forEach var="bestuser" items="${b_lists}" varStatus="status" begin="1" end="1">
    <div class="item-2">
          <a href="/boarduser/detail/${bestuser.id }" class="card">
            <img class="thumb" src="${bestuser.uploadpath}" width="250" height="300" />
            <article>
              <h1>제목 : ${ bestuser.title }</h1>
              <span>조회수 : ${ bestuser.hitCnt }<br/>
              추천수 : ${ bestuser.likeCnt }</span>
            </article>
          </a>
    </div>
</c:forEach> 
<c:forEach var="bestuser" items="${b_lists}" varStatus="status" begin="2" end="2">
    <div class="item-3">
          <a href="/boarduser/detail/${bestuser.id }" class="card">
            <img class="thumb" src="${bestuser.uploadpath}" width="250" height="300" />
            <article>
              <h1>제목 : ${ bestuser.title }</h1>
              <span>조회수 : ${ bestuser.hitCnt }<br/>
              추천수 : ${ bestuser.likeCnt }</span>
            </article>
          </a>
    </div>
</c:forEach>    
  </div>

</body>
</html>