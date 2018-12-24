<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
	missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");
%>



<html>
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
<title>Horse Club</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/linearicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/animate.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/owl.carousel.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/product/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<style type="text/css">
p {
	　 font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}
</style>
<style>
</style>
</head>
<body>

	<jsp:include page="/front-end/missingCase/missing_case_header.jsp"
		flush="true" />

	<section class="service-page-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">失蹤案例新增</h1>
					<p>hello.</p>
				</div>
			</div>
			<div class="row">
				<!-- 左側邊 -->
				<div class="col-xs-12 col-sm-3">
					<div class="list-group">
						<a href="listAllMissingCase.jsp" class="list-group-item ">失蹤案例總覽</a>
						<a href="addMissing.jsp" class="list-group-item active">失蹤案例新增</a>
					</div>
				</div>

				<!-- 右邊內容區 -->
				<div class="col-xs-12 col-sm-9">
					<FORM METHOD="post" ACTION="miss.do">
						<div class="form-group">
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<label style="color: red">${message}</label>
									</c:forEach>
								</ul>
							</c:if>
					</FORM>

					<!-- 					<FORM action="miss.do" method=post enctype="multipart/form-data"> -->
					<!-- 						<input type="file" name="upfile" id="file01"> -->
					<!-- 						<table> -->
					<!-- 							<tr> -->
					<!-- 								<td>圖片預覽:</td> -->
					<!-- 								<td><img id="pre01"></td> -->
					<!-- 							</tr> -->
					<!-- 							<tr> -->
					<!-- 								<td>會員編號:</td> -->
					<!-- 								<td><input type="TEXT" name="membno" size="45" -->
					<%-- 									value="<%=(missingCaseVO == null) ? "ex.M000000001" : missingCaseVO.getMemb_id()%>" /></td> --%>
					<!-- 							</tr> -->
					<!-- 							<tr> -->
					<!-- 								<td>寵物名稱:</td> -->
					<!-- 								<td><input type="TEXT" name="missingName" size="45" -->
					<%-- 									value="<%=(missingCaseVO == null) ? "你的寵物" : missingCaseVO.getMissing_name()%>" /></td> --%>
					<!-- 							</tr> -->
					<!-- 							<tr> -->
					<!-- 								<td>內容描述:</td> -->
					<!-- 								<td><textarea name="missingDes"> -->
					<%-- 									<%=(missingCaseVO == null) ? "內容描述" : missingCaseVO.getMissing_des()%></textarea></td> --%>
					<!-- 							</tr> -->
					<!-- 							<tr> -->
					<!-- 								<td>失蹤日期:</td> -->
					<!-- 								<td><input name="hiredate" id="m_date1" type="text"></td> -->
					<!-- 							</tr> -->
					<!-- 							<tr> -->
					<!-- 								<td>地點</td> -->
					<!-- 								<td><input type="TEXT" name="loc" size="45" -->
					<%-- 									value="<%=(missingCaseVO == null) ? "失蹤地點" : missingCaseVO.getMissing_loc()%>" /></td> --%>
					<!-- 						</table> -->
					<!-- 						<br> <input type="hidden" name="action" value="insert"> -->
					<!-- 						<input type="submit" value="送出新增"> -->
					<!-- 					</FORM> -->
					<form class="form-area " id="myForm" action="mail.php"
						method="post" class="contact-form text-right">
						<div class="row">
							<div class="col-lg-4 form-group">
							<div class="single-element-widget mt-30">
									<h5 class="mb-30">失蹤寵物種類：</h5>
									<div class="default-select" id="default-select"">
										<select>
											<option value="1">貓</option>
											<option value="2">狗</option>
											<option value="1">其他</option>
										</select>
									</div>
								</div>
							
								<h5>寵物名稱：</h5>
								<input name="missingName" placeholder="Enter your name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter your name'"
									class="common-input mb-20 form-control" required="" type="text">
								<h5>會員編號：</h5>
								<input name="membno" placeholder="Enter your membno"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter your membno'"
									class="common-input mb-20 form-control" required="" type="text">
								<h5>失蹤日期：</h5>
								<input name="missingDate" placeholder="Enter your date"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter your date'"
									class="common-input mb-20 form-control" required="" type="text">
								<h5>失蹤地點：</h5>	
									<input name="loc" placeholder="Enter your location"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter your location'"
									class="common-input mb-20 form-control" required="" type="text">
								<div class="mt-20 alert-msg" style="text-align: left;"></div>
								<h5>內容描述：</h5>
							</div>
							<div class="col-lg-8 form-group">
								<h6>圖片預覽：</h6>
								<div class="upcoming-left">
									<img id="img" class="preview" src="img/g1.jpg" />
								</div>
								<div style="text-align:center">
								<input type="file" class="upl custom-file-input" name="upfile" id="file01">
								<label class="genric-btn info circle small" for="file01" >選擇圖片</label>
								</div>
							</div>
								<textarea class="single-textarea form-group"
									name="missingDes" placeholder="Messege"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'"></textarea>
					</form>
				</div>
			</div>
		</div>
	</section>



	<script>CKEDITOR.replace("missingDes");</script>
	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>

<% 
	  java.sql.Timestamp hiredate = null;
	  try {
		    hiredate = missingCaseVO.getMissing_date();
	   } catch (Exception e) {
		    hiredate = new java.sql.Timestamp(System.currentTimeMillis());
	   }
	%>
<script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
	  $.datetimepicker.setLocale('zh');
		        $('#m_date1').datetimepicker({
			       theme: '',              //theme: 'dark',
			       timepicker:false,       //timepicker:true,
			       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
			       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
				   value: '<%=hiredate%>', // value:   new Date(),
		           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		           //startDate:	            '2017/07/10',  // 起始日
		           //minDate:               '-1970-01-01', // 去除今日(不含)之前
		           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		        });
	</script>
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
</html>