<%@page import="java.util.List"%>
<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	missingCaseService missingCaseSvc = new missingCaseService();
	List<missingCaseVO> list = missingCaseSvc.getAll();
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
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
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

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body>

	<jsp:include page="/front-end/missingCase/missing_case_header.jsp"
		flush="true" />

	<section class="service-page-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">失蹤案例瀏覽</h1>
					<p>hello.</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-3">
				<div class="list-group">
					<a href="listAllMissingCase.jsp" class="list-group-item ">失蹤案例總覽</a>
					<a href="addMissing.jsp" class="list-group-item ">失蹤案例新增</a>
				</div>
			</div>
			<div class="row">
				<c:forEach var="missingCaseVO" items="${list}">
					<div class="col-lg-4 col-md-6">
						<div class="single-training">
							<div class="thumbs relative">
								<div class="overlay-bg"></div>
								<img class="img-fluid"
									src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"
									alt="">
							</div>
							<div class="details">
								<a href="#">${missingCaseVO.missing_name}</a>
								<p>${missingCaseVO.missing_des}</p>
							</div>
							
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						style="margin-bottom: 0px;">
						<button type="submit" class="btn btn-primary">修改</button><input type="hidden"
							name="missing_case_id" value="${missingCaseVO.missing_case_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="missing_case_id"
							value="${missingCaseVO.missing_case_id}"> <input
							type="hidden" name="action" value="delete">
								<button type="submit" class="btn btn-primary">刪除</button>
					</FORM>		
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
<%-- 
	<table>
		<tr>
			<th>案例編號</th>
			<th>會員編號</th>
			<th>失蹤日期</th>
			<th>失蹤內容描述</th>
			<th>失蹤動物名稱</th>
			<th>失蹤地點</th>
			<th>失蹤案例上架狀態</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="missingCaseVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${missingCaseVO.missing_case_id}</td>
				<td>${missingCaseVO.memb_id}</td>
				<td>${missingCaseVO.missing_date}</td>
				<td>${missingCaseVO.missing_des}</td>
				<td>${missingCaseVO.missing_name}</td>
				<td>${missingCaseVO.missing_loc}</td>
				<td><img
					src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"></td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="missing_case_id" value="${missingCaseVO.missing_case_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="missing_case_id"
							value="${missingCaseVO.missing_case_id}"> <input
							type="hidden" name="action" value="delete"> <input
							type="submit" value="刪除">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

--%>




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