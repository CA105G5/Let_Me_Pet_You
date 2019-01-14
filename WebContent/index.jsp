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
<jsp:include page="/index_Header.jsp" flush="true" />



<div id="carousel-id" class="carousel slide" data-ride="carousel">
		    <!-- 幻燈片小圓點區 -->
		    <ol class="carousel-indicators">
		        <li data-target="#carousel-id" data-slide-to="0" class="active"></li>
		        <li data-target="#carousel-id" data-slide-to="1" class=""></li>
		        <li data-target="#carousel-id" data-slide-to="2" class=""></li>
		    </ol>
		    <!-- 幻燈片主圖區 -->
		    <div class="carousel-inner">
		        <div class="item active">
<!-- 		        	<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt=""> -->
		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel1.jpg" alt="" style="width:2000px;height:800px"> 
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>Help~~~~~~</h1>
<!-- 		                    <p>請救救我...</p> -->
		                    <p><a class="btn btn-lg btn-primary" href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp" role="button">即刻救援</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel2.jpg" alt="" style="width:2000px;height:800px">
<%-- 		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel2.jpg" alt=""> --%>
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>以領養代替購買</h1>
<!-- 		                    <p>愛我請照顧我一輩子</p> -->
		                    <p><a class="btn btn-lg btn-primary" href="<%=request.getContextPath()%>/front-end/adopt/listAllAdopt.jsp" role="button">線上認養</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		        	<img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel3.jpg" alt="" style="width:2000px;height:800px">
<%-- 		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel3.jpg" alt=""> --%>
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>他們找不到回家的路...</h1>
<!-- 		                    <p>請幫助他們找到主人</p> -->
		                    <p><a class="btn btn-lg btn-primary" href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp" role="button">失蹤詳情</a></p>
		                </div>
		            </div>
		        </div>
		    </div>
			<a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
		    <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>  
		
		
		
		
		
		
			  
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
							
						</div>
					</div>
				</div>
			</section>
		
	
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
							<a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid mx-auto" src="<%=request.getContextPath()%>/horse_UI_template/img/play.png" alt=""></a>
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
							        <img src="<%=request.getContextPath()%>/front-end/members/images/java.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>								

						</div>
					</div>
				</div>	
			</section>
<script>
$('.carousel').carousel({
	interval: 3000
})
</script>


<%-- 模板script --%>
<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>			
			
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