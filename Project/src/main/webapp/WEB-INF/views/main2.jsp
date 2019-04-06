<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

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
		 window.open($url,"비번검색","width=400px,height=300px"+
				 ",scrollbars=yes");
		 //open(공지창경로,공지창이름,속성) 메서드로 폭이 300픽셀,
		 //높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만든다.
	 }
	</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FOUR-STEP</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/resources/bootstrap-3.3.2-dist/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css'/>" rel="stylesheet">
<%--     <link href="<c:url value='/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css'/>" rel="stylesheet"> --%>

    <!-- Custom fonts for this template -->
    <%-- <link href="<c:url value='/resources/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css"> --%>
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'/>" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
<%--     <link href="<c:url value='/resources/vendor/magnific-popup/magnific-popup.css'/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/resources/css/creative.min.css'/>" rel="stylesheet"> --%>

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">FOUR-STEP1</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        	  <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="#about">포스텝소개</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="#services">포스텝회원</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="#portfolio">공지</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="#portfolio">이야기공간</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="#contact">회원SCORE</a>
	            </li>
	            <c:if test="${empty id}">
		            <li class="dropdown">
		              <!-- <a class="nav-link js-scroll-trigger" href="#">로그인</a> -->
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">LOGIN<span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                  <form method="post" action="member_login_ok" onsubmit="return login_check();">
		                  <div class="form-group">
		                  	<label for="login_id"><strong>아이디</strong></label>
		                    <li><input name="login_id" id="login_id" class="form-control" tabindex="1" placeholder="ID" required autofocus /></li>
		                  </div>
		                  <div class="form-group">
		                  	<label for="login_pwd"><strong>비밀번호</strong></label>
							<li><input type="password" name="login_pwd" id="login_pwd" class="form-control" tabindex="2" id="inputPassword" placeholder="Password" required /></li>
		                  </div>
		                  <div class="form-group">
			                  <li><input class="btn btn-warning btn-sm btn-block" type="submit" value="로그인" /></li>
			              </div>
			              <div class="form-group">
			                  <li><input class="btn btn-warning btn-sm btn-block" type="button" value="비번찾기" onclick="pwd_find();" /></li>
			              </div>
			              <div class="form-group">
					          <li><input class="btn btn-warning btn-sm btn-block" type="button" value="회원가입" onclick="location='member_join';" /></li>
					      </div>
					      </form>
		                </ul>
		            </li>
	            </c:if>
				 <c:if test="${!empty id}"><!-- 로그인 이후 화면 -->
					 <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MYPAGE<span class="caret"></span></a>
						<ul class="dropdown-menu">
					      <li><p class="text-info text-center">LOGIN : ${id}</p></li>
					      <form method="post" action="member_logout">
						      <li><input class="btn btn-warning btn-sm btn-block" type="button" value="정보수정" onclick="location='member_edit';" /></li><br/>
						      <li><input class="btn btn-warning btn-sm btn-block" type="button" value="회원탈퇴" onclick="location='member_del';" /></li><br/>
						      <li><input class="btn btn-warning btn-sm btn-block" type="submit" value="로그아웃" /></li><br/>
					      </form>
					  	</ul>
					  </li>
				 </c:if>
		 	  </ul>
        </div>
    </nav>

    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
      <div class="container">
        <a href="../" class="navbar-brand">FOUR-STEP1</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Themes <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="themes">
                <a class="dropdown-item" href="../default/">Default</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../cerulean/">Cerulean</a>
                <a class="dropdown-item" href="../cosmo/">Cosmo</a>
                <a class="dropdown-item" href="../cyborg/">Cyborg</a>
                <a class="dropdown-item" href="../darkly/">Darkly</a>
                <a class="dropdown-item" href="../flatly/">Flatly</a>
                <a class="dropdown-item" href="../journal/">Journal</a>
                <a class="dropdown-item" href="../litera/">Litera</a>
                <a class="dropdown-item" href="../lumen/">Lumen</a>
                <a class="dropdown-item" href="../lux/">Lux</a>
                <a class="dropdown-item" href="../materia/">Materia</a>
                <a class="dropdown-item" href="../minty/">Minty</a>
                <a class="dropdown-item" href="../pulse/">Pulse</a>
                <a class="dropdown-item" href="../sandstone/">Sandstone</a>
                <a class="dropdown-item" href="../simplex/">Simplex</a>
                <a class="dropdown-item" href="../sketchy/">Sketchy</a>
                <a class="dropdown-item" href="../slate/">Slate</a>
                <a class="dropdown-item" href="../solar/">Solar</a>
                <a class="dropdown-item" href="../spacelab/">Spacelab</a>
                <a class="dropdown-item" href="../superhero/">Superhero</a>
                <a class="dropdown-item" href="../united/">United</a>
                <a class="dropdown-item" href="../yeti/">Yeti</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../help/">Help</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://blog.bootswatch.com">Blog</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Cerulean <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="download">
                <a class="dropdown-item" href="https://jsfiddle.net/bootswatch/9y480qo5/">Open in JSFiddle</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../4/cerulean/bootstrap.min.css">bootstrap.min.css</a>
                <a class="dropdown-item" href="../4/cerulean/bootstrap.css">bootstrap.css</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../4/cerulean/_variables.scss">_variables.scss</a>
                <a class="dropdown-item" href="../4/cerulean/_bootswatch.scss">_bootswatch.scss</a>
              </div>
            </li>
          </ul>

          <ul class="nav navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="http://builtwithbootstrap.com/" target="_blank">Built With Bootstrap</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="https://wrapbootstrap.com/?ref=bsw" target="_blank">WrapBootstrap</a>
            </li>
          </ul>

        </div>
      </div>
    </div>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong>WELLCOME!</br>FOUR-STEP</strong>
            </h1>
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5">함께 볼링을 즐겨요.<br/> 신입회원은 언제나 환영입니다</p>
          </div>
        </div>
      </div>
    </header>

    <section class="bg-primary" id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">상주볼링장 : 구로 MK볼링센터</h2>
            <hr class="light my-4">
            <p class="text-faded mb-4">매주 토요일 5시 정기모임을 진행하며 수시로 벙개를 진행합니다!!</br> 
                                                                                     볼링을 좋아하는 사람들이 볼링을 함께하는 모임입니다~</br>   
                                                                                     술자리는 강요하지않습니다.볼링보다 술자리를 원한다면 다른곳을 찾아보세요~</p>
            <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">포스텝 회원 구경가기!</a>
          </div>
        </div>
      </div>
    </section>

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">At Your Service</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Sturdy Templates</h3>
              <p class="text-muted mb-0">Our templates are updated regularly so they don't break.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Ready to Ship</h3>
              <p class="text-muted mb-0">You can use this theme as is, or you can make changes!</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Up to Date</h3>
              <p class="text-muted mb-0">We update dependencies to keep things fresh.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Made with Love</h3>
              <p class="text-muted mb-0">You have to make your websites with love these days!</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<c:url value='/resources/img/portfolio/fullsize/1.jpg'/>">
              <img class="img-fluid" src="<c:url value='/resources/img/portfolio/thumbnails/1.jpg'/>" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<c:url value='/resources/img/portfolio/fullsize/2.jpg'/>">
              <img class="img-fluid" src="<c:url value='/resources/img/portfolio/thumbnails/2.jpg'/>" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<c:url value='/resources/img/portfolio/fullsize/3.jpg'/>">
              <img class="img-fluid" src="<c:url value='/resources/img/portfolio/thumbnails/3.jpg'/>" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<c:url value='/resources/img/portfolio/fullsize/4.jpg'/>">
              <img class="img-fluid" src="<c:url value='/resources/img/portfolio/thumbnails/4.jpg'/>" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<c:url value='/resources/img/portfolio/fullsize/5.jpg'/>">
              <img class="img-fluid" src="<c:url value='/resources/img/portfolio/thumbnails/5.jpg'/>" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<c:url value='/resources/img/portfolio/fullsize/6.jpg'/>">
              <img class="img-fluid" src="<c:url value='/resources/img/portfolio/thumbnails/6.jpg'/>" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>

    <section class="bg-dark text-white">
      <div class="container text-center">
        <h2 class="mb-4">Free Download at Start Bootstrap!</h2>
        <a class="btn btn-light btn-xl sr-button" href="<c:url value='http://startbootstrap.com/template-overviews/creative/'/>">Download Now!</a>
      </div>
    </section>

    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading">Let's Get In Touch!</h2>
            <hr class="my-4">
            <p class="mb-5">Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
            <p>123-456-6789</p>
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a>
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Bootstrap core JavaScript -->
    <%-- <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script> --%>
    <script src="<c:url value='/resources/bootstrap-3.3.2-dist/js/bootstrap.js'/>"></script>
    <script src="<c:url value='/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js'/>"></script>

  </body>

</html>
