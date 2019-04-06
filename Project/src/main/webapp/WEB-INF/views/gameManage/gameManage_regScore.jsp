<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery.js"/>"></script>
 	<script>
	 	$(function(){
	 		// id 가 gameRound인 아이템이 변경되었을 때
	 		$('#gameRound').change(function(){
	 			var gameId = $('#gameId').val();
	 			var gameRound = $('#gameRound option:selected').val();
	 			//alert( "111gameManage_regScorePage?gameRound="+gameRound+"&no="+gameId);
	 			location="gameManage_regScorePage?gameRound="+gameRound+"&no="+gameId;
	 		});
	 	});
	</script>

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
<jsp:include page="../headNav.jsp"></jsp:include>
 	<header class="masthead text-center d-flex">
    	<div class="container mx-auto my-5">
    </div>
    </header>
    <form action="gameManage_regScore_ok" mothod="post">
		<div class="container my-auto text-center ">
		    <input class="form-control" type="hidden" id="gameId" name="gameId" value='${b.gameId}'/>
			<div id="bCont_wrap">
				<%-- <h4 class="bCont_title">${b.gameNm}<br/><br/>${bcont}</h4> --%>
					<br/>
						<h2 class="gameScoreList_title">점수표</h2>
						    <div class="form-group">
								<label for="exampleSelect1">게임선택</label>
 								<select class="form-control" name="gameRound" id="gameRound">
									<option value="1" <c:if test="${b.gameRound == 1}">selected</c:if>>1게임</option>
									<option value="2" <c:if test="${b.gameRound == 2}">selected</c:if>>2게임</option>
									<option value="3" <c:if test="${b.gameRound == 3}">selected</c:if>>3게임</option>
								</select>
							</div>
							<table class="table table-hover" id="gameScoreInsert_t">
								<tr>
									<th width="50%">이름</th>
									<th width="50%">점수</th>
								</tr>
									<c:if test="${!empty scoreRegList}">
								<c:forEach var="scoreRegList" items="${scoreRegList}">
								<tr>
									<td align="center">
										<input class="form-control" type="hidden" name="regScoreMemIdList" value='${scoreRegList.memId}'/>
										<input class="form-control" type="hidden" name="regScoreMemNmList" value='${scoreRegList.memName}'/>
										${scoreRegList.memName}
									</td>
									<td align="center">
										<input class="form-control" name="regScoreList" type="text" placeholder="Default input" value='${scoreRegList.gameScore}' />
									</td>
								</tr>
								</c:forEach>
									</c:if>
									<c:if test="${empty scoreRegList}">
								<tr>
									<th colspan="9">참가자가 없습니다!</th>
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
