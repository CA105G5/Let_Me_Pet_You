<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/vlogo.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>LET ME PET YOU-志工登入</title>
        
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">					
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">

		<style>
		 .img:hover{
            zoom:1;
            transform: scale(1.2);
        }
        .section-gap {
            padding: 150px 0;
        }
		

 		</style>	

		</head>
		<body background="images/volunteerbkk.jpg">
			
			<div class="container">
			<div class="row d-flex justify-content-center">
				<a href="<%=request.getContextPath()%>/index.jsp">
					<img style="width:95%;height:95%;"class="img-fluid" src="images/logo2.png" title="前往官網">
				</a>
			</div>
			</div>
			<section class="home-about-area section-gap">
				<div class="container">
					<div class="row d-flex justify-content-center">
						
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
<!-- 				<font style="color:red">請修正以下錯誤:</font> -->
<!-- 				<ul> -->
<%-- 					<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 						<li style="color:red">${message}</li> --%>
<%-- 					</c:forEach> --%>
<!-- 				</ul> -->
			</c:if>
    
 		    <div class="col-lg-4 col-md-6 booking-right">
				<h3 class="mb-20" align="center">請輸入帳號密碼</h3>
					<form METHOD="post" ACTION="volunteer.do" >
					<div>帳號：<input class="form-control" type="email" id="vlt_mail" name="vlt_mail" placeholder="Email Address" value="${param.vlt_mail}" required=""><p style="color:red">${errorMsgs.vlt_mail}</p></div>
					<div>密碼：<input class="form-control" type="password" name="vlt_pw" placeholder="password" required=""><p style="color:red">${errorMsgs.vlt_pw}</p></div>
						<input type="hidden" name="action" value="login">
						<button class="btn btn-default btn-lg btn-block text-center">登入</button>
					</form>
			</div>

						</div>
					</div>
			
			</section>

<img id="miracleBtn" style="width:60px;height:60px;"class="img-fluid" src="<%=request.getContextPath()%>/images/magicbtn.png">		


	
		

			<!-- End -->

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
			<script type="text/javascript">
			$('#miracleBtn').click(function(){
				console.log('1111111111111111');
				$('#vlt_mail').val('ca105demo@gmail.com');
				
				
			});
			</script> 
		</body>
	</html>