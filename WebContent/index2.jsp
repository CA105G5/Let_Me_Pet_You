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
  .carousel-fade .carousel-inner .item{  
    opacity:0;  
    -webkit-transition-property:opacity ;  
    -moz-transition-property:opacity ;  
    -ms-transition-property:opacity ;  
    -o-transition-property:opacity ;  
    transition-property:opacity ;
}
.carousel-fade .carousel-inner .active{  
    opacity: 1;
}
.carousel-fade .carousel-inner .active.left,.carousel-fade .carousel-inner .active.right{  
    left: 0;  
    opacity: 0;
}
.carousel-fade .carousel-inner .next.left,.carousel-fade .carousel-inner .prev.right {
    opacity: 1;
}
</style>
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
</head>
<body bgcolor='white'>




<!-- Start WOWSlider.com BODY section -->
<div id="wowslider-container1">
<div class="ws_images"><ul>
		<li><img src="data1/images/big6.jpg" alt="big6" title="big6" id="wows1_0"/></li>
		<li><img src="data1/images/big2.jpg" alt="big2" title="big2" id="wows1_1"/></li>
		<li><img src="data1/images/big3.jpg" alt="big3" title="big3" id="wows1_2"/></li>
		<li><a href="http://wowslider.net"><img src="data1/images/big7.jpg" alt="html slider" title="big7" id="wows1_3"/></a></li>
		<li><img src="data1/images/big8.jpg" alt="big8" title="big8" id="wows1_4"/></li>
	</ul></div>
	<div class="ws_bullets"><div>
		<a href="#" title="big6"><span><img src="data1/tooltips/big6.jpg" alt="big6"/>1</span></a>
		<a href="#" title="big2"><span><img src="data1/tooltips/big2.jpg" alt="big2"/>2</span></a>
		<a href="#" title="big3"><span><img src="data1/tooltips/big3.jpg" alt="big3"/>3</span></a>
		<a href="#" title="big7"><span><img src="data1/tooltips/big7.jpg" alt="big7"/>4</span></a>
		<a href="#" title="big8"><span><img src="data1/tooltips/big8.jpg" alt="big8"/>5</span></a>
	</div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.net">javascript slideshow</a> by WOWSlider.com v8.8</div>
<div class="ws_shadow"></div>
</div>	
<script type="text/javascript" src="engine1/wowslider.js"></script>
<script type="text/javascript" src="engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->




 
		
	
	
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
							<a class="primary-btn" href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">前往救援</a>
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
								2.專人評估是否有能力照顧寵物<br>
								3.辦理認養手續<br>
								4.新飼主、寵物電腦資料登記<br>
								5.植入晶片/狂犬病疫苗<br>
								6.回新家<br>
							</p>
							<a class="primary-btn" href="<%=request.getContextPath()%>/front-end/adopt/listAllAdopt.jsp">前往認養</a>
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
<!-- 							<p> -->
<!-- 								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis. -->
<!-- 							</p> -->
							<p>
								在合法的寵物登記站施打晶片後，寵物的資訊就會登錄到政府的寵物管理系統中。如果狗狗散步時遺失被別人拾獲而帶去獸醫院，或是被捕狗大隊帶往收容所時，都可以經過晶片的掃描後，找到飼主的資訊，讓狗狗能重回主人懷抱。但是如果狗狗身上沒晶片，那在法律上牠就是沒有飼主的狗，撿獲的人可以自己登記成為牠的主人。同樣地，被帶往收容所的話，超過公告時間而未被認養者，也許會難逃安樂死的命運。
							</p>
							<a class="primary-btn" href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp">失蹤詳情</a>
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
<!-- 							<p> -->
<!-- 								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis. -->
<!-- 							</p> -->
							<p>
								物資捐贈與捐款並不盡然相同，物資並非「越多越好」。物資有其限制，物件的規格、尺寸都會影響與單位需求的貼合程度。舉例來說，市面上的筆記型電腦型號多不勝數，單位的用途可能是行政文書、辦活動、教學等，若資訊不夠完整透明，就很有可能造成錯捐與過剩。物資也有其即時性，受捐單位服務的案家若發生突發狀況，有較為緊急的需求，來不及上網公告或申請公益勸募，就必須臨時召募。此時若社福單位未於收受捐物結束後即時更新募捐資訊，就可能發生物資大量湧入的狀況。
							</p>
							<div align="right"><a class="primary-btn" href="<%=request.getContextPath()%>/front-end/donate/don_Main.jsp">捐贈詳情</a></div>
							
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
								<span>您的寵物也非常樂意在此逛逛</span>
							</p>
<!-- 							<p> -->
<!-- 								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua. -->
<!-- 							</p> -->
							<p>
								寵物商城內的商品皆來自愛心人士的捐贈，內含貓、狗、飛禽及其他寵物類型的食衣住行育樂，商品應有盡有，在商城內購物皆須使用愛心幣。您可以透過動物救援、捐贈物資以及捐款來獲得愛心幣。寵物商城內的商品皆來自愛心人士的捐贈，內含貓、狗、飛禽及其他寵物類型的食衣住行育樂，商品應有盡有，在商城內購物皆須使用愛心幣。您可以透過動物救援、捐贈物資以及捐款來獲得愛心幣。寵物商城內的商品皆來自愛心人士的捐贈，內含貓、狗、飛禽及其他寵物類型的食衣住行育樂，商品應有盡有，在商城內購物皆須使用愛心幣。您可以透過動物救援、捐贈物資以及捐款來獲得愛心幣。寵物商城內的商品皆來自愛心人士的捐贈，內含貓、狗、飛禽及其他寵物類型的食衣住行育樂，商品應有盡有，在商城內購物皆須使用愛心幣。您可以透過動物救援、捐贈物資以及捐款來獲得愛心幣。
							</p>
							<a class="primary-btn" href="<%=request.getContextPath()%>/front-end/product/listAllProd.jsp">商城購物</a>
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