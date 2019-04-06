<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임개설</title>

	<script src="<c:url value="/resources/js/jquery.js"/>"></script>

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
 <div id="bWrite_wrap">
  <h2 class="bWrite_title">게임개설</h2>
  <form method="post" action="gameManage_write_ok" onsubmit="return bw_check();">
  <input class="form-control" type="hidden" id="wrighterNm" name="wrighterNm" value='${gameManageVO.memName}'/>
   <table id="bWrite_t">
    <tr>
     <th width="30%">작성자</th>
     <td width="70%">
     	${gameManageVO.memName}
     </td>
    </tr>
    <tr>
     <th>게임명</th>
     <td>
     <input class = "form-control mr-sm-2" name="gameNm" id="gameNm" />
     </td>
    </tr>
    <tr>
     <th>게임일시</th>
     <td>
     <input class = "form-control mr-sm-2" name="gameDtime" id="gameDtime" />
    </tr>
<!--     <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="gameManage_pwd" id="gameManage_pwd" size="14" />
     </td>    
    </tr> -->
    <tr>
     <th>내용</th>
     <td>
     <textarea name="gameCont" id="gameCont" rows="9" cols="36"></textarea>
     </td>
    </tr>
   </table>
   <div id="bWrite_menu">
    <input type="submit" class="btn btn-primary btn-sm btn-block" value="저장" />
    <input type="reset" class="btn btn-primary btn-sm btn-block" value="취소" onclick="$('#gameManage_name').focus();" />
    <input type="button" class="btn btn-primary btn-sm btn-block" value="목록" onclick="location='gameManage_list?page=${page}';" />
   </div>
  </form>
 </div>
</body>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap-4.1.1-dist/js/bootstrap.bundle.js" />"></script>

</html>







