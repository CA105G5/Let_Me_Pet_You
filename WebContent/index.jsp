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
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
<title>浪我陪你-首頁</title>

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
		        <li data-target="#carousel-id" data-slide-to="3" class=""></li>
		    </ol>
		    <!-- 幻燈片主圖區 -->
		    <div class="carousel-inner">
		    	<div class="item active">
		        	<img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel5.png" alt="" style="width:2000px;height:850px">
<%-- 		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel3.jpg" alt=""> --%>
		            <div class="container">
		                
		            </div>
		        </div>
		        <div class="item">
<!-- 		        	<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt=""> -->
		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel6.jpg" alt="" style="width:2000px;height:850px"> 
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>Help~~~~~~</h1>
<!-- 		                    <p>請救救我...</p> -->
		                    <p><a class="btn btn-lg btn-primary" href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp" role="button">即刻救援</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel2.jpg" alt="" style="width:2000px;height:850px">
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
		        	<img src="<%=request.getContextPath()%>/horse_UI_template/img/carousel3.jpg" alt="" style="width:2000px;height:850px">
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
		
	
	
<%-- 鼓勵救援區 --%>			
			<section class="about-video-area section-gap">
			
				<div class="container">
					<div class="row">
						<div class="col-lg-6 about-video-left ">
<!-- 							<div align="center"><h4 class="text-uppercase" style="color:red;font-size:20px">讓愛發散</h4></div> -->
							<h1>
								即刻救援 <br>
								世界因你而變 
							</h1>
							<p>
								<span>伸出小小的手散發大大的愛</span>
							</p>
							<p>
								提供案例新增、加入救援、地圖導航、直播服務以提供最佳救援品質。
							</p>
							<a class="primary-btn" href="#">前往救援</a>
						</div>
						<div class="col-lg-6 justify-content-center align-items-center d-flex">
						<img class="img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/fish2.png" alt="" style="display:block;width: 100%;height:auto">
<%-- 							<a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid mx-auto" src="<%=request.getContextPath()%>/horse_UI_template/img/play.png" alt=""></a> --%>
						</div>
					</div>
				</div>	
			</section>
			
	<%-- 認養區 --%>	
	<section class="home-about-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 home-about-left">
							<img class="mx-auto d-block img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/adopt.jpg" alt="">
						</div>
						<div class="col-lg-6 home-about-right">
							<div class="col-lg-6">
<!-- 							<h6 class="text-uppercase">Brand new app to blow your mind</h6> -->
							<h1>帶我走~<br>
							到幸福的以後</h1>
							<p>
								<span>愛牠們請像家人一樣，不離不棄</span>
							</p>
<!-- 							<p> -->
<!-- 								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis. -->
<!-- 							</p> -->
							<p>
								認養須知及流程:<br>
								1.填寫申請表單<br>
								2.專人到府評估是否有能力照顧寵物<br>
								3.辦理認養手續<br>
								4.新飼主、寵物電腦資料登記<br>
								5.植入晶片/狂犬病疫苗<br>
								6.回新家<br>
							</p>
							<a class="primary-btn" href="#">前往認養</a>
							</div>
							<div class="col-lg-6">
							<br><br><br><br><br><br><br><br>
							<img class="mx-auto d-block img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/aaa.PNG" alt="" style="border-radius:50px;margin-top:10px">
							</div>
						</div>
						
					</div>
				</div>	
			</section>	
	<%-- 失蹤協尋區 --%>			
			<section class="about-video-area section-gap">
			
				<div class="container">
					<div class="row">
						<div class="col-lg-6 about-video-left ">
<!-- 							<h6 class="text-uppercase">Latest video that needs your help</h6> -->
							<h1>
								若有發現 <br>
								麻煩連絡失主
							</h1>
							<p>
								<span>流浪在外的寵物無法開心過生活，請幫助他們找到回家的路</span>
							</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis.
							</p>
							<a class="primary-btn" href="#">查看詳情</a>
						</div>
						<div class="col-lg-6 justify-content-center align-items-center d-flex">
						<img class="img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/white.jpg" alt="" style="display:block;width: 100%;height:auto">
<%-- 							<a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid mx-auto" src="<%=request.getContextPath()%>/horse_UI_template/img/play.png" alt=""></a> --%>
						</div>
					</div>
				</div>	
			</section>		
		<%-- 捐贈區 --%>	
	<section class="home-about-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 home-about-left">
							<img class="mx-auto d-block img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/donate.jpg" alt="">
						</div>
						<div class="col-lg-6 home-about-right">
<!-- 							<h6 class="text-uppercase">Brand new app to blow your mind</h6> -->
							<h1>些許捐贈 <br>
							讓愛永續傳遞</h1>
							<p>
								<span>伸出小小的手散發大大的愛</span>
							</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis.
							</p>
							<a class="primary-btn" href="#">查看詳情</a>
						</div>
					</div>
				</div>	
	</section>

			<%-- 商城區 --%>			
			<section class="about-video-area section-gap">
			
				<div class="container">
					<div class="row">
						<div class="col-lg-6 about-video-left ">
<!-- 							<h6 class="text-uppercase">Latest video that needs your help</h6> -->
							<h1>
								寵物商城<br>
								商品應有盡有 
							</h1>
							<p>
								<span>We are here to listen from you deliver exellence</span>
							</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.
							</p>
							<a class="primary-btn" href="#">查看詳情</a>
						</div>
						<div class="col-lg-6 justify-content-center align-items-center d-flex">
						<img class="img-fluid" src="<%=request.getContextPath()%>/horse_UI_template/img/shopcat.jpg" alt="" style="display:block;width: 100%;height:auto">
<%-- 							<a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid mx-auto" src="<%=request.getContextPath()%>/horse_UI_template/img/play.png" alt=""></a> --%>
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