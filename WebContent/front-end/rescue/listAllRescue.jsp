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
<title>浪我陪你-救援案例總覽</title>

	

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
li>a{
	color:black;
}
li>a:hover{
	text-decoration:none;
	color:red;
}
</style>
</head>
<body>

	<jsp:include page="/index_Header.jsp" flush="true" />
	
	<!-- BackToTop Button -->
	<a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none;">Top<span></span></a>

	<!-- ++++++++++++ Page Content Goes Here ++++++++++++ -->
		<div class="row d-flex justify-content-center" style="background-image: url(http://www.savedogs.org/upload/Masthead/r/rw4cztmo87qqjof8mm5wovypicoyu4cl1hx0/main.jpg); height: 280px;width: 1900px;margin-left: 7.5px;margin-right: 0px;">
				<div class="col-md-9 pb-40 header-text text-center" style="margin-top: 100px;">
				<br><br><br>
				<h1 class="pb-10"style="color:white;">搶救生命，分秒必爭</h1>
				</div>
			</div>
	

	<section class="service-page-area section-gap">
		<div class="container-fulid">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
				<div class="col-xs-12 col-sm-1"></div>
					<div class="col-xs-12 col-sm-2 sidebar" style="top: 0px; bottom: auto;">
					<div class="single-widget category-widget" style="padding-top:0px;">
						<h2 class="title" style="margin-bottom:10px;padding-top:0px;margin-top:0px">救援</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>新增救援</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp" class="justify-content-between align-items-center d-flex"><h4>今日救援地圖</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>救援案例總覽</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>待完成救援案例</h4></a></li>
					
							</ul>
					</div>
					</div>
					
					<div class="col-xs-12 col-sm-8">
						<div class="row">
						<%@ include file="/front-end/product/pages/page1_ByCompositeQuery.file" %> 
						
						
						
							<c:forEach var="rescueVO" items="${listAllRescue_ByCompositeQuery}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
									
									<div class="col-lg-3 cl-md-3" title="查看詳情">
										<div class="single-service-page">
											<div class="thumb relative">
												<div class="overlay-bg"></div>
												<img style="width:250px;height:250px;" class="img-fluid"
													src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}" alt="">
												
											</div>
											<div class="details" style="height:250px">
												<div style="height:105px" class="title justify-content-between d-flex">
													<a href="<%=request.getContextPath()%>/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescueVO.rsc_id}">
													<h4 >${rescueVO.rsc_name}</h4></a>
												</div>
												<div><fmt:formatDate value="${rescueVO.rsc_btime}" type="DATE"/></div>
												<div><fmt:formatDate value="${rescueVO.rsc_btime}" type="TIME"/></div>
												<div class="sta" style="font-weight:bold;">${rescueVO.rsc_sta}</div>
											</div>
										</div>
									</div>
								
							</c:forEach>
							<br>
							<br>
							
							
						</div>
						<div style="float:center"><%@ include file="/front-end/product/pages/page2_ByCompositeQuery.file" %></div>
					</div>
					<div class="col-xs-12 col-sm-1"></div>
				</div>
			</div>
		</div>
	</section>


	

	

	
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
	
	<script type="text/javascript">
		$(document).ready(function(){
			for (var i = 0; i < $(".details").size() ; i++) {
				var staa = ".details:eq(" + i + ") > div.sta";	
				var stasta = $(staa).text();

				switch (stasta) {
				  case "待救援":
				   $(staa).css("color","red");
				    break;
				  case "救援中":
					$(staa).css("color","orange");
				    break;
				  case "完成救援送審中":
					$(staa).css("color","purple");
				    break;
				  case "分派給志工":
					$(staa).css("color","blue");  
				    break;
				  case "完成救援":
					$(staa).css("color","green");  
				    break;
				  case "志工已完成":
					$(staa).css("color","green");
				    break;
				 
				}
				 
				
			}
		    });
		
	</script>
	
</body>
</html>



