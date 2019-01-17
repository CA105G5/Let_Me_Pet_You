<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	List<ProdVO> list;
	list = (List) request.getAttribute("list");
	System.out.println("list="+list);
	if (list==null){
		ProdService prodSvc = new ProdService(); 
		list = prodSvc.getAll_Front();
		pageContext.setAttribute("list", list);
	}
	
	
	Map<String, String[]> map = (Map<String, String[]>) request.getAttribute("map");
	String[] prod_ani_type_id = null;
	String[] prod_type_id = null;
	String prod_price = null;
	
	if (map!=null){
		Set<String> keys = map.keySet();
		if (keys.contains("prod_ani_type_id")){
			prod_ani_type_id = map.get("prod_ani_type_id");
			System.out.println("prod_ani_type_id:");
		}
		if (keys.contains("prod_type_id")){
			prod_type_id = map.get("prod_type_id");
		}
		if (keys.contains("prod_price")){
			prod_price = map.get("prod_price")[0];
		}
	}
	
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
<title>愛心商城</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
	
	
	<div class="container">
			<div class="row">

			
<!-- 			<!-- 左側邊list-group --> 
<!-- 			<div class="col-xs-12 col-sm-3"> -->
<!-- 				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto"> -->
<!-- 					<h3>商品分類</h3> -->
<!-- 					<hr> -->
<%-- 					    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" name="form1"> --%>
<!-- 					        <h5><b>選擇動物:</b></h5> -->
<!-- 						        <label><input type="checkbox" name="prod_ani_type_id" value="貓"> 貓</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_ani_type_id" value="狗"> 狗</label>　<br> -->
<!-- 								<label><input type="checkbox" name="prod_ani_type_id" value="兔"> 兔</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_ani_type_id" value="飛禽"> 飛禽</label>　<br> -->
<!-- 								<label><input type="checkbox" name="prod_ani_type_id" value="其他"> 其他</label>　<br> -->
<!-- 					        <hr> -->
<!-- 					       	<h5><b>選擇商品種類:</b></h5> -->
<!-- 					       		<label><input type="checkbox" name="prod_type_id" value="食" > 食</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="衣" > 衣</label>　<br> -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="住" > 住</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="行" > 行</label>　<br> -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="育" > 育</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="樂" > 樂</label>　<br> -->
<%-- <%-- 					        <%= Arrays.asList(prod_type_id).contains("樂")? "checked":"" %> --%> 
					        
<!-- 					        <hr> -->
<!-- 					       	<h5><b>選擇價格區間:</b></h5> -->
<%-- 					       		<label><input type="radio" name="prod_price" value="0 and 50" <%= "0 and 50".equals(prod_price)? "checked":"" %> > $ 50以下</label>　<br> --%>
<%-- 								<label><input type="radio" name="prod_price" value="50 and 100" <%= "50 and 100".equals(prod_price)? "checked":"" %>> $ 50~100</label>　<br> --%>
<%-- 								<label><input type="radio" name="prod_price" value="101 and 200" <%= "101 and 200".equals(prod_price)? "checked":"" %>> $ 101~200</label>　<br> --%>
<%-- 								<label><input type="radio" name="prod_price" value="200" <%= "200".equals(prod_price)? "checked":"" %>> $ 200以上</label>　<br> --%>
<!-- 							<br> -->
<!-- 							<input type="submit" value="查詢"> -->
<!--         					<input type="hidden" name="action" value="listAll_ByCompositeQuery"> -->
					    
<!-- 					     </FORM> -->

<!-- 				</div> -->
<!-- 			</div> -->
			
			
			
		</div>
	</div>
	

	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-2 cl-md-2" style="top: 180px; bottom: auto;">
						<div id="sider" class="n-browse-nav m-sticky-on" style="top: 130px; position: fixed; bottom: auto"> 
					<h3>商品分類</h3>
