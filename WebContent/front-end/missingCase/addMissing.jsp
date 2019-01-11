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
<!-- �Y�n�ϥ�fai�����~��icon�A�nimport CDN�A�ֱ���facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ �ۤv��css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	
<script defer src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<style type="text/css">
p {
	�@ font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
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

		<div class="container">
			<div class="row d-flex justify-content-center ">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">���ܮרҷs�W</h1>
				</div>
			</div>
			
	<form class="form-area " action="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						method="post" class="contact-form text-right" enctype="multipart/form-data">		
		<div class="content">
           <div class="animated fadeIn">
			<div class="row">
			<div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>���ܮרҷs�W</strong> <small>�п�J�d����ơG</small>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label" >�d���W�١G</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-dog"></i></div>
                                        <input class="form-control" name="missingName">
                                    </div>
                                    <small class="form-text text-muted">ex. �p��/����/�Ĩ�</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">�d�������G</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-paw"></i></div>
                                        <input class="form-control" name="missing_type">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">���ܦa�I�G</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fas fa-map-marker-alt"></i></div>
                                        <input class="form-control" name="loc">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">���ܤ���G</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="far fa-clock"></i></div>
                                        <input class="form-control" name="hiredate">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">�d���j�Y�ӡG</label>
                                    <div class="input-group" id="preview">
                                    	<img width="250" height="200" src="<%=request.getContextPath()%>/front-end/donate/noPic.png" style="padding-right: 30px;"/>
                                    </div>
                                    <div style="text-align:center">
								<input type="file" class="upl custom-file-input" name="adopt_img" id="missing_img">
								<label class="genric-btn info-border small" for="missing_img" >��ܹϤ�</label>
								</div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">���ܤ��e�y�z�G</label>
                                    <div class="input-group">
                                    <small class="form-text text-muted">�i��J�Ϥ�</small>
                                    </div>
                                    <textarea name="missingDes"></textarea>
                                    <script>
                                    CKEDITOR.replace( 'missingDes', {
     				                   extraPlugins: 'easyimage',
     				                      cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
     				                      cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',}); 
                                    </script>
                                </div>
                            </div>
                            <div align="center">
                            <input type="submit"  value="�e�X"  style="width:120px;height:40px;font-size:20px;">
                            </div>
                        </div>
                        </form>
                    </div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			</div>
		</div>
			<script>
		var i;
		var files = $("#form :file"); //�Y�u����@���n���ʺA�˦��A�h�i�H�ϥ�css��ܾ�
		$("#missing_img").change(function() {
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