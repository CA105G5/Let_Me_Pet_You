<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>

<% missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");%>
<html>
<head>
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
		<title>Horse Club</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
<title>���u��� - listOneEmp.jsp</title>

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
<body>
	<header id="header" id="home">
		<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-4 col-sm-4 menu-top-left">
					<a href="index.html"> <img class="img-fluid"
						src="img/logo2.png" width="200" alt="">
					</a>
				</div>
				<div class="col-lg-4 menu-top-middle justify-content-center d-flex">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="�п�J����r">
						<span class="input-group-btn">
							<button class="btn btn-info" type="button">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="col-lg-4 col-sm-4 menu-top-right">
					<a class="tel">�|���n�J/ ���U</a> <a href="#"><span
						class="fa fa-user"></span></a>
					<!-- style="font-size: 1.5rem;" -->
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.html">����</a></li>
						<li><a href="about.html">�ϴ�</a></li>
						<li><a href="service.html">�{�i</a></li>
						<li class="menu-has-children"><a href="training.html">����</a>
							<ul>	
								<li><a href="listAllMissingCase.jsp">�d�ݮרҸԱ�</a></li>
								<li><a href="addMissingCase.jsp">�s�W���ܮר�</a></li>
							</ul></li>
						<li><a href="events.html">��M</a></li>
						<li><a href="pricing.html">����</a>
							<ul>
								<li><a href="blog-home.html">�R�߮���</a></li>
								<li><a href="blog-single.html">�R�ߪ��ꮽ��</a></li>
								<li><a href="blog-single.html">�\�@���ꮽ��</a></li>
							</ul></li>
						<li class="menu-has-children menu-active"><a href="">�ӫ�</a></li>
						<li><a href="contact.html">����ڭ�</a></li>
						<li><a href="elements.html">�`�����D</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- start banner Area -->
			<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								���ܮר�		
							</h1>	
							<p class="text-white link-nav"><a href="select_missing_case.jsp">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="#">���ܮר�</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->	
<div class="row align-items-center upcoming-wrap">
							<div class="col-lg-6 upcoming-left">
								<img class="img-fluid" src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }" alt="">
							</div>
							<div class="col-lg-6 upcoming-right">
								<p class="meta">
									<span>${missingCaseVO.missing_name}</span>
									${missingCaseVO.missing_date}
								</p>
								<p>
									${missingCaseVO.missing_des}
								</p>
								<a class="primary-btn text-uppercase" href="#">�d�ݸԱ�</a>
							</div>
						</div>

<table id="table-1">
	<tr><td>
		 <h3>���ܮר� - listOneMissingCase.jsp</h3>
		 <h4><a href="select_missing_case.jsp"><img src="images/icons-return.png" width="32" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�רҽs��</th>
		<th>�|���s��</th>
		<th>���ܤ��</th>
		<th>���ܤ��e�y�z</th>
		<th>���ܰʪ��W��</th>
		<th>���ܦa�I</th>
		<th>���ܮרҤW�[���A</th>
	</tr>
	<tr>
			<td>${missingCaseVO.missing_case_id}</td>
			<td>${missingCaseVO.memb_id}</td>
			<td>${missingCaseVO.missing_date}</td>
			<td>${missingCaseVO.missing_des}</td>
			<td>${missingCaseVO.missing_name}</td>
			<td>${missingCaseVO.missing_loc}</td> 
			<td><img src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"></td>
	</tr>
</table>

</body>
</html>