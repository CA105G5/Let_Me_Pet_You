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
<title>失蹤案例瀏覽</title>

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
<script src="../static/js/admin/bootstrap-notify.min.js"></script>
<script language="javascript" type="text/javascript" src="../_Script/ENRF/App/jquery.1.11.1.js"></script>
<script language="javascript" type="text/javascript" src="../_Script/ENRF/App/jquery.easing.1.3.min.js"></script>
<link href="../static/css/login/animate.css" rel="stylesheet" />

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
<body onload="connect();" onunload="disconnect();">

	<jsp:include page="/index_Header.jsp"
		flush="true" />
		<div class="row d-flex justify-content-center" style="background-image: url(https://www.i-adopt.com.tw/frontend/images/banner/adopt.jpg); height: 250px;width: 1900px;margin-left: 7.5px;margin-right: 0px;">
				<div class="col-md-9 pb-40 header-text text-center" style="margin-top: 100px;">
						<h1 class="pb-10"> 寵物失蹤</h1>
				</div>
			</div>
	<section class="service-page-area section-gap ">
		
		<div class="container">
			<!-- 右邊 -->
			<div>
			<label style="font-size:x-large;">請輸入查詢條件</label>
			<form method="post"	action="<%=request.getContextPath()%>/front-end/missingCase/miss.do">
			<label><input type="radio" name="missing_type" value="狗"><span>狗</span></label>
			<label><input type="radio" name="missing_type" value="貓"><span>貓</span></label>
			<label><input type="radio" name="missing_type" value="其他"><span>其他</span></label>
			<input type="hidden" name="action" value="listEmps_ByCompositeQuery">
			<button class="genric-btn info small" type="submit" >送出查詢</button>
			</form>
			</div>
			<div align="right"><a href="test.jsp" class="genric-btn info circle arrow">寵物種類統計<span class="lnr lnr-arrow-right"></span></a></div>
			<br>
			<div class="row">
				<%@ include file="page1.file"%>
				<c:forEach var="missingCaseVO" items="${list}"
					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<div class="col-lg-4 col-md-6">
						<div class="single-service-page">
							<div class="thumbs relative">
								<div class="overlay-bg"></div>
								<img class="img" width="350" height="240"
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
<script>
var MyPoint = "/missingCaseEchoServer";
var host = window.location.host;
var path = window.location.pathname;
var webCtx = path.substring(0, path.indexOf('/', 1));
var endPointURL = "wss://" + window.location.host + webCtx + MyPoint;
console.log("endPointURL="+endPointURL);

var webSocket;

function connect() {
	// 建立 websocket 物件
	webSocket = new WebSocket(endPointURL);
	console.log("websocket已連線");
	
	webSocket.onopen = function(event) {

	};

	webSocket.onmessage = function(event) {
		
		 var jsonObj = JSON.parse(event.data);
		 var missing_url = jsonObj.missing_url;
		console.log("missing_url"+missing_url);
		
	};

	webSocket.onclose = function(event) {
		
	};
}


function disconnect () {
	webSocket.close();
}


$("ul.nav-menu li").attr('class', "" );
$("#missing").attr('class', 'menu-active menu-has-children' )


</script>


</body>
</html>