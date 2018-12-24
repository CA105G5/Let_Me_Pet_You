<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
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
	<jsp:include page="/front-end/missingCase/missing_case_header.jsp"
		flush="true" />
	<!-- End banner Area -->

	<section class="training-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-md-9 pb-40 header-text text-center">
					<div id="carousel-id" class="carousel slide" data-ride="carousel">
						<!-- 幻燈片小圓點區 -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-id" data-slide-to="0" class=""></li>
							<li data-target="#carousel-id" data-slide-to="1" class=""></li>
							<li data-target="#carousel-id" data-slide-to="2" class="active"></li>
						</ol>
						<!-- 幻燈片主圖區 -->
						<div class="carousel-inner">
							<div class="item">
								<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
								<div class="container">
									<div class="carousel-caption">
										<h1>CSS可樂好喝超爽快</h1>
										<p>你喝過了嗎？</p>
										<p>
											<a class="btn btn-lg btn-primary" href="#" role="button">Sign
												up today</a>
										</p>
									</div>
								</div>
							</div>
							<div class="item">
								<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
								<div class="container">
									<div class="carousel-caption">
										<h1>CSS可樂的外掛真方便</h1>
										<p>你安裝了嗎？</p>
										<p>
											<a class="btn btn-lg btn-primary" href="#" role="button">更多</a>
										</p>
									</div>
								</div>
							</div>
							<div class="item active">
								<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
								<div class="container">
									<div class="carousel-caption">
										<h1>我是標題喔～自己改文案吧</h1>
										<p>我是內文喔，你可以把字打在這裡呦</p>
										<p>
											<a class="btn btn-lg btn-primary" href="#" role="button">詳細內容</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- 上下頁控制區 -->
						<a class="left carousel-control" href="#carousel-id"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-id"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
			</div>
			<!-- 左側邊 -->
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">失蹤案例總覽</a>
					<a href="addMissing.jsp" class="list-group-item ">失蹤案例新增</a>
				</div>
			</div>

			<!-- 右邊內容區 -->
 			<div class="col-xs-12 col-sm-9"> 
 				<p> 
 				<FORM METHOD="post" ACTION="miss.do"> 
					<div class="form-group">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<label style="color: red">${message}</label>
								</c:forEach>
							</ul>
						</c:if>
						<label>查詢案例編號(ex.S000000001)</label><br> <input type="text"
							name="missing_case_id"> <input type="hidden"
							name="action" value="getOne_For_Display">
						<button type="submit" class="btn btn-primary">送出</button>
					</div>
				</FORM>
				<jsp:useBean id="missingCaseSvc" scope="page"
 					class="com.missingCase.model.missingCaseService" /> 
				<FORM METHOD="post" ACTION="miss.do">
					<label>選擇案例編號</label> <select size="1" name="missing_case_id">
						<c:forEach var="missingCaseVO" items="${missingCaseSvc.all}">
							<option value="${missingCaseVO.missing_case_id}">${missingCaseVO.missing_case_id}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
				</FORM>
				<li><a href='addMissing.jsp'>新增失蹤案例</a></li>
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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