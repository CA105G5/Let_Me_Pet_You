<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.volunteer.model.VolunteerService"%>
<%@ page import="com.volunteer.model.VolunteerVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%
VolunteerVO volunteerVO = (VolunteerVO) session.getAttribute("volunteerVO");
System.out.println("111111111111111111111111111="+session.getId());

%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
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
		<title>LET ME PET YOU</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
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
		
		*{
			font-family:Georgia,Microsoft JhengHei,sans-serif;
		
		}
		
		.booking-right label{
			color: #fff;
			font-size:16px;
		
		
		}
		
		 .img:hover{
            zoom:1;
            transform: scale(1.2);
        }
        
		.booking-area {
    		background:none;
    		
    		background-size: cover;
		}
		
 			
 	/*	.booking-area .overlay-bg {
    		background-color: rgba(0, 0, 0, 0.5);
		}*/	

 		</style>	

		</head>
		<body background="images/volunteerbkk.jpg" style="background-repeat: repeat;">
			<div class="container">
				<div class="row d-flex justify-content-center">
				<div class="col-xs-12 col-sm-2">
					
				</div>
				<div class="col-xs-12 col-sm-8">
					<a href="index_volunteer.html">
						<img style="width:90%;height:90%;"class="img-fluid" src="images/logo2.png" title="前往官網">
					</a>
				</div>
				<div class="col-xs-12 col-sm-2"style="padding-right: 30px;">
					<div style="justify-content:flex-end;align-items:center" class="row" >
					<h3 style="color:deeppink">${volunteerVO.vlt_name},您好</h3>
						<a href="<%=request.getContextPath()%>/front-end/volunteer/volunteer.do?action=logout">
							<img style="width:60px;height:60px"class="img img-fluid " src="images/logout.png" title="登出">
						</a>
					</div>
				</div>
			</div>

			

			
			<section style="padding-top: 50px; class=" booking-area section-gap relative" id="consultancy">
				
				<div class="container">
					<div class="row justify-content-between align-items-center">
						<div class="col-xs-12 col-sm-6 booking-left">
						<img style="width:400px;height:400px"class="img-fluid" src="<%=request.getContextPath()%>/back-end/volunteer/volunteerImg.do?vlt_id=${volunteerVO.vlt_id}">
				        </div>
						
						<div style="background-color: rgba(0, 0, 0, 0.5);" class="col-xs-12 col-sm-6 booking-right">

								<h4 style="font-family:Georgia,Microsoft JhengHei,sans-serif" class="mb-20">志工個人基本資料</h4>
								<form action="#">
								
								<div class="form-group">
									<label>志工姓名：</label>
									<input type="text"class="form-control" name="vlt_name" value="${volunteerVO.vlt_name}">
								</div>
								
								
								
								
								
								
								
								
									<input class="form-control" type="text" name="name" placeholder="Your name" required>
									<input class="form-control" type="email" name="email" placeholder="Email Address" required>
									<input class="form-control" type="text" name="phone" placeholder="Phone Number" required>
									<div class="input-group dates-wrap">                                          
										<input id="datepicker" class="dates form-control" id="exampleAmount" placeholder="Date & time" type="text">                        
										<div class="input-group-prepend">
											<span  class="input-group-text"><span class="lnr lnr-calendar-full"></span></span>
										</div>											
									</div>
									<textarea class="common-textarea form-control mt-10" name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"></textarea>
									<button  class="btn btn-default btn-lg btn-block text-center">Book Now!</button>
								</form>
						</div>
						<div class="col-xs-12 col-sm-2">
					
				        </div>
					</div>
				</div>	




			</section>


		


	
		

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
			
		</body>
	</html>