<!-- 					<hr> -->
						 
					    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" name="form1">
					         <div class="w3-panel w3-leftbar w3-sand w3-xxlarge w3-serif">
						    	<p style="height:16px">動物</p>
						 	 </div>
						        <label><input type="checkbox" name="prod_ani_type_id" value="貓"> 貓</label>　　
								<label><input type="checkbox" name="prod_ani_type_id" value="狗"> 狗</label>　<br>
								<label><input type="checkbox" name="prod_ani_type_id" value="兔"> 兔</label>　　
								<label><input type="checkbox" name="prod_ani_type_id" value="飛禽"> 飛禽</label>　<br>
								<label><input type="checkbox" name="prod_ani_type_id" value="其他"> 其他</label>　<br>
<!-- 					        <hr> -->
<!-- 					       	<h5><b style="background-color:bisque; color:black">商品種類</b></h5> -->
							 <div class="w3-panel w3-leftbar w3-sand w3-xxlarge w3-serif">
						    	<p style="height:16px">商品種類</p>
						 	 </div>
					       		<label><input type="checkbox" name="prod_type_id" value="食" > 食</label>　　
								<label><input type="checkbox" name="prod_type_id" value="衣" > 衣</label>　<br>
								<label><input type="checkbox" name="prod_type_id" value="住" > 住</label>　　
								<label><input type="checkbox" name="prod_type_id" value="行" > 行</label>　<br>
								<label><input type="checkbox" name="prod_type_id" value="育" > 育</label>　　
								<label><input type="checkbox" name="prod_type_id" value="樂" > 樂</label>　<br>
<%-- 					        <%= Arrays.asList(prod_type_id).contains("樂")? "checked":"" %>  --%>
					        
<!--  					        <hr>  -->
<!--  					       	<h5><b style="background-color:bisque; color:black">價格區間</b></h5>  -->
							 <div class="w3-panel w3-leftbar w3-sand w3-xxlarge w3-serif">
						    	<p style="height:16px">價格區間</p>
						 	 </div>
					       		<label><input type="radio" name="prod_price" value="0 and 50" <%= "0 and 50".equals(prod_price)? "checked":"" %> > $ 50以下</label>　<br>
								<label><input type="radio" name="prod_price" value="50 and 100" <%= "50 and 100".equals(prod_price)? "checked":"" %>> $ 50~100</label>　<br>
								<label><input type="radio" name="prod_price" value="101 and 200" <%= "101 and 200".equals(prod_price)? "checked":"" %>> $ 101~200</label>　<br>
								<label><input type="radio" name="prod_price" value="200" <%= "200".equals(prod_price)? "checked":"" %>> $ 200以上</label>　<br>
							<br>
							<input type="submit" value="查詢">
        					<input type="hidden" name="action" value="listAll_ByCompositeQuery">
					    
					     </FORM>

				</div>
						
					
					
					
					</div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-10" >
						<div class="row">
						<%@ include file="/front-end/product/pages/page1.file" %> 
							<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%-- 								<c:if test="${prodVO.prod_status.equals('上架')}" var="condition" scope="page"> --%>
									<div class="col-lg-3 cl-md-3" style="height:320px;">
										<div class="single-training">
											<div class="thumb relative">
												<div class="overlay-bg"></div>
												<img class="img-fluid"
													src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prodVO.prod_id}" alt="" style="height:180px">
												<!-- 												<a class="admission-btn" href="#">Admission	Going on</a> -->
											</div>
											<div class="details" style="height:70px">
												<div class="title justify-content-between d-flex">
													<a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prodVO.prod_id}"><h5>${prodVO.prod_name}</h5></a>
													<p class="price">$${prodVO.prod_price}</p>
												</div>
											</div>
										</div>
									</div>
									<br>
<%-- 								</c:if> --%>
							</c:forEach>
							<br>
							<br>
							
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
							
							
						</div>
						<br>
						<br>
						
						<div style="float:center"><%@ include file="/front-end/product/pages/page2.file" %></div>
					</div>

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
		
		
		$("ul.nav-menu li").attr('class', "" );
		$("#shop").attr('class', 'menu-active menu-has-children' );
	</script>
	
	
<!-- 商品上架推播 -->
<script>
    var MyPoint = "/ProductEchoServer";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    console.log("endPointURL="+endPointURL);
    
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		console.log("websocket已連線");
		
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



