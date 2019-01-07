<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%
	List<RescueVO> list = null;
	
	System.out.println("listAllRescue_ByCompositeQueryList="+list);
	if (list==null){
		RescueService rescueSvc = new RescueService(); 
		list = rescueSvc.getAll();
		session.setAttribute("listAllRescue_ByCompositeQuery", list);
	}
	
	
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <!-- Favicon--> -->
<!-- <link rel="shortcut icon" href="img/fav.png"> -->
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>救援案例總覽</title>

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
	

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

#scroll {
    position:fixed;
    right:10px;
    bottom:10px;
    cursor:pointer;
    width:40px;
    height:40px;
    background-color:#3498db;
    text-indent:-9999px;
    display:none;
    -webkit-border-radius:20px;
    -moz-border-radius:20px;
    border-radius:20px;
}
#scroll span {
    position:absolute;
    top:50%;
    left:50%;
    margin-left:-8px;
    margin-top:-12px;
    height:0;
    width:0;
    border:8px solid transparent;
    border-bottom-color:#ffffff
}
#scroll:hover {
    background-color:#e74c3c;
    opacity:1;
    filter:"alpha(opacity=100)";
    -ms-filter:"alpha(opacity=100)";
}

</style>
</head>
<body>

	<jsp:include page="/front-end/rescue/rescue_header.jsp" flush="true" />
	
	<!-- BackToTop Button -->
	<a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none;">Top<span></span></a>

	<!-- ++++++++++++ Page Content Goes Here ++++++++++++ -->
	<div class="container">
			<div class="row">

<!-- 				左側邊list-group -->
 				<div class="col-xs-12 col-sm-3">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>救援</h3>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">今日救援地圖</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></h5>
					<hr>

					
				</div>
			</div>
		</div>
	</div>
	

	<section class="service-page-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-2 cl-md-2" style="top: 180px; bottom: auto;"></div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-10" >
						<div class="row">
						<%@ include file="/front-end/product/pages/page1_ByCompositeQuery.file" %> 
						
						
						
							<c:forEach var="rescueVO" items="${listAllRescue_ByCompositeQuery}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

									<div class="col-lg-3 cl-md-3">
										<div class="single-service-page">
											<div class="thumb relative">
												<div class="overlay-bg"></div>
												<img style="width:250px;height:250px;" class="img-fluid"
													src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}" alt="">
												
											</div>
											<div class="details">
												<div class="title justify-content-between d-flex">
													<a href="<%=request.getContextPath()%>/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescueVO.rsc_id}">
													<h4>${rescueVO.rsc_name}</h4></a>
												</div>
												<div>狀態：${rescueVO.rsc_sta}</div>
											</div>
										</div>
									</div>

							</c:forEach>
							<br>
							<br>
							
							
						</div>
						<div style="float:center"><%@ include file="/front-end/product/pages/page2_ByCompositeQuery.file" %></div>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	


	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
<!-- 	<script type="text/javascript" -->
<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKTq4JnBzGP4UWtr5xe0c_wDQlWUbVrXU&callback=initMap"></script> -->
		

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
	<script type="text/javascript">
		$(document).ready(function(){
		    $(window).scroll(function(){
		        if($(this).scrollTop() > 100){
		            $('#scroll').fadeIn();
		        }else{
		            $('#scroll').fadeOut();
		        }
		    });
		    $('#scroll').click(function(){
		        $("html, body").animate({ scrollTop: 0 }, 600);
		        return false;
		    });
		});
	</script>
	
<!-- 	分頁點擊 -->
	<script type="text/javascript">
		$(document).ready(function(){
		    $(".pagination").click(function(e){
		        $("ul.pagination li").attr("class", "");
		        $(e.target).attr("class", "active");
		    });
		});
	</script>
	
	
</body>
</html>



