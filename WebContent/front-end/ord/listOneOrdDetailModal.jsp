<%@page import="com.orditem.model.OrdItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	OrdItemVO ordItemVO  = (OrdItemVO) session.getAttribute("ordItemVO_Modal");
%>

<jsp:useBean id="ordSvc" scope="page" class="com.ord.model.OrdService" />
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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
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


/* timeline樣式 */
* {
  box-sizing: border-box;
}

/* Set a background color */
body {
  background-color: #474e5d;
  font-family: Helvetica, sans-serif;
}

/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: white;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background-color: white;
  border: 4px solid #FF9F55;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid white;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent white;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.content {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
/* Place the timelime to the left */
  .timeline::after {
    left: 31px;
  }

/* Full-width containers */
  .container {
    width: 100%;
    padding-left: 70px;
    padding-right: 25px;
  }

/* Make sure that all arrows are pointing leftwards */
  .container::before {
    left: 60px;
    border: medium solid white;
    border-width: 10px 10px 10px 0;
    border-color: transparent white transparent transparent;
  }

/* Make sure all circles are at the same spot */
  .left::after, .right::after {
    left: 15px;
  }

/* Make all right containers behave like the left ones */
  .right {
    left: 0%;
  }
}



</style>
</head>
<body>


	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 1000px; bottom: auto; overflow: hidden" >
				<div class="col-xs-12 col-sm-12">
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<h3>訂單內容</h3>
							<hr>
							<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO_Modal.prod_id}" alt="">
							<h5>${prodSvc.getOneProd(ordItemVO_Modal.prod_id).prod_name}
								<span style="font-size: 1em; color: Tomato; text-indent:300px;">
									<i class="fas fa-coins"></i>
									<b>${prodSvc.getOneProd(ordItemVO_Modal.prod_id).prod_price}</b>
								</span>
								X ${ordItemVO_Modal.ord_item_qty}
							</h5>
						</div>
						<br>
						<div class="col-xs-12 col-sm-12">
							<h3>收件人資訊</h3>
							<hr>
							<table>
								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_receiver}</td></tr>
								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_rc_tel}</td></tr>
								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_rc_add}</td></tr>
								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_rc_comm}</td></tr>
							</table>
						</div>
						<br>
						<div class="col-xs-12 col-sm-12" style="display: ${ordItemVO_Modal.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
							<hr>
							<table>
								<tr><th>檢舉狀態</th><td>${ordItemVO_Modal.ord_item_rt_status}</td></tr>
								<tr><th>檢舉時間</th><td>${ordItemVO_Modal.ord_item_rt_date}</td></tr>
								<tr><th>檢舉理由</th><td>${ordItemVO_Modal.ord_item_rt_comm} <br> ${ordItemVO_Modal.ord_item_rt_pic} </td></tr>
								<tr><th>檢舉審核結果</th><td>${ordItemVO_Modal.ord_item_review==null? "未審核": ordItemVO_Modal.ord_item_review}</td></tr>
								<tr><th>檢舉審核描述</th><td>${ordItemVO_Modal.ord_item_rv_des==null? "未審核": ordItemVO_Modal.ord_item_rv_des}</td></tr>
							</table>
						</div>
						<br>
						<div class="col-xs-12 col-sm-12">
							<h3>訂單狀態</h3>
							<hr>
							<c:choose>
							    <c:when test="${ordItemVO_Modal.ord_item_rt_status.equals('已檢舉')}">
							        <span style="text-align: right; display:inline">已檢舉</span>
							    </c:when>
							    <c:when test="${ordItemVO_Modal.ord_item_rt_status.equals('未檢舉')}">
							        <span style="text-align: right; display:inline">已收貨</span>
							    </c:when>
							    <c:when test="${ordItemVO_Modal.ord_item_rc_status==null}">
							        <span style="text-align: right; display:inline">待收貨</span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
						</div>
						<br>
						<div class="col-xs-12 col-sm-12">
							<h3>訂單歷史</h3>
							<hr>
							<div class="timeline">
								<div class="container right" style="display: ${ordItemVO_Modal.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
								    <div class="content">
								      	<h2>檢舉時間</h2>
								      	<p>${ordItemVO_Modal.ord_item_rt_date}</p>
								    </div>
								</div>
								<div class="container right">
								    <div class="content">
								      	<h2>收貨時間</h2>
								      	<p>${ordItemVO_Modal.ord_item_rc_date}</p>
								    </div>
								</div>
								<div class="container right">
								    <div class="content">
								      	<h2>出貨時間</h2>
								      	<p>${ordItemVO_Modal.ord_item_sp_date}</p>
								    </div>
								</div>
								<div class="container right">
								  	<div class="content">
								    	<h2>訂單成立</h2>
								    	<p>${ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_date}</p>
								    </div>
								</div>
							</div>
						
						
						
							
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>訂單時間</th><td>${ordSvc.getOneOrd(ordItemVO_Modal.ord_id).ord_date}</td></tr> --%>
<%-- 								<tr><th>出貨時間</th><td>${ordItemVO_Modal.ord_item_sp_date}</td></tr> --%>
<%-- 								<tr><th>收貨時間</th><td>${ordItemVO_Modal.ord_item_rc_date}</td></tr> --%>
<%-- 								<tr><th>檢舉時間</th><td>${ordItemVO_Modal.ord_item_rt_date}</td></tr> --%>
<!-- 							</table> -->
						</div>
					</div>
						
					</div>
				</div>
			</div>
	</section>

<script type="text/javascript">


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