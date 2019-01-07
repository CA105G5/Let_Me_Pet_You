<%@page import="java.util.List"%>
<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="row d-flex justify-content-center">
				<div class="pb-40 header-text text-center">
					<div id="carousel-id" class="carousel slide" data-ride="carousel">
						<!-- 幻燈片小圓點區 -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-id" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-id" data-slide-to="1" class=""></li>
						</ol>
						<!-- 幻燈片主圖區 -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt=""
									id="hello">
								<div class="container">
									<div class="carousel-caption"></div>
								</div>
							</div>
							<div class="item">
								<img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
								<div class="container">
									<div class="carousel-caption"></div>
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

			<!-- 右邊 -->
			<div class="row">
				<%@ include file="page1.file"%>
				<c:forEach var="missingCaseVO" items="${list}"
					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<div class="col-lg-4 col-md-6">
						<div class="single-service-page">
							<div class="thumbs relative">
								<div class="overlay-bg"></div>
								<img class="img-fluid"
									src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"
									alt="">
							</div>
							<div class="details">
								<h2>${missingCaseVO.missing_name}</h2>
								<p>
									<fmt:formatDate value="${missingCaseVO.missing_date}"
										pattern="yyyy-MM-dd" />
								</p>
								<a
									href="<%=request.getContextPath()%>/front-end/missingCase/miss.do?action=getOne_For_Display&missing_case_id=${missingCaseVO.missing_case_id}"
									class="genric-btn info-border circle">查看詳情</a>
							</div>

							<!-- 					<FORM METHOD="post" -->
							<%-- 						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do" --%>
							<!-- 						style="margin-bottom: 0px;"> -->
							<!-- 						<button type="submit" class="btn btn-primary">修改</button><input type="hidden" -->
							<%-- 							name="missing_case_id" value="${missingCaseVO.missing_case_id}"> --%>
							<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
							<!-- 					</FORM> -->
							<!-- 					<FORM METHOD="post" -->
							<%-- 						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do" --%>
							<!-- 						style="margin-bottom: 0px;"> -->
							<!-- 						<input type="hidden" name="missing_case_id" -->
							<%-- 							value="${missingCaseVO.missing_case_id}"> <input --%>
							<!-- 							type="hidden" name="action" value="delete"> -->
							<!-- 								<button type="submit" class="btn btn-primary">刪除</button> -->
							<!-- 					</FORM>		 -->

						</div>
					</div>
				</c:forEach>

			</div>
			<%@ include file="page2.file"%>
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



</body>
</html>