<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>

<% missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");%>
<html>
<head>
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
		<title>Horse Club</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">

</head>
<body>

<jsp:include page="/front-end/missingCase/missing_case_header.jsp" flush="true" />

			<!-- End banner Area -->	
			<section class="upcoming-event-area section-gap">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-md-9 pb-40 header-text text-center">
								<h1 class="pb-10">Checkout Your Pet</h1>
								<p>
									Who are in extremely love with eco friendly system.
								</p>
							</div>
						</div>
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">���ܮר��`��</a>
					<a href="addMissing.jsp" class="list-group-item ">���ܮרҷs�W</a>
				</div>
			</div>							
		<div class="row align-items-center upcoming-wrap">
							<div class="col-sm-6 upcoming-left">
								<img class="img-fluid" src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id}" alt="">
							</div>
							<div class="col-sm-6 upcoming-right">
								<p class="meta">
									<span>${missingCaseVO.missing_name}</span>
									${missingCaseVO.missing_date}
								</p>
								<p>
									${missingCaseVO.missing_des}
								</p>
								<a class="genric-btn primary small" href="#">�ڭn���|</a>
							</div>
							<div class="row flex-column">
                                        <h5 class="text-uppercase pb-80">05 Comments</h5>
                                        <div class="comment-list comment-sec-area">
                                            <div class="single-comment justify-content-between d-flex">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="img/blog/c1.jpg" alt="">
                                                    </div>
                                                    <div class="desc">
                                                        <h5><a href="#">Emilly Blunt</a></h5>
                                                        <p class="date">December 4, 2017 at 3:12 pm </p>
                                                        <p class="comment">
                                                            Never say goodbye till the end comes!
                                                        </p>
                                                    </div>
                                                </div> 
                                                <div class="reply-btn small">
                                                       <a href="" class="btn-danger text-uppercase">���|</a> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-list comment-sec-area">
                                            <div class="single-comment justify-content-between d-flex">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="img/blog/c4.jpg" alt="">
                                                    </div>
                                                    <div class="desc">
                                                        <h5><a href="#">Emilly Blunt</a></h5>
                                                        <p class="date">December 4, 2017 at 3:12 pm </p>
                                                        <p class="comment">
                                                            Never say goodbye till the end comes!
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="reply-btn">
                                                       <a href="" class="btn-reply text-uppercase">reply</a> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-list comment-sec-area">
                                            <div class="single-comment justify-content-between d-flex">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="img/blog/c5.jpg" alt="">
                                                    </div>
                                                    <div class="desc">
                                                        <h5><a href="#">Emilly Blunt</a></h5>
                                                        <p class="date">December 4, 2017 at 3:12 pm </p>
                                                        <p class="comment">
                                                            Never say goodbye till the end comes!
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="reply-btn">
                                                       <a href="" class="btn-reply text-uppercase">reply</a> 
                                                </div>
                                            </div>
                                        </div>                                                                                                                                                                
                                    </div>
						</div>
					</div>
				</section>

	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>