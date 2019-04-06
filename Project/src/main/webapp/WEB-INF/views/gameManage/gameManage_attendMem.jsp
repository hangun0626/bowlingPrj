<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<meta charset="UTF-8">
<title>게임관리</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.css">
    
</head>
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
	        <a class="nav-link" href="gameManage_list">공지사항</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">점수관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">회원리스트</a>
	      </li>
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
 	<header class="masthead text-center d-flex">
    	<div class="container mx-auto my-5">
    </div>
    </header>
    <form action="gameManage_attendMem_ok" mothod="post">
		<div class="container my-auto text-center ">
		    <input class="form-control" type="hidden" id="gameId" name="gameId" value='${b.gameId}'/>
			<div id="bCont_wrap">
				<%-- <h4 class="bCont_title">${b.gameNm}<br/><br/>${bcont}</h4> --%>
					<br/>
						<h2 class="gameMemRegList_title">회원추가</h2>
							<table class="table table-hover" id="gameMemRegInsert_t">
								<tr>
									<th>선택</th>
									<th>이름</th>
								</tr>
									<c:if test="${!empty gameMemRegList}">
								<c:forEach var="gameMemRegList" items="${gameMemRegList}">
								<tr>
									<td align="center">
										<input type="checkbox" name="regGameMemCheckIdList" value='${gameMemRegList.memId}'  >
									</td>
									<td align="center">
										<input class="form-control" type="hidden" name="regGameMemNmList" value='${gameMemRegList.memId}'/>
									 	<input class="form-control" type="hidden" name="regGameMemIdList" value='${gameMemRegList.memName}'/>
										${gameMemRegList.memName}
									</td>
								</tr>
								</c:forEach>
									</c:if>
									<c:if test="${empty gameMemRegList}">
								<tr>
									<th colspan="2">회원이 없습니다!</th>
								</tr>
								</c:if>
			  				</table>

				<div id="bCont_menu">
					<input type="submit" class="btn btn-primary btn-sm btn-block" value="저장" />
					<input type="button" class="btn btn-primary btn-sm btn-block" value="목록" onclick="location='gameManage_list?page=${page}';" />               
				</div>
			</div>
		</div>
  </form>
    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.js" />"></script>
 
</body>
</html>

<!-- 부트스트랩클래스 참고사이트
https://bootswatch.com/default/ -->
