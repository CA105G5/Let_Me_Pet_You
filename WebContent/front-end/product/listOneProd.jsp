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
	ProdVO prodVO  = (ProdVO) request.getAttribute("prodVO");
	List<ProdImgVO> prodImgList  = (List<ProdImgVO>) request.getAttribute("prodImgList");
	System.out.println("listOneProd.jsp得到從ProdServlet.java傳過來的屬性"+request.getAttribute("Test"));
	System.out.println("listOneProd.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("whichPage"));
	System.out.println("listOneProd.jsp得到從ProdServlet.java傳過來的請求參數值"+request.getParameter("prod_id"));
%>

<%

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



	MemVO memVO = (MemVO) session.getAttribute("memVO");
	System.out.println("111111111111111111111111111="+session.getId());
	System.out.println( "是否登入:"+ (memVO != null));
%>
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>愛心商品</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/ord/style.css" media="screen" title="no title" charset="utf-8">
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


* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 5s;
  animation-name: fade;
  animation-duration: 5s;
}

@-webkit-keyframes fade {
  from {opacity: .6} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .6} 
  to {opacity: 1}
}


/* button click動畫 */
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
/*   box-shadow: 0 9px #999; */
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

#btnTrigger
{
display:none;
}

/* checkbox樣式 */
/* The container */
.check_ctn {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.check_ctn input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.check_ctn:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.check_ctn input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.check_ctn input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.check_ctn .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}


/* radio button樣式 */
/* The radio_ctn */
.radio_ctn {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.radio_ctn input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.radio_checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.radio_ctn:hover input ~ .radio_checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.radio_ctn input:checked ~ .radio_checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.radio_checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.radio_ctn input:checked ~ .radio_checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.radio_ctn .radio_checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}


</style>
</head>
<body onload="connect();" onunload="disconnect();">

	<jsp:include page="/index_Header.jsp" flush="true" />
	
	
<!-- 	<section class="training-area section-gap"> -->
		<div class="container-fluid">
<!-- 			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;"> -->
				<div class="row">	
					<div class="col-xs-3 offset-xs-1 col-md-2 offset-md-1 " style="top: 180px; bottom: auto;">
						<div id="sider" class="n-browse-nav m-sticky-on" style="top: 110px; position: fixed; bottom: auto"> 
						<h3>分類查詢</h3>
<!-- 					<hr> -->
						 
					    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" name="form1">
					    <hr>
					         <div class="w3-panel w3-leftbar w3-sand w3-xxlarge w3-serif">
						    	<p style="height:16px">動物</p>
						 	 </div>
							 	 <label class="check_ctn" style="display:inline; font-size:16px">貓
							 	 	<input type="checkbox" name="prod_ani_type_id" value="貓">
								  		<span class="checkmark"></span>
								 </label>
								 &nbsp&nbsp&nbsp
							 	 <label class="check_ctn" style="display:inline; font-size:16px">狗
							 	 	<input type="checkbox" name="prod_ani_type_id" value="狗">
								  		<span class="checkmark"></span>
								 </label>
								 <br>
								 <br>
							 	 <label class="check_ctn" style="display:inline; font-size:16px">兔
							 	 	<input type="checkbox" name="prod_ani_type_id" value="兔">
								  		<span class="checkmark"></span>
								 </label>
								 &nbsp&nbsp&nbsp
							 	 <label class="check_ctn" style="display:inline; font-size:16px">飛禽
							 	 	<input type="checkbox" name="prod_ani_type_id" value="飛禽">
								  		<span class="checkmark"></span>
								 </label>
								 <br>
								 <br>
							 	 <label class="check_ctn" style="display:inline; font-size:16px">其他
							 	 	<input type="checkbox" name="prod_ani_type_id" value="其他">
								  		<span class="checkmark"></span>
								 </label>
								 <br>
<!-- 								 <br> -->
							 <div class="w3-panel w3-leftbar w3-sand w3-xxlarge w3-serif">
						    	<p style="height:16px">商品種類</p>
						 	 </div>



