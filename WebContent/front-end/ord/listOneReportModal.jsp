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

<!-- <link rel="stylesheet" -->
<!-- 	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" -->
<!-- 	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" -->
<!-- 	crossorigin="anonymous"> -->
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

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
 		    			<label for="reason" class="pull-left">檢舉理由</label> <span id="reason_error" style="color:red"></span>
 		    			<textarea class="form-control" id="reason" rows="5" placeholder="請輸入檢舉理由"></textarea> 
 		    		</div> 
 		    		<br>
 		    		<div class="form-group"> 
 		    			<label for="report_img" class="pull-left">上傳照片</label> <span id="pic_error" style="color:red"></span><br>
 		    			<input type="file" class="form-control" id="report_img" name="report_img" multiple style="width: 500px; padding-top: 30px"> 
 		    			<br> 
 		    			<div id="preview"></div> 
 		    		</div> 
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
	//預覽照片
	var i;
	var files = $("#form :file");
	$("#report_img").change(function() {
		$("#preview").html("");
		console.log("this="+this);
		readURL(this);
	});
	
	function readURL(input) {
		if (input.files && input.files.length>= 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(input.files[i]);
				reader.onload = function(e) {
				var img = $("<img width='300' height='200'>").attr('src', e.target.result);
					console.log(img);
					$("#preview").append(img).append("　　").append("　　");
				}
			}
		}
	}
	
	
	 $("#submit").on('click', function () {
		 $("#reason_error").text("");
		 $("#pic_error").text("");
		 console.log("$('#preview').html()="+$("#preview").html());
		 console.log("img_length=" + $("#preview").html().length);
		 
		 
		 var has_empty = false;
		    
		 if ($("#reason").val()==null || $("#reason").val().trim().length==0){
			 $("#reason_error").text("　　請輸入審核原因");
			 has_empty = true;
		 } 
		 
		 if ($("#preview").html().trim().length==0){
			 $("#pic_error").text("　　請上傳照片");
			 has_empty = true;
		 } 
		 if ( has_empty ) { 
		 	 return false; 
		 }
		 
		 var $this = $(this);
		 console.log("11111111");
		 console.log("$this.next().next().val()=ord_id=" + $this.next().next().val());
		 console.log("$this.next().val()=prod_id=" + $this.next().val());
		 console.log("img=" + $("#preview").html());
		 console.log("reason=" + $("#reason").val());
		 console.log("22222222");
		 console.log("<%=request.getContextPath()%>/ordItem/ordItem.do?action=getOne_For_Report_Update");
	     	$.ajax({
	    		url: '<%=request.getContextPath()%>/ordItem/ordItem.do?action=getOne_For_Report_Update',
	    		type: "get",
	    		data: { 'ord_id': $this.next().next().val() , 'prod_id': $this.next().val(), 'reason' : $('#reason').val(), 'img' : $('#preview').html()  },
	    		dataType: 'json',
	    		success: function(res){
	    			console.log("0000000000");
	    			console.log(res);
	    			swal({
	    				title: "完成!",
	    				text: "已完成檢舉",
	    				type: "success",
	    				timer: 3000
	    			});
	    			console.log("11111111");
	    			window.location.href = "<%=request.getContextPath()%>/front-end/ord/listAllOrd.jsp";
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