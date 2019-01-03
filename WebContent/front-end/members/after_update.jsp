<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MemVO memVO = (MemVO) session.getAttribute("memVO"); //MemServlet.java(Concroller), 存入req的memVO物件
%>

<html> 
<head>

<%-- Mobile Specific Meta --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<title>會員資料 - listOneMember.jsp</title>

<%-- 放自己css前 --%>
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
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
	width: 600px;
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
<body bgcolor='white'>
<jsp:include page="/front-end/members/member_header.jsp" flush="true" />
<!-- <header id="header" id="home"> -->
<!-- 				<div class="container"> -->
<!-- 			<div class="row header-top align-items-center"> -->
<!-- 				<div class="col-lg-4 col-sm-4 menu-top-left"> -->
<%-- 					<a href="<%=request.getContextPath()%>/index.jsp"> <img class="img-fluid" --%>
<!-- 						src="images/logo2.png" width="200" alt=""> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-4 menu-top-middle justify-content-center d-flex"> -->
<!-- 					<div class="input-group"> -->
<!-- 						<input type="text" class="form-control" placeholder="請輸入關鍵字"> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-info" type="button"> -->
<!-- 								<i class="glyphicon glyphicon-search"></i> -->
<!-- 							</button> -->
<!-- 						</span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-4 col-sm-4 menu-top-right"> -->
<!-- 				<a href="#"><img style="width:40px;height:40px" class="img-fluid" src="images/login.jpg" data-toggle="tooltip" data-placement="left" title="登入/註冊"></a> -->
					
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<!-- 			    <div class="container"> -->
<!-- 			<div class="row align-items-center justify-content-center d-flex"> -->
<!-- 				<nav id="nav-menu-container"> -->
<!-- 					<ul class="nav-menu"> -->
<%-- 						<li><a href="<%=request.getContextPath()%>/index.jsp">首頁</a></li> --%>
<!-- 						<li><a href="about.html">救援</a></li> -->
<!-- 						<li><a href="service.html">認養</a></li> -->
<!-- 						<li><a href="training.html">失蹤</a></li> -->
<!-- 						<li><a href="events.html">協尋</a></li> -->
<!-- 						<li><a href="pricing.html">捐贈</a> -->
<!-- 							<ul> -->
<!-- 								<li><a href="blog-home.html">愛心捐款</a></li> -->
<!-- 								<li><a href="blog-single.html">愛心物資捐贈</a></li> -->
<!-- 								<li><a href="blog-single.html">許願物資捐贈</a></li> -->
<!-- 							</ul></li> -->
<!-- 						<li class="menu-has-children menu-active"><a href="">商城</a></li> -->
<!-- 						<li><a href="contact.html">關於我們</a></li> -->
<!-- 						<li><a href="elements.html">常見問題</a></li> -->
<!-- 					</ul> -->
<!-- 				</nav> -->
<%-- 				#nav-menu-container --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 			  </header>#header -->



<br><br><br><br><br><br><br><br><br>

<div class="container">
			<div class="h1"></div>
			
			<div class="page-header">
			  <h1 align="center">請確認會員資料</h1>
			</div>

<table class="table table-bordered table-striped table-hover table-condensed">
	<tr><td>會員帳號</td><td><%=memVO.getMemb_acc()%></td></tr>
	<tr><td>會員密碼</td><td><%=memVO.getMemb_psw()%></td></tr>
	<tr><td>會員姓名</td><td><%=memVO.getMemb_name()%></td></tr>
	<tr><td>會員暱稱</td><td><%=memVO.getMemb_nick()%></td></tr>
	<tr><td>會員Email</td><td><%=memVO.getMemb_email()%></td></tr>
	<tr><td>會員手機</td><td><%=memVO.getMemb_cellphone()%></td></tr>
	<tr><td>會員性別</td><td><% if ("M".equals(memVO.getMemb_gender())){out.println("男");}else if ("F".equals(memVO.getMemb_gender())){out.println("女");}else{out.println("未填");};%></td></tr>
	<tr><td>信用卡類型</td><td><%=memVO.getMemb_cre_type()%></td></tr>
	<tr><td>持卡人</td><td><%=memVO.getMemb_cre_name()%></td></tr>
	<tr><td>信用卡到期年</td><td><%=memVO.getMemb_cre_year()%></td></tr>
	<tr><td>信用卡到期月</td><td><%=memVO.getMemb_cre_month()%></td></tr>
	<tr><td>會員照片</td><td><img src="<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=${memVO.memb_id}"/></td></tr>
</table>
<div align="center"><a href="<%=request.getContextPath()%>/front-end/members/client_update.jsp">重新修改資料</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/index.jsp">回首頁</a></div>
</div>

<%-- 模板後script 加在自己的script前--%>
<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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

<%-- RWD--%>
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

</body>
</html>