<!-- 								<hr> -->
								<label class="check_ctn" style="display:inline; font-size:16px">食
							 	 	<input type="checkbox" name="prod_type_id" value="食">
								  		<span class="checkmark"></span>
								 </label>
								 &nbsp&nbsp&nbsp
							 	 <label class="check_ctn" style="display:inline; font-size:16px">衣
							 	 	<input type="checkbox" name="prod_type_id" value="衣">
								  		<span class="checkmark"></span>
								 </label>
								 <br>
								 <br>
							 	 <label class="check_ctn" style="display:inline; font-size:16px">住
							 	 	<input type="checkbox" name="prod_type_id" value="住">
								  		<span class="checkmark"></span>
								 </label>
								 &nbsp&nbsp&nbsp
							 	 <label class="check_ctn" style="display:inline; font-size:16px">樂
							 	 	<input type="checkbox" name="prod_type_id" value="樂">
								  		<span class="checkmark"></span>
								 </label>
								 <br>
<!-- 								 <br> -->
								
<!-- 					       		<label><input type="checkbox" name="prod_type_id" value="食" > 食</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="衣" > 衣</label>　<br> -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="住" > 住</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="行" > 行</label>　<br> -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="育" > 育</label>　　 -->
<!-- 								<label><input type="checkbox" name="prod_type_id" value="樂" > 樂</label>　<br> -->
<%-- 					        <%= Arrays.asList(prod_type_id).contains("樂")? "checked":"" %>  --%>
					        
<!--  					        <hr>  -->
<!--  					       	<h5><b style="background-color:bisque; color:black">價格區間</b></h5>  -->
							 <div class="w3-panel w3-leftbar w3-sand w3-xxlarge w3-serif">
						    	<p style="height:16px">價格區間</p>
						 	 </div>
<%-- 					       		<label><input type="radio" name="prod_price" value="0 and 50" <%= "0 and 50".equals(prod_price)? "checked":"" %> > $ 50以下</label>　<br> --%>
<%-- 								<label><input type="radio" name="prod_price" value="50 and 100" <%= "50 and 100".equals(prod_price)? "checked":"" %>> $ 50~100</label>　<br> --%>
<%-- 								<label><input type="radio" name="prod_price" value="101 and 200" <%= "101 and 200".equals(prod_price)? "checked":"" %>> $ 101~200</label>　<br> --%>
<%-- 								<label><input type="radio" name="prod_price" value="200" <%= "200".equals(prod_price)? "checked":"" %>> $ 200以上</label>　<br> --%>
<!-- 							<br> -->

<!-- 								<hr> -->
								<label class="radio_ctn" style="display:inline; font-size:16px">$ 50以下
							 	 	<input type="radio" name="prod_price" value="0 and 50" >
								  		<span class="radio_checkmark"></span>
								 </label>
								 <br>
								 <br>
							 	 <label class="radio_ctn" style="display:inline; font-size:16px">$ 50~100
							 	 	<input type="radio" name="prod_price" value="50 and 100">
<%-- 							 	 	<input type="radio" name="prod_price" value="50 and 100" <%= "50 and 100".equals(prod_price)? "checked":"" %>> --%>
								  		<span class="radio_checkmark"></span>
								 </label>
								 <br>
								 <br>
<!-- 							 	 <label class="radio_ctn" style="display:inline">$ 101~200 -->
<%-- 							 	 	<input type="radio" name="prod_price" value="101 and 200" <%= "101 and 200".equals(prod_price)? "checked":"" %>> --%>
<!-- 								  		<span class="radio_checkmark"></span> -->
<!-- 								 </label> -->
<!-- 								 &nbsp&nbsp&nbsp -->
<!-- 							 	 <label class="radio_ctn" style="display:inline">$ 200以上 -->
<%-- 							 	 	<input type="radio" name="prod_price" value="200" <%= "200".equals(prod_price)? "checked":"" %>> --%>
<!-- 								  		<span class="radio_checkmark"></span> -->
<!-- 								 </label> -->


							<input type="submit" value="查詢">
        					<input type="hidden" name="action" value="listAll_ByCompositeQuery">
					    
					     </FORM>
	
						</div>
						
					
					</div>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	
	
	
	
	
	

