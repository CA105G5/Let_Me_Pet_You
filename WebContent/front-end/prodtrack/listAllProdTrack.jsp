<%@page import="redis.clients.jedis.Jedis"%>
<%@page import="com.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	Set<String> favSet;
	favSet = (Set<String>) session.getAttribute("favSet");
	MemVO memVO = (MemVO)session.getAttribute("memVO");
	String session_id = session.getId();
	if (favSet==null){
		Jedis jedis=null;
		try {
			jedis = new Jedis("localhost", 6379);
			jedis.auth("123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if (memVO==null) {
			
			favSet = jedis.smembers("Fav:"+session_id);
			System.out.println("Fav:" + session_id + " = " + favSet);
			System.out.println("Fav:" + session_id + " 追蹤商品數量=" + favSet.size());
	
		} else {
			
			favSet = jedis.smembers("Fav:"+memVO.getMemb_id());
			System.out.println("Fav:" + memVO.getMemb_id() + " = " + favSet);
			System.out.println("Fav:" + memVO.getMemb_id() + " 追蹤商品數量=" + favSet.size());
			
		}
	}
	
	System.out.println("????????????????????");
	System.out.println("favSet="+favSet);
	
%>
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>我的追蹤</title>


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
<body onload="connect();" onunload="disconnect();">

	<jsp:include page="/index_Header.jsp" flush="true" />
	
	<!-- BackToTop Button -->
	<a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none;">Top<span></span></a>

	<!-- ++++++++++++ Page Content Goes Here ++++++++++++ -->

	<section class="training-area" style="padding-top:20px">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-xs-12 col-sm-12" >
						<h3>我的追蹤商品</h3>
						<hr>
					</div>
					<div class="col-xs-12 col-sm-12" >
						<div class="row">
							<c:forEach var="prod_id" items="${favSet}">
								<div class="col-lg-3 cl-md-3">
									<div class="single-training">
										<div class="thumb relative">
											<div class="overlay-bg"></div>
											<img class="img-fluid"
												src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prod_id}" alt="">
											<!-- 												<a class="admission-btn" href="#">Admission	Going on</a> -->
										</div>
										<div class="details">
											<div class="title justify-content-between d-flex">
												<a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prod_id}"><h5>${prodSvc.getOneProd(prod_id).prod_name}</h5></a>
												<p class="price">$${prodSvc.getOneProd(prod_id).prod_price}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<br>
						<br>
							
							
					</div>
				</div>

			</div>
		</div>
	</section>
	
	
<!--產品推播modal -->
<div class="modal" id="product_push_modal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="largeModalLabel">新產品上架囉</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="form-group" style="width:700px">
						<h5>快點擊商品連結前往查看吧~~~</h5>
						<div class="container">
							<hr>
							<a id="broadcast_product_link" href="" style="text-decoration:none;">
							<div class="row">
								<div class="col-xs-3 col-sm-3">
									<img class="img-fluid" src="" alt="" width="300px">
								</div>
								<div class="col-xs-6 col-sm-6">
									<h5><span id="broadcast_prod_name"></span>
										<span style="font-size: 1em; color: Tomato; text-indent:50px;">
											<i class="fas fa-coins"></i>
										</span>
										<span id="broadcast_prod_price"></span>
									</h5>
								</div>
							</div>
							</a>
						</div>
					</div>
					<br>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
			</div>
		</div>
	</div>
</div>	
								                
<!--產品推播modal -->	
	
	
	
	


	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
	
<!-- 商品上架推播 -->
<script>
    var MyPoint = "/ProductEchoServer";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {

		};

		webSocket.onmessage = function(event) {
			
	        var jsonObj = JSON.parse(event.data);
	        var prod_id = jsonObj.prod_id;
	        var prod_name = jsonObj.prod_name;
	        var prod_price = jsonObj.prod_price;
	        var img_src = '<%=request.getContextPath()%>/util/PicReader?prod_id=' + prod_id;
	        var prod_link = '<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=' + prod_id;
	        console.log("img_src="+img_src);
	        console.log("prod_link=" + prod_link);
	        console.log("prod_name=" + prod_name);
	        console.log("prod_price=" + prod_price);
	        $("#product_push_modal").find("img").attr("src", img_src);
	        $("#broadcast_product_link").attr("href", prod_link);
	        $("#broadcast_prod_name").text(prod_name);
	        $("#broadcast_prod_price").text(prod_price);
			$('#product_push_modal').modal('show');
		};

		webSocket.onclose = function(event) {
			
		};
	}
	
	
	function disconnect () {
		webSocket.close();
	}

	
</script>
	
	
</body>
</html>



