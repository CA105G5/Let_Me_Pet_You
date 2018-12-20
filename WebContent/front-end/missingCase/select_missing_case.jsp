<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/linearicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/owl.carousel.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<!-- �Y�n�ϥ�fai�����~��icon�A�nimport CDN�A�ֱ���facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ �ۤv��css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">

<style type="text/css">
p {
	�@ font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
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

	<div class="container">
		<div class="row">
			<!-- ������ -->
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">���ܮר��`��</a>
					<a href="addMissing.jsp" class="list-group-item ">���ܮרҷs�W</a>
				</div>
			</div>

			<!-- �k�䤺�e�� -->
			<div class="col-xs-12 col-sm-9">
				<p>
				<FORM METHOD="post" ACTION="miss.do">
					<div class="form-group">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">�Эץ��H�U���~:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<label style="color: red">${message}</label>
								</c:forEach>
							</ul>
						</c:if>
						<label>�d�߮רҽs��(ex.S000000001)</label><br> <input type="text"
							name="missing_case_id"> <input type="hidden"
							name="action" value="getOne_For_Display">
						<button type="submit" class="btn btn-primary">�e�X</button>
					</div>
				</FORM>
				<jsp:useBean id="missingCaseSvc" scope="page"
					class="com.missingCase.model.missingCaseService" />
				<FORM METHOD="post" ACTION="miss.do">
					<label>��ܮרҽs��</label> <select size="1" name="missing_case_id">
						<c:forEach var="missingCaseVO" items="${missingCaseSvc.all}">
							<option value="${missingCaseVO.missing_case_id}">${missingCaseVO.missing_case_id}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="�e�X">
				</FORM>
				<li><a href='addMissing.jsp'>�s�W���ܮר�</a></li>



			</div>
		</div>
	</div>



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