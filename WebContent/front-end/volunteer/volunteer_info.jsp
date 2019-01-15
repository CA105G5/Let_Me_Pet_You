<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.volunteer.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%
VolunteerVO volunteerVO = (VolunteerVO) session.getAttribute("volunteerVO");

System.out.println("111111111111111111111111111="+session.getId());
String flag = (String) request.getAttribute("complete");
System.out.println("111111111111"+flag);
%>
<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService"/>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>LET ME PET YOU-志工基本資料</title>

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
		.booking-right table th{
			color: #fff;
			font-size:25px;
			padding-bottom: 6px;
    		padding-top: 6px;
		
		}
		.booking-right table td{
			color:black;
			font-size:25px;
    		padding-bottom: 6px;
    		padding-top: 6px;
		
		
		}
		
		 .img:hover{
            zoom:1;
            transform: scale(1.2);
        }
        
		.booking-area {
    		background:none;
    		
    		background-size: cover;
		}
		
 			
 		.booking-area .overlay-bg {
    		background-color: rgba(0, 0, 0, 0.4);
		}	

 		</style>	
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
                <!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
		</head>
		<body background="images/volunteerbkk.jpg" style="background-repeat: repeat;">
			<div class="container">
				<div class="row d-flex justify-content-center">
				<div class="col-xs-12 col-sm-2">
					
				</div>
				<div class="col-xs-12 col-sm-8">
					<a href="<%=request.getContextPath()%>/index.jsp">
						<img style="width:90%;height:90%;"class="img-fluid" src="images/logo2.png" title="前往官網">
					</a>
				</div>
				<div class="col-xs-12 col-sm-2"style="padding-right: 30px;">
					<div style="justify-content:flex-end;align-items:center" class="row" >
					<h3 style="color:deeppink;font-family:Georgia,Microsoft JhengHei,sans-serif">${volunteerVO.vlt_name},您好</h3>
						<a href="<%=request.getContextPath()%>/front-end/volunteer/volunteer.do?action=logout">
							<img style="width:60px;height:60px"class="img img-fluid " src="images/logout.png" title="登出">
						</a>
					</div>
				</div>
			</div>
        </div>
			

			
			<section style="padding-top: 50px; class=" booking-area section-gap relative" id="consultancy">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<form METHOD="post" ACTION="volunteer.do" name="form1" enctype="multipart/form-data">
				<div class="container">
				
					<div class="row justify-content-between align-items-center">
					
						<div class="col-xs-12 col-sm-6 booking-left">
						<img  style="width:400px;height:400px" class="preview img-fluid" src="<%=request.getContextPath()%>/back-end/volunteer/volunteerImg.do?vlt_id=${volunteerVO.vlt_id}"/>
		 				<div class="size"></div>
						<input type="file" class="upl" name="upfile" id="file01">
				        </div>
						
						<div style="background-color: rgba(0, 0, 0, 0.5);" class="col-xs-12 col-sm-6 booking-right">

								<h4 style="font-family:Georgia,Microsoft JhengHei,sans-serif;font-size:30px" class="mb-20">志工個人基本資料</h4>
								
								
								<table>
								<tr><th>志工編號：</th><td>${volunteerVO.vlt_id}</td></tr>
								<tr><th>志工姓名：</th><td>${volunteerVO.vlt_name}</td></tr>
								<tr><th>志工性別：</th><td>${volunteerVO.vlt_gender}</td></tr>
								<tr><th>e-mail(帳號):</th><td>${volunteerVO.vlt_mail}</td></tr>
								<tr><th>志工密碼:</th><td><input type="password" class="form-control" name="vlt_pw" placeholder="PassWord" required value="${volunteerVO.vlt_pw}"></td></tr>
								<tr><th>志工電話：</th><td><input type="text"class="form-control" name="vlt_tel" placeholder="Phone Number" required value="${volunteerVO.vlt_tel}"></td></tr>
								<tr><th>加入日期：</th><td>${volunteerVO.vlt_registerdate}</td></tr>
								<tr><th>可值勤日：</th><td><select size="1" name="vlt_duty_day">
														<option value="平日" ${(volunteerVO.vlt_duty_day=='平日')? 'selected':'' }>平日
														<option value="假日" ${(volunteerVO.vlt_duty_day=='假日')? 'selected':'' }>假日
														<option value="每日" ${(volunteerVO.vlt_duty_day=='每日')? 'selected':'' }>每日
													
												</select></td></tr>
								<tr><th>服務區域：</th><td>${regionSvc.getOneRegion(volunteerVO.vlt_reg).reg_name}</td></tr>

								
								</table>
								<br>
								<input type="hidden" name="action" value="updatebyvolunteer">
                                <input type="hidden" name="vlt_id" value="<%=volunteerVO.getVlt_id()%>">
                                <input type="hidden" name="vlt_registerdate" value="<%=volunteerVO.getVlt_registerdate()%>">
                                <input type="hidden" name="vlt_reg" value="<%=volunteerVO.getVlt_reg()%>">
                                <input type="hidden" name="vlt_name" value="<%=volunteerVO.getVlt_name()%>">
                                <input type="hidden" name="vlt_gender" value="<%=volunteerVO.getVlt_gender()%>">
                                <input type="hidden" name="vlt_mail" value="<%=volunteerVO.getVlt_mail()%>">
									
								<input type="submit" id="done" class="btn btn-default btn-lg btn-block text-center">修改/儲存</button>
								
						</div>
						
					</div>
				</div>	

			
			</form>
			<br>
			<br>
			<div align="center"><a href="<%=request.getContextPath()%>/front-end/volunteer/volunteer_index.jsp" class=" genric-btn success-border circle">回上一頁</a></div>
			
			</section>
			
 <%if ("yes".equals(flag)){%>
    	<script>
	//自訂預設值
	swal({
	            title: "修改完成!",
	            html: "資料已更新!",
	            type: "success", // type can be "success", "error", "warning", "info", "question"
	            
	        		showCloseButton: true,
	        });
	</script>
	
    <% flag = "";} %>
    

		


		
	

	
		

			<!-- End -->
<script>
			$(function (){
				 
			    function format_float(num, pos)
			    {
			        var size = Math.pow(10, pos);
			        return Math.round(num * size) / size;
			    }
			 
			    function preview(input) {
			 
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            
			            reader.onload = function (e) {
			                $('.preview').attr('src', e.target.result);
			                var KB = format_float(e.total / 1024, 2);
			                $('.size').text("檔案大小：" + KB + " KB");
			            }
			 
			            reader.readAsDataURL(input.files[0]);
			        }
			    }
			 
			    $("body").on("change", ".upl", function (){
			        preview(this);
			    });
			    
			   
			
			});	
</script>

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