<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
MemVO memVO = (MemVO) session.getAttribute("memVO");
System.out.println("111111111111111111111111111="+session.getId());
System.out.println( "是否登入:"+ (memVO != null));
%>
<html>
<head>
<%-- Mobile Specific Meta --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
<title>會員前端頁面</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<%--
			CSS
			============================================= --%>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">					
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<%-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
			
<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor='white'>
<header id="header" id="home">
				<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-3 col-sm-3 menu-top-left">
					<a href="<%=request.getContextPath()%>/front-end/members/index.jsp"> <img class="img-fluid"
						src="<%=request.getContextPath()%>/front-end/members/images/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-6 menu-top-middle justify-content-center d-flex">
					<div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="<%=request.getContextPath()%>/front-end/members/index.jsp">首頁</a></li>
						<li><a href="<%=request.getContextPath()%>/front-end/members/index.jsp">會員</a>
							<ul>
								    	<li><a href="<%=request.getContextPath()%>/front-end/members/listOneMember.jsp">查看會員資料</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/pet/pet.do?action=select_pet">查看我的寵物資料</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/members/index.jsp">查看我的救援案例</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/members/index.jsp">查看我的認養案例</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/members/index.jsp">查看我的失蹤寵物</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/members/index.jsp">查看我的捐贈紀錄</a></li>
							</ul>
						
						</li>
						<li><a href="about.html">救援</a></li>
						<li><a href="service.html">認養</a></li>
						<li><a href="training.html">失蹤</a>
						     <ul>
								<li><a href="<%=request.getContextPath()%>/front-end/missingCase/addMissing.jsp">新增失蹤案例</a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp">失蹤案例瀏覽</a></li>
							</ul>
						</li>
						<li><a href="events.html">協尋</a></li>
						<li class="menu-has-children"><a href="<%=request.getContextPath()%>/front-end/donate/don_Main.jsp">捐贈</a>
							      	<ul>
								    	<li><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心捐款</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心商品捐贈</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">許願物資捐贈</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">愛心商品捐贈紀錄列表</a></li>
								    </ul>
						</li>
						<li class="menu-has-children menu-active"><a href="">商城</a></li>
<!-- 						<li><a href="contact.html">關於我們</a></li> -->
<!-- 						<li><a href="elements.html">常見問題</a></li> -->
					</ul>
				</nav>
				<%-- #nav-menu-container --%>
			</div>
		</div>
				</div>
				<div class="col-lg-3 col-sm-3 menu-top-right">
				<% if(memVO == null){ %>
				<a href="<%=request.getContextPath()%>/front-end/members/login.jsp"><img style="width:40px;height:40px" class="img-fluid" src="images/login.jpg" data-toggle="tooltip" data-placement="left" title="登入/註冊">登入/註冊</a>
				<%}else{ 
					out.print(memVO.getMemb_nick()+"，你好");
				%>
				<a href="<%=request.getContextPath()%>/front-end/members/mem.do?action=logout"><img style="width:40px;height:40px" class="img-fluid" src="images/logout.png" data-toggle="tooltip" data-placement="left" title="登出">登出</a>
				

				<%}%>
				</div>
			</div>
		</div>
		<hr>
			    
			  </header><!-- #header -->
			  
			  
	<%-- 黑底logo區 --%>			  
<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row fullscreen d-flex align-items-center justify-content-start">
						<div class="banner-content col-lg-12">
							<h6 class="text-white" >Respect All Lifes</h6>
							<span class="bar"></span>
							<h1 class="text-white">
								浪我陪你 <br>
								LET ME PET YOU
							</h1>
							<a href="#" class="genric-btn">Book Consultancy</a>
						</div>
					</div>
				</div>
			</section>
		<section id="sp-main-top-wrapper" class=" "><div class="row-fluid" id="main-top">
	
