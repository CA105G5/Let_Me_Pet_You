<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%  
	Map<String, String[]> map = (Map<String, String[]>) request.getAttribute("map");
	String[] prod_ani_type_id = null;
	String[] prod_type_id = null;
	String prod_price = null;
	
	if (map!=null){
		Set<String> keys = map.keySet();
		if (keys.contains("prod_ani_type_id")){
			prod_ani_type_id = map.get("prod_ani_type_id");
			System.out.println("prod_ani_type_id:");
		}
		if (keys.contains("prod_type_id")){
			prod_type_id = map.get("prod_type_id");
		}
		if (keys.contains("prod_price")){
			prod_price = map.get("prod_price")[0];
		}
	}
	
	
	
	%>
	
	
	
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
<title>浪我陪你</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
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

<!--  購物車流程圖麵包屑  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/ord/css/style.css"> 

<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>


<style type="text/css">
	p {
		　 font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
	}
	
	div {
		font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
	}
	
/* 	購物車icon */
#cart-container {
  float: right;
  width: 100px;
  position: relative;
}

#itemCount {
  position: absolute;
  display: none;
  top: -10px;
  left: -10px;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: red;
  color: white;
  text-align: center;
}

i.fa-shopping-cart:hover {
  cursor: pointer;
}
	
/* 購物車流程圖麵包屑 */
	
</style>
</head>
<body>

	<header id="header" id="home" height="100">
		<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-3 col-sm-3 menu-top-left col-sm-offset-1">
					<a href="<%=request.getContextPath()%>/index.jsp"> <img 
						src="<%=request.getContextPath()%>/horse_UI_template/img/logo2.png" width="250" alt="">
					</a>
				</div>

				<div class="col-lg-7 col-sm-7" > 
					<nav style="width:400px">
						<ol class="cd-multi-steps text-bottom count">
							<li class="current">
								<a href="<%=request.getContextPath()%>/prodcart.do?action=check_Cart" style="text-decoration: none;">
									確認購物車
								</a>
							</li>
							<li class="" id="step_info"><a>填收件資料</a></li>
							<li class="" id="step_finish"><em>完成訂購</em></li>
						</ol>
					</nav>
				</div>

				<div class="col-lg-3 col-sm-3">
<!-- 					<div class="row"> -->
<!-- 						<div id="cart-container" class="col-lg-1 col-sm-1"> -->
<%-- 						      <a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp"><i class="fa fa-shopping-cart fa-1x" aria-hidden="true"></i></a> --%>
<!-- 						      <span id="itemCount"></span> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-11 col-sm-11 menu-top-right"> -->
<!-- 							<a class="tel">會員登入/ 註冊</a>  -->
<!-- 							<a href="#"><span class="fa fa-user"></span></a> -->
<!-- 							style="font-size: 1.5rem;" -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		<hr>
		
		
		<div class="container">
			<div class="row">
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
	
	
<!-- 	購物車 -->
<script>
// 	var itemCount = 0;
	
// 	$('#cartBtn').click(function (){
// 	  itemCount ++;
// 	  $('#itemCount').html(itemCount).css('display', 'block');
// 	}); 
	
</script>

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
</body>
</html>



