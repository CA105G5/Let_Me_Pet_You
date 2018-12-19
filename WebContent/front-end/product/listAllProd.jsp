<%@page import="com.prodimg.model.ProdImgService"%>
<%@page import="com.prodimg.model.ProdImgVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	List<ProdVO> list;
	list = (List) request.getAttribute("list");
	if (list==null){
		ProdService prodSvc = new ProdService(); 
		list = prodSvc.getAll();
		pageContext.setAttribute("list", list);
	}
%>

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

	<jsp:include page="/front-end/product/prod_list_Header.jsp" flush="true" />

	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on"
				style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-3 cl-md-3" style="top: 180px; bottom: auto;"></div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-9">
						<div class="row">
							<c:forEach var="prodVO" items="${list}">
<%-- 								<c:if test="${prodVO.prod_status == '上架'}" var="condition" scope="page"> --%>
									<div class="col-lg-3 cl-md-3">
										<div class="single-training">
											<div class="thumb relative">
												<div class="overlay-bg"></div>
												<img class="img-fluid"
													src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}"
													alt="">
												<!-- 												<a class="admission-btn" href="#">Admission	Going on</a> -->
											</div>
											<div class="details">
												<div class="title justify-content-between d-flex">
													<a href="<%=request.getContextPath()%>/prod/prod.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}"><h5>${prodVO.prod_name}</h5></a>
													<p class="price">$${prodVO.prod_price}</p>
												</div>
											</div>
										</div>
									</div>
<%-- 								</c:if> --%>
							</c:forEach>
						</div>
					</div>

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


