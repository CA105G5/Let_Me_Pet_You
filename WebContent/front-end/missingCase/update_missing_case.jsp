<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>失蹤案例修改</title>

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
<script src="<%=request.getContextPath()%>/ckeditor2/ckeditor.js"></script>
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
					<p>hello.</p>
				</div>
			</div>
			<div class="row">
				<!-- 左側邊 -->

				<!-- 右邊內容區 -->
				<div class="col-xs-12 col-sm-12">

					<form class="form-area " action="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						method="post" class="contact-form text-right" enctype="multipart/form-data">
						<div class="row">
							<div class="col-lg-6 form-group">
							<h6>圖片預覽：</h6>
								<div id="preview">
									<img width="250" height="200" src="<%=(missingCaseVO == null)?request.getContextPath()+"/front-end/donate/noPic.png" :request.getContextPath()+"/missingcase/missingcase.do?missingcaseno="+missingCaseVO.getMissing_case_id()%>" style="margin-left: 150px;"/>								</div>
								<div style="text-align:center">
								<input type="file" class="upl custom-file-input" name="adopt_img" id="adopt_img">
								<label class="genric-btn info-border small" for="adopt_img" >選擇圖片</label>
								</div>
								
							</div>
							<div class="col-lg-6 form-group">
								<h5>寵物種類：</h5>
								<input name="missing_type" placeholder="Enter type"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter type'"
									class="common-input mb-20 form-control" required="" type="text" value="<%= (missingCaseVO ==null)? "" : missingCaseVO.getMissing_type() %>">
								<h5>寵物名稱：</h5>
								<input name="missingName" placeholder="Enter name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter name'"
									class="common-input mb-20 form-control" required="" type="text" value="<%= (missingCaseVO ==null)? "" : missingCaseVO.getMissing_name() %>">
								<h5>寵物失蹤地點：</h5>
								<input name="loc" placeholder="Enter location"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter location'"
									class="common-input mb-20 form-control" required="" type="text" value="<%= (missingCaseVO ==null)? "" : missingCaseVO.getMissing_loc() %>">
								<h5>寵物失蹤時間：</h5>
								<input name="hiredate" placeholder="Enter miss date"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter miss date'"
									class="common-input mb-20 form-control" required="" type="text" value="<fmt:formatDate value="<%=missingCaseVO.getMissing_date() %>"
										pattern="yyyy-MM-dd" />">
							<h5>失蹤內容描述：</h5>
								<div class="mt-20 alert-msg" style="text-align: left;"></div>
								<textarea class="single-textarea form-group"
									name="missingDes" placeholder="Messege"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'"><%= (missingCaseVO ==null)? "" : missingCaseVO.getMissing_des() %></textarea>
								<script> CKEDITOR.replace( 'missingDes', {}); </script> 
								<input name="membno" type="hidden" value="${missingCaseVO.memb_id}">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="missing_case_id" value="${missingCaseVO.missing_case_id}">
							</div>
				</div>
							<br>
							<input type="submit"  style="margin-left: 500px;" value="送出">
					</form>
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
					var img = $("<img width='250' height='200'>").attr('src', e.target.result).attr('style','margin-left: 150px;');
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
	
	</script>
</body>




</html>