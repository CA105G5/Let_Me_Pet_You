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
<header id="header" id="home">
				<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-3 col-sm-3 menu-top-left">
					<a href="<%=request.getContextPath()%>/index.jsp"> <img class="img-fluid"
						src="<%=request.getContextPath()%>/images/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-6 menu-top-middle justify-content-center d-flex">
					<div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="<%=request.getContextPath()%>/index.jsp">首頁</a></li>
						<li><a href="<%=request.getContextPath()%>/index.jsp">會員</a>
							<ul>
								    	<li><a href="<%=request.getContextPath()%>/front-end/members/listOneMember.jsp">查看會員資料</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/pet/pet.do?action=select_pet">查看我的寵物資料</a></li>
								        <li><a href="<%=request.getContextPath()%>/index.jsp">查看我的救援案例</a></li>
								        <li><a href="<%=request.getContextPath()%>/index.jsp">查看我的認養案例</a></li>
								        <li><a href="<%=request.getContextPath()%>/index.jsp">查看我的失蹤寵物</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/donate/listAllProdDon.jsp">查看我的捐贈紀錄</a></li>
										<li><a href="<%=request.getContextPath()%>/front-end/ord/listAllOrd.jsp">我的訂單管理</a></li>
							</ul>
						
						</li>
						<li><a href="about.html">救援</a></li>
						<li><a href="service.html">認養</a></li>
						<li><a href="training.html">失蹤</a>
						     <ul>
								<li><a href="<%=request.getContextPath()%>/front-end/missingCase/addMissing.jsp">新增失蹤案例</a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp">失蹤案例瀏覽</a></li>
							</ul>
						</li>
						
						<li class="menu-has-children"><a href="<%=request.getContextPath()%>/front-end/donate/don_Main.jsp">捐贈</a>
							      	<ul>
								    	<li><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心捐款</a></li>
								        <li><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心商品捐贈</a></li>
								    </ul>
						</li>
						<li class="menu-has-children menu-active"><a href="<%=request.getContextPath()%>/front-end/product/listAllProd.jsp">商城</a></li>
<!-- 						<li><a href="contact.html">關於我們</a></li> -->
<!-- 						<li><a href="elements.html">常見問題</a></li> -->
					</ul>
				</nav>
				
						</div>
					</div>
				</div>
				
				
				<div class="col-lg-3 col-sm-3">
					<div class="row">
						<div id="cart-container" class="col-lg-1 col-sm-1">
							<a id="cart_icon"><i class="fa fa-shopping-cart fa-1x" aria-hidden="true"></i></a>
							<span id="itemCount"></span>
						</div>
						<div class="col-lg-11 col-sm-11 menu-top-right">
							<% if(memVO == null){ %>
							<a href="<%=request.getContextPath()%>/front-end/members/login.jsp"><img style="width:40px;height:40px" class="img-fluid" src="<%=request.getContextPath()%>/images/login.jpg" data-toggle="tooltip" data-placement="left" title="登入/註冊">登入/註冊</a>
							<%}else{ %>
							<div align="center">
								<a href="<%=request.getContextPath()%>/front-end/members/listAllNtfs.jsp"><i class="fa fa-bell"></i></a>
								
								<%
 									out.print(memVO.getMemb_nick()+"，你好");
								%>
								<a href="<%=request.getContextPath()%>/front-end/members/mem.do?action=logout"><img style="width:40px;height:40px" class="img-fluid" src="<%=request.getContextPath()%>/images/logout.png" data-toggle="tooltip" data-placement="left" title="登出">登出</a><br>
								
								<a href="<%=request.getContextPath()%>/front-end/members/cur_dt.jsp">愛心幣餘額</a>
								<% out.print("尚有:    "+memVO.getMemb_balance()+"元");}%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
			    
			  </header>



<br><br><br><br><br><br><br><br><br>

<div class="container">
			<div class="h1"></div>
			
			<div class="page-header">
			  <h1 align="center">會員資料</h1>
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
<div align="center"><a href="<%=request.getContextPath()%>/front-end/members/client_update.jsp">修改資料</a></div>
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

<%-- <%-- RWD--%> --%>
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

</body>
</html>