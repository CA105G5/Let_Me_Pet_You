<%@page import="com.mem.model.MemVO"%>
<%@page import="com.Adoption.model.AdoptionVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
	AdoptionVO adoptionVO = (AdoptionVO) request.getAttribute("adoptionVO");

	MemVO memVO = (MemVO) session.getAttribute("memVO");
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
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script src="jquery-3.3.1.min.js"></script>
<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	
<script defer src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
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

	<jsp:include page="/index_Header.jsp"
		flush="true" />

	<section class="service-page-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center ">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">認養案例新增</h1>
				</div>
			</div>
			<div class="row">
				<!-- 左側邊 -->

				<!-- 右邊內容區 -->
				<div class="col-xs-12 col-sm-12">

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
					<form class="form-area " action="<%=request.getContextPath()%>/front-end/adopt/adoptionServlet.do"
						method="post" class="contact-form text-right" enctype="multipart/form-data">
						<div class="row">
							<div class="col-lg-4 form-group">
								<h5>寵物種類：</h5>
								<input name="adopt_species" placeholder="Enter species"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter species'"
									class="common-input mb-20 form-control" required="" type="text">
							<div class="single-element-widget mt-30">
								</div>
							<h6>圖片預覽：</h6>
								<div id="preview">
									<img width="250" height="200" src="<%=request.getContextPath()%>/front-end/donate/noPic.png" style="padding-right: 30px;"/>
								</div>
								<div style="text-align:center">
								<input type="file" class="upl custom-file-input" name="adopt_img" id="adopt_img">
								<label class="genric-btn info-border small" for="adopt_img" >選擇圖片</label>
								</div>
								
								<input name="adopt_sponsor" type="hidden" value="<%=(memVO ==null)? "" : memVO.getMemb_id()%>">
							</div>
							<div class="col-lg-8 form-group">
								<h5>領養內容描述：</h5>
								<div class="mt-20 alert-msg" style="text-align: left;"></div>
								<textarea class="single-textarea form-group"
									name="adopt_des" placeholder="Messege"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'"></textarea>
								<script> CKEDITOR.replace( 'adopt_des', {
				                   extraPlugins: 'easyimage',
				                      cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
				                      cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',}); 
								</script>
							</div>
							<br>
							<input type="hidden" name="action" value="insert">
							<input type="submit"  style="margin-left: 750px;" value="送出">
					</form>
				</div>
			</div>
		</div>
	</section>

	<script>
		var i;
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
		$("#adopt_img").change(function() {
			$("#preview").html("");
			console.log(this);
			readURL(this);
		});
	
		function readURL(input) {
			if (input.files && input.files.length>= 0) {
				for (var i = 0; i < input.files.length; i++) {
					var reader = new FileReader();
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
					var img = $("<img width='250' height='200'>").attr('src', e.target.result);
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
	
	</script>
</body>




</html>