<!-- 	<section class="training-area section-gap"> -->
<!-- 		<div class="container-fluid "> -->
<!-- 			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; bottom: auto;"> -->
				<div class="col-xs-7 offset-xs-1 col-md-7 offset-md-1 " style="top: 15px; bottom: auto;">
					<div class="row">
						<div class="col-xs-12 col-sm-6">
						
							<!-- Slideshow container -->
							<div class="slideshow-container">
									
								<!-- Full-width images with number and caption text -->
								<% int i =1;  %> 
								<c:forEach var="prodImgVO" items="${prodImgList}">
									<div class="mySlides" >
<!-- 							    <div class="mySlides fade"> -->
										<div class="numbertext"><%=i%>/<%=prodImgList.size()%></div>
										<img src="<%=request.getContextPath()%>/util/PicReader2?prod_img_id=${prodImgVO.prod_img_id}" style="width:100%">
										<div class="text"> </div>
									</div>
									<% i++; %> 
								</c:forEach>
										
								<!-- Next and previous buttons -->
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
							<br>
									
							<!-- The dots/circles -->
							<div style="text-align:center">
								<% int j =1; %> 
								<c:forEach var="prodImgVO" items="${prodImgList}">
									<span class="dot" onclick="currentSlide(<%=j%>)"></span> 
									<% j++; %> 
								</c:forEach>
							</div>
						</div>

						<div class="col-xs-12 col-sm-6">
							<h3>${prodVO.prod_name}
								<span style="font-size: 1em; color: Tomato; text-indent:300px;">
									<i class="fas fa-coins"></i>
									<b>${prodVO.prod_price}</b>
								</span>
							</h3>
							<p>${prodVO.prod_info}</p>
								
							<div class="input-group-icon mt-10" style="width: 120px; ">
								<div class="icon">
									<i class="fa fa-thumb-tack" aria-hidden="true"></i>
								</div>
								<div class="form-select" id="default-select" style="display:inline">
									<select style="width: 120px" id="prod_qty" name="prod_qty" onchange="qtyAlert()">
										<option value="0">數量</option>
									<% for(int s=1 ; s<= prodVO.getProd_stock() ; s++) { %>
										<option value=<%=s%>><%=s %></option>
									<% } %>
									</select>
								</div>
							</div> <span id="errorMsg" style="display:inline; text-align:center; color:red; padding-top: 35px;"></span>
<%-- 							</span>庫存: ${prodVO.prod_stock} --%>
									
							<div style="text-align:right; padding-top:30px">
<!-- 								<input type="submit" value="加入購物車" class="genric-btn primary-border circle button" style="width: 120px;" id="cartBtn"> -->
								<a href="#" class="genric-btn primary-border circle button" style="width: 150px;" id="cartBtn">加入購物車</a>	
								<!-- modal屬性 data-toggle="modal" data-target="#staticModal" -->
							</div>
							<br>
							<div style="text-align:right;">
<!-- 								<i class="glyphicon glyphicon-heart-empty" style="color: red; font-size:20px"  id="heart"></i> -->
								<div class="buttons" style="display:inline">
						        	<span class="like-btn" id="like-btn" style="display:inline; padding-right:30px"></span>
						        </div>
								<input type="submit" value="收藏" class="button button genric-btn primary-border circle" id="favBtn" style="width: 150px; display:inline">
							</div> 
						</div>
					</div>

						<div class="container">
							<div id="sider" class="n-browse-nav m-sticky-on"
								style="top: 150px; bottom: auto;">
								<div class="row">
									<div class="col-lg-9 cl-md-9" style="top: 30px; bottom: auto;">
										<h4>商品詳情</h4>
										<hr>
										<div class="">
												${prodVO.prod_des}
										</div>
									</div>
								</div>
							</div>
						</div>
						
				</div>
		</div>
	</div>
<!-- 	</section> -->
	
	
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
	
	

<script type="text/javascript">
	var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
}


var t = 0;

//剛開始進來顯示是否已追蹤
$.ajax({
	url: '<%=request.getContextPath()%>/prodtrack.do',
	type: "get",
	data: { 'action': 'checkFav', 'prod_id': '${prodVO.prod_id}' },
	dataType: 'json',
	success: function(res){
		console.log(res);
		if (res=="1"){
			t=1;
			 $("#like-btn").toggleClass('is-active');
// 			$("#heart").attr("class", "glyphicon glyphicon-heart");
		}
	},
	error: function(res){
		console.log(res);
	}

});



