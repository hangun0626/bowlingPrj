<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script>
	 function login_check(){
		 if($.trim($("#login_id").val())==""){
			 alert("로그인 아이디를 입력하세요!");
			 $("#login_id").val("").focus();
			 return false;
		 }
		 if($.trim($("#login_pwd").val())==""){
			 alert("로그인 비번을 입력하세요!");
			 $("#login_pwd").val("").focus();
			 return false;
		 }
	 }//로그인 인증 유효성 검증
	 
	 //비번찾기
	 function pwd_find(){
		 $url="pwd_find";//매핑주소
		 window.open($url,"비번검색","width=400px,height=300px"+",scrollbars=yes");
		 //open(공지창경로,공지창이름,속성) 메서드로 폭이 300픽셀,
		 //높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만든다.
	 }
	</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CORE BOWLING TEAM</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap-4.1.1-dist/css/bootstrap-grid.css">
    
    
<meta charset="UTF-8">
<title>게시판 목록</title>
<script>
 function find_check(){
	 if($.trim($("#find_name").val())==""){
		 alert("검색어를 입력하세요!");
		 $("#find_name").val("").focus();
		 return false;
	 }
 }
</script>

</head>
<body id="page-top">
    <!-- Navigation -->
	<jsp:include page="../headNav.jsp"></jsp:include>
 	<header class="masthead text-center d-flex">
    	<div class="container mx-auto my-5">
    </div>
    </header>
    <div class="row">
    	<div class="container my-auto text-center ">
          <div class="mx-auto">
			<form method="get" action="board_list" onsubmit="return find_check();">
			 <div id="bList_wrap">
			  <h2 class="bList_title">공지사항</h2>
			  <div class="bList_count">글개수: ${listcount} 개</div>
			  <table class="table table-hover" id="bList_t">
			   <tr>
			    <th width="6%" height="26">번호</th>
			    <th width="35%">제목</th>
			    <th width="25%">작성자</th>
			    <th width="25%">작성일</th>
			    <th width="10%">조회수</th>     
			   </tr>
			   <c:if test="${!empty blist}">
			   <c:forEach var="b" items="${blist}">
			   <tr>
			    <td align="center">
			    <c:if test="${b.board_step == 0}">
			    <%-- 원본글일때만 그룹번호가 출력 --%>
			     ${b.board_ref}
			    </c:if>
			    </td>
			    <td>
			<c:if test="${b.board_step != 0}"><%--답변글일때만 실행--%>
			  <c:forEach begin="1" end="${b.board_step}" step="1">
			   &nbsp;<%--답변글 들여쓰기 --%>
			  </c:forEach>
			  <img src="<c:url value='/resources/images/AnswerLine.gif'/>" />
			  <%--답변글 이미지 출력부분 --%>
			</c:if>    
			<a href="board_cont?no=${b.board_no}&page=${page}&state=cont">
			${b.board_title}</a>
			<%-- board_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이
			get방식으로 &구분하면서 전달된다. --%>
			    </td>
			    <td align="center">${b.board_name}</td>
			    <td align="center">${b.board_date}</td>
			    <td align="center">${b.board_hit}</td>
			   </tr>
			   </c:forEach>
			   </c:if>
			   <c:if test="${empty blist}">
			   <tr>
			    <th colspan="5">목록이 없습니다!</th>
			   </tr>
			   </c:if>
			  </table>
			  
			  <%--페이징 즉 쪽나누기 추가 --%>
			  <div id="bList_paging">
			    <%-- 검색전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name)}">    
			    <c:if test="${page<=1}">
			     [이전]&nbsp;
			    </c:if>
			    <c:if test="${page>1}">
			     <a href="board_list?page=${page-1}">[이전]</a>&nbsp;
			    </c:if>
			    
			    <%--현재 쪽번호 출력--%>
			    <c:forEach var="a" begin="${startpage}" end="${endpage}"
			    step="1">
			     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
			      <${a}>
			     </c:if>
			     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
			     다면 --%>
			     <a href="board_list?page=${a}">[${a}]</a>&nbsp;
			     </c:if>
			    </c:forEach>
			    
			    <c:if test="${page >= maxpage}">
			    [다음]
			    </c:if>
			    <c:if test="${page<maxpage}">
			    <a href="board_list?page=${page+1}">[다음]</a>
			    </c:if>
			</c:if>
			
			<%-- 검색후 페이징 --%>
			 <c:if test="${(!empty find_field) && (!empty find_name)}">    
			    <c:if test="${page<=1}">
			     [이전]&nbsp;
			    </c:if>
			    <c:if test="${page>1}">
			     <a href="board_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
			    </c:if>
			    
			    <%--현재 쪽번호 출력--%>
			    <c:forEach var="a" begin="${startpage}" end="${endpage}"
			    step="1">
			     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
			      <${a}>
			     </c:if>
			     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
			     다면 --%>
			     <a href="board_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
			     </c:if>
			    </c:forEach>
			    
			    <c:if test="${page >= maxpage}">
			    [다음]
			    </c:if>
			    <c:if test="${page < maxpage}">
			    <a href="board_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
			    </c:if>
			</c:if>   
			  </div>
			  
			  <div id="bList_menu">
			   <input type="button" class="btn btn-primary btn-sm btn-block" value="글쓰기" onclick="location='board_write?page=${page}';" />   
			  </div>
			  
			  <%--검색 폼추가 --%>
			  <div id="bFind_wrap">
			  <select name="find_field" class = "form-control">
			    <option value="board_title" <c:if test="${find_field=='board_title'}"> ${'selected'} </c:if>>제목 </option>
			    <option value="board_cont" <c:if test="${find_field=='board_cont'}">  ${'selected'} </c:if>>내용 </option>  
			  </select>
			  <input class = "form-control mr-sm-2" name="find_name" id="find_name" placeholder="검색내용" size="14" value="${find_name}" />
			  <input type="submit" class="btn btn-primary btn-sm btn-block" value="검색" />
			  </div>
			 </div>
			 </form>
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

<!-- 부트스트랩클래스 참고사이트
https://bootswatch.com/default/ -->















