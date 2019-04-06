<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <body>    
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="main">CORE</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
<!-- 	      <li class="nav-item active">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li> -->
	      <li class="nav-item">
	        <a class="nav-link" href="board_list">공지사항</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="gameManage_list">게임관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="scoreStats_list">점수관리</a>
	      </li>
<!-- 	      <li class="nav-item">
	        <a class="nav-link" href="#">회원리스트</a>
	      </li> -->
	    </ul>
		  <c:if test="${empty id}">
		    <form class="form-inline my-2 my-lg-0" method="post" action="member_login_ok" onsubmit="return login_check();">
			    <input class="form-control mr-sm-2" name="login_id" id="login_id" tabindex="1" placeholder="ID" required autofocus />
				<input class="form-control mr-sm-2" type="password" name="login_pwd" id="login_pwd" tabindex="2" id="inputPassword" placeholder="Password" required />&nbsp;
				<input class="btn btn-secondary my-2 my-sm-0" type="submit" value="로그인" />&nbsp;
				<input class="btn btn-secondary my-2 my-sm-0" type="button" value="비번찾기" onclick="pwd_find();" />&nbsp;
				<input class="btn btn-secondary my-2 my-sm-0" type="button" value="회원가입" onclick="location='member_join';" />
			</form>
		  </c:if>
		  <c:if test="${!empty id}"><!-- 로그인 이후 화면 -->
		    <form class="form-inline my-2 my-lg-0" method="post" action="member_logout">
		      <input class="btn btn-secondary my-2 my-sm-0"" type="button" value="${id}회원님 정보수정" onclick="location='member_del';" />&nbsp;
			  <input class="btn btn-secondary my-2 my-sm-0"" type="button" value="회원탈퇴" onclick="location='member_del';" />&nbsp;
			  <input class="btn btn-secondary my-2 my-sm-0"" type="submit" value="로그아웃" />
			</form>
		  </c:if>
	  </div>
	</nav>
    
  </body>
</html>
