<%@page import="com.Adoption.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	AdoptionService adoptSvc = new AdoptionService();
	List<AdoptionVO> list = adoptSvc.getAll();
	pageContext.setAttribute("list", list);
%>


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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->

<style type="text/css">
p {
	　 font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

h4 {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}
</style>
</head>
<body>

	<jsp:include page="/index_Header.jsp"
		flush="true" />

	<section class="service-page-area section-gap ">
		<div class="container">
			



			<!-- 右邊 -->
			<div class="row">
				<%@ include file="page1.file"%>
				<c:forEach var="adoptionVO" items="${list}"
					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<div class="col-lg-4 col-md-6">
						<div class="single-service-page">
							<div class="thumbs relative">
								<div class="overlay-bg"></div>
								<img class="img-fluid"
									src="<%=request.getContextPath() %>/front-end/adopt/adoptImg.do?adopt_id=${adoptionVO.adopt_id }"
									alt="">
							</div>
							<div class="details">
								<h2>${adoptionVO.adopt_species}</h2>
								<p>
									<fmt:formatDate value="${adoptionVO.adopt_btime}"
										pattern="yyyy-MM-dd" />
								</p>
								<a href="<%=request.getContextPath()%>/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id=${adoptionVO.adopt_id}">
								<button type="button" class="genric-btn info-border circle">查看詳情</button>
								</a>
							</div>


						</div>
					</div>
				</c:forEach>

			</div>
			<%@ include file="page2.file"%>
		</div>
	</section>

</body>
</html>