<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery.js"/>"></script>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.css">
    
<meta charset="UTF-8">
<title>게임관리</title>

</head>
<body>
	<jsp:include page="../headNav.jsp"></jsp:include>
 	<header class="masthead text-center d-flex">
    	<div class="container mx-auto my-5">
    </div>
    </header>
    	<div class="container my-auto text-center ">
		 <div id="bCont_wrap">
		  <h4 class="bCont_title">${b.gameNm}<br/><br/>${bcont}</h4>
		  <br/>
					  <h2 class="gameList_title">참석자</h2>
					  <table class="table table-hover" id="gameMemList_t">
					   <c:if test="${!empty gameMemList}">
					   <c:forEach var="gameMemList" items="${gameMemList}">
					   <tr>
					    <td align="center">${gameMemList.memList}</td>
					   </tr>
					   </c:forEach>
					   </c:if>
					   <c:if test="${empty gameMemList}">
					   <tr>
					    <th colspan="5">게임참석인원이 없습니다!</th>
					   </tr>
					   </c:if>
					  </table>
					  <h2 class="gameScoreList_title">점수표</h2>
					  <table class="table table-hover" id="gameScoreList_t">
					   <tr>
					    <th width="11%">순위</th>
					    <th width="11%">팀</th>
					    <th width="22%">이름</th>
					    <th width="11%">1게임</th>
					    <th width="11%">2게임</th>
					    <th width="11%">3게임</th>
					    <th width="11%">평균</th>
					    <th width="11%">총점</th>
					   </tr>
					   <c:if test="${!empty scoreList}">
					   <c:forEach var="scoreList" items="${scoreList}">
					   <tr>
					    <td align="center">${scoreList.rank}</td>
					    <td align="center">${scoreList.teamNm}</td>
					    <td align="center">${scoreList.memName}</td>
					    <td align="center">${scoreList.game1}</td>
					    <td align="center">${scoreList.game2}</td>
					    <td align="center">${scoreList.game3}</td>
					    <td align="center">${scoreList.avgGameScore}</td>
					    <td align="center">${scoreList.totalScore}</td>	 
					   </tr>
					   </c:forEach>
					   </c:if>
					   <c:if test="${empty scoreList}">
					   <tr>
					    <th colspan="9">점수기록이 없습니다!</th>
					   </tr>
					   </c:if>
			  </table>

  <div id="bCont_menu">
  <c:choose>
  	<c:when test="${b.attendYn eq 0}">
  		<input type="button" class="btn btn-primary btn-sm btn-block" value="참석" onclick="location='gameManage_attend?no=${b.gameId}';" />
  	</c:when>
  	<c:when test="${b.attendYn eq 1}">
  		<input type="button" class="btn btn-primary btn-sm btn-block" value="참석취소" onclick="location='gameManage_cancle?no=${b.gameId}';" />
  	</c:when>
  </c:choose>
   <input type="button" class="btn btn-primary btn-sm btn-block" value="점수입력" onclick="location='gameManage_regScorePage?no=${b.gameId}&gameRound=1';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="공고수정" onclick="location='gameManage_cont?no=${b.gameId}&page=${page}&state=edit';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="공고삭제" onclick="location='gameManage_cont?no=${b.gameId}&page=${page}&state=del';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="참석자관리" onclick="location='gameManage_attendMem?no=${b.gameId}';" />
   <input type="button" class="btn btn-primary btn-sm btn-block" value="목록" onclick="location='gameManage_list?page=${page}';" />               
  </div>
 </div>
 </div>
  
    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.js" />"></script>
 
</body>
</html>
