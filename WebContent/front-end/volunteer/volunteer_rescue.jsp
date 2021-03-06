<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.volunteer.model.*"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%
VolunteerVO volunteerVO = (VolunteerVO) session.getAttribute("volunteerVO");
RescueVO rescueVO = (RescueVO) request.getAttribute("rescueVO");
System.out.println("111111111111111111111111111="+session.getId());
String flag = (String) request.getAttribute("flag");
%>
<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService"/>
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
		<title>LET ME PET YOU-志工救援</title>

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
		h1{
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
		<% if(rescueVO == null){ %>
			<br><br><br>
			<div align="center">	<h1 style="color:green;font-size:100px">
								目前尚未被分配救援案例
									</h1></div><br><br><br>
			<div align="center"><a href="<%=request.getContextPath()%>/front-end/volunteer/volunteer_index.jsp" class=" genric-btn success-border circle">回上一頁</a></div>
		 <%  }else{ %>
				<form METHOD="post" ACTION="volunteer.do" name="form1" enctype="multipart/form-data">
			<div class="container">
				
					<div class="row justify-content-between align-items-center">
			<div style="background-color: rgba(0, 0, 0, 0.5);" class="col-sm-12 col-sm-6 col-sm-offset-3 booking-right" align="center">

								<h4 style="font-family:Georgia,Microsoft JhengHei,sans-serif;font-size:30px" class="mb-20">目前分派到的救援案例</h4>
								
								
								<table>
								<tr><th>救援案例編號：</th><td>${rescueVO.rsc_id}</td></tr>
								<tr><th>救援案例名稱：</th><td>${rescueVO.rsc_name}</td></tr>
								<tr><th>救援案例地點：</th><td>${rescueVO.rsc_add}</td></tr>
<!-- 								<tr><th>救援案例描述:</th><td></td></tr> -->

<%-- 								<tr><th>救援案例緯度：</th><td>${rescueVO.rsc_lat}</td></tr> --%>
<%-- 								<tr><th>救援案例經度：</th><td>${rescueVO.rsc_lon}</td></tr> --%>
								<tr><th>救援案例發起時間：</th><td>${rescueVO.rsc_btime}</td></tr>
								<tr><th>救援案例照片:</th><td><img style="width:200px;height:200px" src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}"/></td></tr>

								
								</table>
								<br>
								<input type="hidden" name="action" value="rescue_done_by_volunteer">
								<input type="hidden" id="rsc_id" name="rsc_id" value="<%=rescueVO.getRsc_id()%>">
								<input type="hidden" id="vlt_id" name="vlt_id" value="<%=volunteerVO.getVlt_id()%>">
                                
								<div id="done"  class="btn btn-default btn-lg btn-block text-center">完成救援</div>	
								
								
						</div>
					</div>
				</div>
</form>
				
		<br><br><br>
			<div align="center"><a href="<%=request.getContextPath()%>/front-end/volunteer/volunteer_index.jsp" class=" genric-btn success-border circle">回上一頁</a></div>		
		<%}%>
<script>
		 $("#done").on('click', function () {
		        swal({
		            title: "確定完成？",
		            html: "按下完成就會派管理員檢查喔...",
		            type: "warning", // type can be "success", "error", "warning", "info", "question"
		            showCancelButton: true,
		        	showCloseButton: true,
		        }).then(
		        	   function (result) {
		        		   console.log("11111");
		                if (result) {
		                	console.log("22222");
		                	$.ajax({
		                		
		    					url: '<%=request.getContextPath()%>/front-end/volunteer/volunteer.do',
		    					type: "get",
		    					data: { 'action': 'rescue_done_by_volunteer', 'rsc_id': $('#rsc_id').val() , 'vlt_id': $('#vlt_id').val() },
		    					dataType: 'json',
		    					success: function(res){
		    						console.log("0000000000");
		    						
		    						//自訂預設值
		    						swal({
		    						            title: "感謝你的救援",
		    						            type: "success", // type can be "success", "error", "warning", "info", "question"
		    						            
		    						        		showCloseButton: true,
		    						        });
		    						setInterval(function(){window.location.href = "<%=request.getContextPath()%>/front-end/volunteer/volunteer_rescue.jsp";},2000);
		    						
		    					},
		    					error: function(res){
		    						console.log("eeeeeeee");
		    						console.log("res="+res);
		    					}
		    				
		    				});
		                }
	            }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
	            		swal("取消", "尚未完成", "error");
		        }).catch(swal.noop);
		    });
		 </script>		
		
		
			
<%if ("yes".equals(flag)){%>
    	
	
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
			    })
			    
			})
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