<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%


%>

<jsp:useBean id="ordSvc" scope="page" class="com.ord.model.OrdService" />
<jsp:useBean id="ordItemSvc" scope="page" class="com.orditem.model.OrdItemService" />
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Horse Club</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/linearicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/owl.carousel.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/horse_UI_template/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js'></script>

<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>


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
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>
</head>
<body>


<!-- 	<section class="training-area section-gap"> -->
		<div class="container">
<!-- 			<div class="row"> -->
<!-- 				<form>  -->
					<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<hr>
							<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prod_id}" alt="">
							<h5>${prodSvc.getOneProd(prod_id).prod_name}
								<span style="font-size: 1em; color: Tomato; text-indent:300px;">
									<i class="fas fa-coins"></i>
									<b>${prodSvc.getOneProd(prod_id).prod_price}</b>
								</span>
								X ${ordItemSvc.getOneOrdItem(prod_id, ord_id).ord_item_qty}
							</h5>
					</div>
					
					<div class="form-group" style="width:700px">
							<h3>檢舉理由</h3>
							<hr>
							<h5>${ordItemSvc.getOneOrdItem(prod_id, ord_id).ord_item_rt_comm} </h5><br> 
							<div>${ordItemSvc.getOneOrdItem(prod_id, ord_id).ord_item_rt_pic} </div>
					</div>
					
					
					
					<h3>審核</h3>
					<hr>
					<span id="result_error" style="color:red"></span>
					<span id="reason_error" style="color:red"></span>
					<div class="input-group-icon mt-10" style="width: 200px; ">
						<div class="icon">
							<i class="fa fa-thumb-tack" aria-hidden="true"></i>
						</div>
						<div class="form-select" id="default-select">
							<select style="width: 120px" id="report_result" name="report_result">
								<option value="0">審核結果</option> 
								<option value="通過" >通過</option>
								<option value="不通過" >不通過</option>
							</select>
						</div>
					</div> 
					<br>
					
					

 		    		<div class="form-group" style="width:700px"> 
<!--  		    			<label for="reason" class="pull-left">審核描述</label>  -->
 		    			<textarea class="form-control" id="reason" rows="5" placeholder="請輸入審核理由"></textarea> 
 		    		</div> 
 		    		<br>
 		    		<input type="submit" value="送出" id="submit">
<!--  		    		<input type="hidden" name="action"  value="getOne_For_Report_Update"> -->
 		    		<input type="hidden" name="prod_id"  value="${prod_id}">
					<input type="hidden" name="ord_id"  value="${ord_id}">
					<input type="hidden" name="img"  value="">
<!--  		    	<input type="submit" value="取消"> -->
 		    		
 		    		
<!--  		    	</form>  -->
<!-- 			</div> -->
		</div>
<!-- 	</section> -->

<script type="text/javascript">
	
	 $("#submit").on('click', function () {
		 var c=0;
		 $("#result_error").text("");
		 $("#reason_error").html("");
		 console.log("#report_result="+$("#report_result").val());
		 console.log("#reason="+$("#reason").val());
		 console.log("ord_id="+ '${ord_id}');
		 console.log("prod_id="+ '${prod_id}');
		 
		 var has_empty = false;
		    
		 if ($("#report_result").val()==0){
			 $("#result_error").text("請輸入審核理由");
			 has_empty = true;
			 c++;
		 } 
		 
		 if ($("#reason").val()==null || $("#reason").val().trim().length==0){
			 has_empty = true;
			 if (c==0)
			 	$("#reason_error").text("請輸入審核描述");
			 else
			 	$("#reason_error").html("<br>請輸入審核描述");
			 
		 } 
		 if ( has_empty ) { 
		 	 return false; 
		 }
		 
		 var $this = $(this);
		 console.log("11111111");
		 console.log("reason=" + $("#reason").val());
		 console.log("report_result=" + $("#report_result").val());
		 console.log("22222222");
	     	$.ajax({
	    		url: '<%=request.getContextPath()%>/ordItem/ordItem.do',
	    		type: "post",
	    		data: { 'action': 'getOne_For_Review_Update', 'ord_id': '${ord_id}' , 'prod_id': '${prod_id}', 'ord_item_review' : $("#report_result").val(), 'ord_item_rv_des' : $("#reason").val()  },
	    		dataType: 'json',
	    		success: function(res){
	    			console.log("0000000000");
	    			console.log(res);
	    			swal({
	    				title: "完成!",
	    				text: "已完成審核",
	    				type: "success",
	    				timer: 3000
	    			});
	    			console.log("11111111");
	    			window.location.href = "<%=request.getContextPath()%>/back-end/ord/back_listAllOrd.jsp";
	    			console.log("22222222");
	    		},
	    		error: function(res){
	    			console.log("eeeeeeee");
	    			console.log("res="+res);
	    		}
	    	});
		});
</script>

	<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
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