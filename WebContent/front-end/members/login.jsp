<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�n�J�e��</title>
<%-- ��ۤvcss�e --%>
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

<%-- �Y�n�ϥ�fai�����~��icon�A�nimport CDN�A�ֱ���facdn=>tab --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


</head>
<body>
<header id="header" id="home">
				<div class="container">
			<div class="row header-top align-items-center">
				<div class="col-lg-4 col-sm-4 menu-top-left">
					<a href="index.jsp"> <img class="img-fluid"
						src="images/logo2.png" width="200" alt="">
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
				<a href="#"><img style="width:40px;height:40px" class="img-fluid" src="images/login.jpg" data-toggle="tooltip" data-placement="left" title="�n�J/���U"></a>
					
				</div>
			</div>
		</div>
		<hr>
			    <div class="container">
			<div class="row align-items-center justify-content-center d-flex">
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.jsp">����</a></li>
						<li><a href="about.html">�ϴ�</a></li>
						<li><a href="service.html">�{�i</a></li>
						<li><a href="training.html">����</a></li>
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
				<%-- #nav-menu-container --%>
			</div>
		</div>
			  </header><!-- #header -->
			  
			  <br><br><br><br><br><br><br><br><br>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
    <FORM METHOD="post" ACTION="mem.do" >
        <div class="container">
			<div class="h1"></div>
			
			<div class="page-header">
			  <h1 align="center">�п�J�b���K�X</h1>
			</div>
			<table class="table table-bordered table-striped table-hover table-condensed">
			<tr><td>�b��:</td><td><input type="text" name="memb_acc"></td></tr>
			<tr><td>�K�X:</td><td><input type="password" name="memb_psw"></td></tr>
			
   
 
        
        
        </table>
        </div>
        <br>
        <input type="hidden" name="action" value="login">
        <div align="center"><input type="submit" value="�n�J">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="addMembers.jsp">���U�����s�|��</a></div>
        
    </FORM>
 		  
			  
			  
			  
<%-- �ҪO��script �[�b�ۤv��script�e--%>
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
<script src="https://code.jquery.com/jquery.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>