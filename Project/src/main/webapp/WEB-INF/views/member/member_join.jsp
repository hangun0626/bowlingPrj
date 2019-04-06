<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap core CSS -->
   <%--  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"> --%>
    <!-- Custom fonts for this template -->
   <%--  <link href="<c:url value='/resources/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'/>" rel="stylesheet" type="text/css">
 --%>
    <!-- Plugin CSS -->
  <%--   <link href="<c:url value='/resources/vendor/magnific-popup/magnific-popup.css'/>" rel="stylesheet"> --%>
    <!-- Custom styles for this template -->
 <%--    <link href="<c:url value='/resources/css/creative.min.css'/>" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/member.js"/>"></script>

</head>
<body>
 <div id="mJoin_wrap">
 <br/>
  <h2 class = "text-center">회원가입</h2>
  <br/>
  <form name="m" method="post" action="member_join_ok" onsubmit="return join_check();">
   <table id="mJoin_t" class="table table-hover">
    <tr>
    <td>
      <input class="form-control" name="mem_id" id="mem_id" type="text" placeholder="아이디">
      <span id="idcheck"></span>
    </td>
    <td>
    <input type="button" value="아이디중복체크" class="btn btn-primary disabled" onclick="id_check();">
    
    </td>
    </tr>
    <tr>
     <td>
     <input class="form-control" colspan="2" name="mem_pwd" id="mem_pwd" type="password" size="14" placeholder="Password">
     </td>
    </tr>
    <tr>
     <td>
     <input class="form-control" colspan="2" type="password" name="mem_pwd2" id="mem_pwd2" size="14" placeholder="Password 확인" />
     </td>
    </tr>
    <tr>
    <td>
     <input class="form-control" colspan="3" name="mem_name" id="mem_name" placeholder="회원이름"/>
     </td>
    </tr>
<%--     <tr>
     <th>우편번호</th>
     <td>
     <input name="mem_zip" id="mem_zip" size="3"
     class="input_box" readonly />-
     <input name="mem_zip2" id="mem_zip2" size="3"
     class="input_box" readonly />
     readonly 속성은 읽기만 가능.
     <input type="button" value="우편검색" class="input_b"
     onclick="post_check();" />
     </td>
    </tr>
    <tr>
     <th>주소</th>
     <td>
     <input name="mem_addr" id="mem_addr" size="40" class="input_box"
     readonly />
     </td>
    </tr>
    <tr>
     <th>나머지 주소</th>
     <td>
     <input name="mem_addr2" id="mem_addr2" size="36" class="input_box"
     />
     </td>
    </tr>
    <tr> --%>
<%--      <th>폰번호</th>
     <td>
     <select name="mem_phone01" id="mem_phone01">
     <c:forEach var="p" items="${phone}">
      <option value="${p}">${p}</option>
     </c:forEach>
     </select>-<input name="mem_phone02" id="mem_phone02" size="4"
     maxlength="4" class="input_box" />-<input name="mem_phone03"
     id="mem_phone03" size="4" maxlength="4" class="input_box" />
     <!-- maxlength="4"로 지정하면 최대 4자까지만 입력가능 -->
     </td> 
    </tr>
    <tr>
     <th>전자우편</th>
     <td>
     <input name="mail_id" id="mail_id" size="14" class="input_box" />
     @<input name="mail_domain" id="mail_domain" size="18"
     class="input_box" readonly />
     <select name="mail_list" onchange="domain_list();">
      <c:forEach var="mail" items="${email}">
       <option value="${mail}">${mail}</option>
      </c:forEach>
     </select>
     </td>
    </tr> --%>
   </table>
   <div id="mJoin_menu">
   <input type="submit" value="가입" class="btn btn-primary btn-lg btn-block"/>
   <input type="reset" value="취소" class="btn btn-primary btn-lg btn-block" onclick="$('#mem_id').focus();" />
   </div>
  </form>
 </div>
</body>
</html>