// 加入/取消追蹤 & 愛心切換
$("#favBtn").click(function(){
	$("#like-btn").toggleClass('is-active');
	console.log("favfavfav");
	console.log('${prodVO.prod_id}');
	++t;
	
<%-- 	if (<%= memVO == null%>){ --%>
// 		swal({
//             title: "請先登入",
//             html: "按下確定後前往登入畫面",
//             type: "warning", // type can be "success", "error", "warning", "info", "question"
//             showCancelButton: true,
//         	showCloseButton: true,
//         }).then(
//         	   function (result) {
//                 if (result) {
<%--                 	window.location.href = "<%=request.getContextPath()%>/front-end/members/login.jsp"; --%>
//                 }
//         }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
//         		swal("取消", "取消登入", "error");
//         }).catch(swal.noop);
// 	} else{
		if (t%2==1){
			
			$.ajax({
				url: '<%=request.getContextPath()%>/prodtrack.do',
				type: "get",
				data: { 'action': 'addFav', 'prod_id': '${prodVO.prod_id}' },
				dataType: 'json',
				success: function(res){
					console.log("success="+res);
					if (res==0){
						alert("請登入");
					} else {
// 						$("#like-btn").toggleClass('is-active');
// 						$("#heart").attr("class", "glyphicon glyphicon-heart");
						console.log("11111");
//	 					alert("商品已加入追蹤");
// 						swal("完成", "商品已加入追蹤", "success").catch(swal.noop);
					}
				},
				error: function(res){
					console.log("error="+res);
				}
			
			});
		} else {
			
			$.ajax({
				url: '<%=request.getContextPath()%>/prodtrack.do',
				type: "get",
				data: { 'action': 'cancelFav', 'prod_id': '${prodVO.prod_id}' },
				dataType: 'json',
				success: function(res){
					console.log("success="+res);
					if (res==0){
						alert("請登入");
					} else {
// 						$("#like-btn").toggleClass('is-active');
// 						$("#heart").attr("class", "glyphicon glyphicon-heart-empty");
						console.log("22222");
//	 					alert("商品已取消追蹤");
// 						swal("完成", "商品已取消追蹤", "warning").catch(swal.noop);
					}
				},
				error: function(res){
					console.log("error="+res);
				}
			
			});
		}
// 	}
	
	
});

  

//加入購物車
var c=0;
	$("#cartBtn").click(function(){
		$('#errorMsg').text('');
		console.log("33333");
		console.log('${prodVO.prod_id}');
		var prod_qty = $("#prod_qty").val();
		console.log("prod_qty=" + prod_qty);
		if(prod_qty == 0){
			$('#errorMsg').text('　　請選擇數量');
			return;
		} else {
			c++;
			console.log("ajax");
			console.log("c= " + c);
			if(c<2){
				$.ajax({
					url: '<%=request.getContextPath()%>/prodcart.do?action=addCart',
					type: "get",
					data: { 'action': 'addCart', 'prod_qty': prod_qty, 'prod_id': '${prodVO.prod_id}' },
					dataType: 'json',
					success: function(res){
						console.log("success="+res);
						if (parseInt(res) > 0){
							$('#itemCount').html(res).css('display', 'block');
						}
					},
					error: function(res){
						console.log("error="+res);
					}
				
				});
// 				alert("商品已加入購物車");
				swal("完成", "商品已加入購物車", "success").catch(swal.noop);
				$("#cartBtn").attr("class", "genric-btn info-border circle button");
				$("#cartBtn").html("前往結帳");
			}
			if(c>=2){
				$("#cartBtn").attr('href', '<%=request.getContextPath()%>/prodcart.do?action=check_Cart');
			}
			
		}
	});

  
	//sweet alert自訂預設值
	swal.setDefaults({
	    confirmButtonText: "確定",
	    cancelButtonText: "取消"
	});

	
	function qtyAlert(){
		$('#errorMsg').text('');
		var prod_qty = $("#prod_qty").val();
		if (prod_qty==0){
			$('#errorMsg').text('　　請選擇數量');
		}
	}
	
	$("ul.nav-menu li").attr('class', "" );
	$("#shop").attr('class', 'menu-active menu-has-children' )

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