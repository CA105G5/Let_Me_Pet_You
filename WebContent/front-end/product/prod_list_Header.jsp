<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>Horse Club</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/linearicons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/owl.carousel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/product/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">

<style type="text/css">
	p {
		　 font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
	}
	
	div {
		font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
	}
</style>
</head>
<body>

	<header id="header" id="home">
		<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-4 col-sm-4 menu-top-left">
					<a href="index.html"> <img class="img-fluid"
						src="<%=request.getContextPath()%>/front-end/product/img/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-4 menu-top-middle justify-content-center d-flex">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="請輸入關鍵字">
						<span class="input-group-btn">
							<button class="btn btn-info" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="col-lg-4 col-sm-4 menu-top-right">
					<a class="tel">會員登入/ 註冊</a> <a href="#"><span
						class="fa fa-user"></span></a>
					<!-- style="font-size: 1.5rem;" -->
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.html">首頁</a></li>
						<li><a href="about.html">救援</a></li>
						<li><a href="service.html">認養</a></li>
						<li><a href="training.html">失蹤</a></li>
						<li><a href="events.html">協尋</a></li>
						<li class="menu-has-children"><a href="pricing.html">捐贈</a></li>
						<ul>
							<li><a href="blog-home.html">愛心捐款</a></li>
							<li><a href="blog-single.html">愛心商品捐贈</a></li>
							<li><a href="blog-single.html">許願物資捐贈</a></li>
						</ul>
						<li class="menu-active"><a href="">商城</a></li>
						<li><a href="contact.html">關於我們</a></li>
						<li><a href="elements.html">常見問題</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
		
		<div class="container">
			<div class="row">

			<!-- 左側邊list-group -->
			<div class="col-xs-12 col-sm-3">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>商品分類</h3>
					<hr>
					<h5>
						<a href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=1">&nbsp&nbsp&nbsp貓咪</a>
					</h5>
					<h5>
						<a href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=2">&nbsp&nbsp&nbsp狗</a>
					</h5>
					<h5>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
						<a href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=3">&nbsp&nbsp&nbsp飛禽</a>
					</h5>
					<h5>
						<a href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=4">&nbsp&nbsp&nbsp兔</a>
					</h5>
					<h5>
						<a href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=5">&nbsp&nbsp&nbsp其他</a>
					</h5>


				</div>
			</div>
		</div>
	</div>

<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->

<!-- 				左側邊list-group -->
<!-- 				<div class="col-xs-12 col-sm-3 sidebar"> -->
<!-- 					<div class="single-widget category-widget"> -->
<!-- 						<h4 class="title">商品分類</h4> -->
<!-- 						<ul> -->
<!-- 							<li><a -->
<%-- 								href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=1" --%>
<!-- 								class="justify-content-between align-items-center d-flex"><h6>&nbsp&nbsp&nbsp貓咪</h6> -->
<!-- 									<span></span></a></li> -->
<!-- 							<li><a -->
<%-- 								href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=2" --%>
<!-- 								class="justify-content-between align-items-center d-flex"><h6>&nbsp&nbsp&nbsp狗狗</h6> -->
<!-- 									<span></span></a></li> -->
<!-- 							<li><a -->
<%-- 								href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=3" --%>
<!-- 								class="justify-content-between align-items-center d-flex"><h6>&nbsp&nbsp&nbsp飛禽</h6> -->
<!-- 									<span></span></a></li> -->
<!-- 							<li><a -->
<%-- 								href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=4" --%>
<!-- 								class="justify-content-between align-items-center d-flex"><h6>&nbsp&nbsp&nbsp兔子</h6> -->
<!-- 									<span></span></a></li> -->
<!-- 							<li><a -->
<%-- 								href="<%=request.getContextPath()%>/prod/prod.do?action=getAll_For_Display&type=5" --%>
<!-- 								class="justify-content-between align-items-center d-flex"><h6>&nbsp&nbsp&nbsp其他</h6> -->
<!-- 									<span></span></a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</header>
	<!-- #header -->

	<br>
	<br>

	<br>
	<br>

	<br>
	<br>

	<!-- 	starting side-bar -->
	
	<!-- 	end side-bar -->

	<!-- start banner Area -->
	<!-- 12/16加上style="display: none" 移除封面 -->
	<section class="banner-area relative" id="home" style="display: none">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">Training Programs</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="training.html"> Training Programs</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<script src="<%=request.getContextPath()%>/front-end/product/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/hoverIntent.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/superfish.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/jquery.ajaxchimp.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/jquery.sticky.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/jquery.nice-select.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/parallax.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/jquery.counterup.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/mail-script.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/product/js/main.js"></script>
</body>
</html>


