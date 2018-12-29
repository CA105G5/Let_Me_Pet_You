<%@page import="java.sql.Timestamp"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="java.util.List"%>
<%@page import="com.missingMsg.model.*"%>
<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");
	String missing_case_id = request.getParameter("missing_case_id");
	missingMsgService missingMsgSvc = new missingMsgService();
	List<missingMsgVO> list = missingMsgSvc.findByCase(missing_case_id);
	pageContext.setAttribute("list", list);
	
	MemVO membVO = (MemVO)session.getAttribute("memVO");
	Timestamp missing_msg_date = new Timestamp(System.currentTimeMillis()); 
	System.out.println(request.getServletPath());
%>
<html>
<head>
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
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">

</head>
<body>

	<jsp:include page="/front-end/missingCase/missing_case_header.jsp"
		flush="true" />

	<!-- End banner Area -->
	<section class="blog-posts-area section-gap">
		<div class="container" style="top: 180px">
			<div class="row d-flex justify-content-center">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10"></h1>
					<p>Who are in extremely love with eco friendly system.</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">失蹤案例總覽</a>
					<a href="addMissing.jsp" class="list-group-item ">失蹤案例新增</a>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 post-list blog-post-list">
						<div class="single-post">
							<img class="img-fluid"
								src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id}"
								alt="">
							<ul class="tags">
								<li><a href="#"><fmt:formatDate
											value="${missingCaseVO.missing_date}" pattern="yyyy-MM-dd" /></a></li>
							</ul>
							<a href="#">
								<h3>${missingCaseVO.missing_name}</h3>
							</a>
							<div class="content-wrap">
								<p>${missingCaseVO.missing_des}</p>
							</div>
						</div>
						<section class="nav-area pt-50 pb-100"
							style="padding-top: 50px; padding-bottom: 50px;">
							<div class="row justify-content-between">
								<div class="col-sm-12 nav-right justify-content-end d-flex">
									<div class="post-details">
										<p>連絡失主</p>
										<h4 class="text-uppercase">
											<a href="#">失蹤的人</a>
										</h4>
									</div>
									<div class="thumb">
										<img src="img/blog/next.jpg" alt="">
									</div>
								</div>
							</div>

						</section>
						<div class="comment-sec-area">
							<h3 class="text-uppercase" style="color: red">留言區</h3>
							<br>
							<h4 class="pb50">Leave a Reply...</h4>
							
							
							<form action="<%=request.getContextPath() %>/front-end/missingMsg/missingMsg.do" method="post">
							<textarea class="form-control mb-10" name="missing_msg_cont"
								placeholder="Messege" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Messege'"></textarea>
							<input type="hidden" name="memb_id" value="<%=membVO.getMemb_id()%>">
							<input type="hidden" name="missing_case_id" value="<%=request.getParameter("missing_case_id")%>">
							<input type="hidden" name="missing_msg_date" value="<%=missing_msg_date%>">
							<input type="hidden" name="action" value="insert">
							<input type="submit" class="genric-btn danger circle arrow col-offset-md-6"
								style="margin-left: 731px" value="送出">
							
							</form>
							
							
							<c:forEach var="missingMsgVO" items="${list}">
								<div class="comment-list">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="img/blog/c1.jpg" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">
													<fmt:formatDate value="${missingMsgVO.missing_msg_date}"
														pattern="yyyy-MM-dd" />
												</p>
												<p class="comment">${missingMsgVO.missing_msg_cont}</p>
											</div>
										</div>
										<div class="reply-btn">
											<a href="#" class="genric-btn primary-border small"
												style="margin-top: 20px">檢舉</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/hoverIntent.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/superfish.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.ajaxchimp.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.magnific-popup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.sticky.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.nice-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/parallax.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.counterup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/mail-script.js"></script>
	<script
		src="<%=request.getContextPath()%>/horse_UI_template/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>