<%-- 鼓勵救援區 --%>			
			<section class="about-video-area section-gap">
			
				<div class="container">
					<div class="row">
						<div class="col-lg-6 about-video-left">
							<h6 class="text-uppercase">Latest video that needs your help</h6>
							<h1>
								即刻救援 <br>
								世界因你而變 
							</h1>
							<p>
								<span>We are here to listen from you deliver exellence</span>
							</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.
							</p>
							<a class="primary-btn" href="#">Get Started Now</a>
						</div>
						<div class="col-lg-6 about-video-right justify-content-center align-items-center d-flex">
							<a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid mx-auto" src="img/play.png" alt=""></a>
						</div>
					</div>
				</div>	
			</section>
	<%-- 失蹤協尋區 --%>	
	<section class="home-about-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 home-about-left">
							<img class="mx-auto d-block img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/about-img.png" alt="">
						</div>
						<div class="col-lg-6 home-about-right">
							<h6 class="text-uppercase">Brand new app to blow your mind</h6>
							<h1>Please contact us <br>
							if you found them</h1>
							<p>
								<span>We are here to listen from you deliver exellence</span>
							</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis.
							</p>
							<a class="primary-btn" href="#">Get Started Now</a>
						</div>
					</div>
				</div>	
			</section>	
			
			
	<%-- 鼓勵捐贈區 --%>		
				<section class="price-area section-gap">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">選擇適合您的捐贈方案</h1>
								<p>Choose the best donation that suits you</p>
							</div>
						</div>
					</div>					
					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="single-price">
								<div class="top-part">
									<h1 class="package-no">01</h1>
									<h4>Basic</h4>
									<p>For the individuals</p>
								</div>
								<div class="package-list">
									<ul>
										<li>Secure Online Transfer</li>
										<li>Unlimited Styles for interface</li>
										<li>Reliable Customer Service</li>
									</ul>
								</div>
								<div class="bottom-part">
									<h1>£199.00</h1>
									<a class="price-btn text-uppercase" href="#">Purchase</a>
								</div>								
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="single-price">
								<div class="top-part">
									<h1 class="package-no">02</h1>
									<h4>Economy</h4>
									<p>For the individuals</p>
								</div>
								<div class="package-list">
									<ul>
										<li>Secure Online Transfer</li>
										<li>Unlimited Styles for interface</li>
										<li>Reliable Customer Service</li>
									</ul>
								</div>
								<div class="bottom-part">
									<h1>£299.00</h1>
									<a class="price-btn text-uppercase" href="#">Purchase</a>
								</div>								
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="single-price">
								<div class="top-part">
									<h1 class="package-no">03</h1>
									<h4>Premium</h4>
									<p>For the individuals</p>
								</div>
								<div class="package-list">
									<ul>
										<li>Secure Online Transfer</li>
										<li>Unlimited Styles for interface</li>
										<li>Reliable Customer Service</li>
									</ul>
								</div>
								<div class="bottom-part">
									<h1>£399.00</h1>
									<a class="price-btn text-uppercase" href="#">Purchase</a>
								</div>								
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="single-price">
								<div class="top-part">
									<h1 class="package-no">04</h1>
									<h4>Enterprise</h4>
									<p>For the individuals</p>
								</div>
								<div class="package-list">
									<ul>
										<li>Secure Online Transfer</li>
										<li>Unlimited Styles for interface</li>
										<li>Reliable Customer Service</li>
									</ul>
								</div>
								<div class="bottom-part">
									<h1>£499.00</h1>
									<a class="price-btn text-uppercase" href="#">Purchase</a>
								</div>								
							</div>
						</div>																		
					</div>
				</div>	
			</section>		







	

<%-- 移動照片區 --%>
<center><h1>官方製作團隊</h1></center>
	<section class="gallery-area">
				<div class="container-fluid">
					<div class="row no-padding">
						<div class="active-gallery">
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="<%=request.getContextPath()%>/front-end/members/images/m1.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="<%=request.getContextPath()%>/front-end/members/images/m2.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="<%=request.getContextPath()%>/front-end/members/images/m3.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="<%=request.getContextPath()%>/front-end/members/images/m4.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="<%=request.getContextPath()%>/front-end/members/images/m5.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="<%=request.getContextPath()%>/front-end/members/images/g6.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>								

						</div>
					</div>
				</div>	
			</section>



<%-- 模板script --%>
<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
  			<script src="<%=request.getContextPath()%>/horse_UI_template/js/easing.min.js"></script>			
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/hoverIntent.js"></script>
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/superfish.min.js"></script>	
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.ajaxchimp.min.js"></script>
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.magnific-popup.min.js"></script>	
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/owl.carousel.min.js"></script>			
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.sticky.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>				
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.nice-select.min.js"></script>			
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/parallax.min.js"></script>	
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/waypoints.min.js"></script>
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.counterup.min.js"></script>			
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/mail-script.js"></script>	
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/main.js"></script>
	
</body>




</html>