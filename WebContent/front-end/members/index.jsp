<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>�|���e�ݭ���</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<%--
			CSS
			============================================= --%>
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
			<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<%-- �Y�n�ϥ�fai�����~��icon�A�nimport CDN�A�ֱ���facdn=>tab --%>
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
				<div class="col-lg-4 col-sm-4 menu-top-left">
					<a href="index.jsp"> <img class="img-fluid"
						src="img/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-4 menu-top-middle justify-content-center d-flex">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="�п�J����r">
						<span class="input-group-btn">
							<button class="btn btn-info" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="col-lg-4 col-sm-4 menu-top-right">
				<a href="#"><img style="width:40px;height:40px" class="img-fluid" src="images/login.jpg" data-toggle="tooltip" data-placement="left" title="�n�J/���U"></a>
					
				</div>
			</div>
		</div>
		<hr>
			    <div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.jsp">����</a></li>
						<li><a href="about.html">�ϴ�</a></li>
						<li><a href="service.html">�{�i</a></li>
						<li><a href="training.html">����</a></li>
						<li><a href="events.html">��M</a></li>
						<li><a href="pricing.html">����</a>
							<ul>
								<li><a href="blog-home.html">�R�߮���</a></li>
								<li><a href="blog-single.html">�R�ߪ��ꮽ��</a></li>
								<li><a href="blog-single.html">�\�@���ꮽ��</a></li>
							</ul></li>
						<li class="menu-has-children menu-active"><a href="">�ӫ�</a></li>
						<li><a href="contact.html">����ڭ�</a></li>
						<li><a href="elements.html">�`�����D</a></li>
					</ul>
				</nav>
				<%-- #nav-menu-container --%>
			</div>
		</div>
			  </header><!-- #header -->
			  
			  
	<%-- �©�logo�� --%>			  
<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row fullscreen d-flex align-items-center justify-content-start">
						<div class="banner-content col-lg-12">
							<h6 class="text-white" >Respect All Lifes</h6>
							<span class="bar"></span>
							<h1 class="text-white">
								���ڳ��A <br>
								LET ME PET YOU
							</h1>
							<a href="#" class="genric-btn">Book Consultancy</a>
						</div>
					</div>
				</div>
			</section>
		<section id="sp-main-top-wrapper" class=" "><div class="row-fluid" id="main-top">
	
<%-- ���y�ϴ��� --%>			
			<section class="about-video-area section-gap">
			
				<div class="container">
					<div class="row">
						<div class="col-lg-6 about-video-left">
							<h6 class="text-uppercase">Latest video that needs your help</h6>
							<h1>
								�Y��ϴ� <br>
								�@�ɦ]�A���� 
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
	<%-- ���ܨ�M�� --%>	
	<section class="home-about-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 home-about-left">
							<img class="mx-auto d-block img-fluid" src="img/about-img.png" alt="">
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
			
			
	<%-- ���y���ذ� --%>		
				<section class="price-area section-gap">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">��ܾA�X�z�����ؤ��</h1>
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
									<h1>�G199.00</h1>
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
									<h1>�G299.00</h1>
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
									<h1>�G399.00</h1>
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
									<h1>�G499.00</h1>
									<a class="price-btn text-uppercase" href="#">Purchase</a>
								</div>								
							</div>
						</div>																		
					</div>
				</div>	
			</section>		







	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='addMembers.jsp'>Become a new member!!!</a>  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="mem.do" >
        <b>�ק�|�����</b><br>
        <b>��J�|���b�� :</b>
        <input type="text" name="memb_acc"> 
        <input type="hidden" name="action" value="updateFromClient">
        <input type="submit" value="�e�X">
    </FORM>
  </li>


</ul>
<%-- ���ʷӤ��� --%>
<center><h1>�x��s�@�ζ�</h1></center>
	<section class="gallery-area">
				<div class="container-fluid">
					<div class="row no-padding">
						<div class="active-gallery">
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="img/m1.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="img/m2.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="img/m3.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="img/m4.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="img/m5.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>	
							<div class="item single-gallery">
							    <div class="thumb">
							        <img src="img/g6.jpg" alt="" height="300px">
							        <div class="align-items-center justify-content-center d-flex">
							        </div>
							    </div>
							</div>								

						</div>
					</div>
				</div>	
			</section>



<%-- �ҪOscript --%>
<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
  			<script src="js/easing.min.js"></script>			
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.min.js"></script>	
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>	
			<script src="js/owl.carousel.min.js"></script>			
			<script src="js/jquery.sticky.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>				
			<script src="js/jquery.nice-select.min.js"></script>			
			<script src="js/parallax.min.js"></script>	
			<script src="js/waypoints.min.js"></script>
			<script src="js/jquery.counterup.min.js"></script>			
			<script src="js/mail-script.js"></script>	
			<script src="js/main.js"></script>
</body>




</html>