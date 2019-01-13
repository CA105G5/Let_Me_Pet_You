<%@page import="com.mem.model.MemVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.missingCase.model.*"%>

<%
	missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");


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
<body onload="connect();" onunload="disconnect();">

	<jsp:include page="/index_Header.jsp"
		flush="true" />

		<div class="container">
			<div class="row d-flex justify-content-center ">
				<div class="col-md-9 pb-40 header-text text-center">
					<h1 class="pb-10">失蹤案例新增</h1>
					<c:if test="${not empty errorMsgs}">
								<div>
									<font style="color:red">請修正以下錯誤:</font>
									<ul>
									    <c:forEach var="message" items="${errorMsgs}">
											<li style="color:red">${message}</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
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
                                <strong>失蹤案例新增</strong> <small>請輸入寵物資料：</small>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label" >寵物名稱：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-dog"></i></div>
                                        <input class="form-control" name="missingName">
                                    </div>
                                    <small class="form-text text-muted">ex. 小白/阿明/乖乖</small>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">寵物種類：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-paw"></i></div>
                                        <input class="form-control" name="missing_type">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">失蹤地點：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fas fa-map-marker-alt"></i></div>
                                        <input class="form-control" name="loc">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">失蹤日期：</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="far fa-clock"></i></div>
                                        <input class="form-control" name="hiredate">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">寵物大頭照：</label>
                                    <div class="input-group" id="preview">
                                    	<img width="250" height="200" src="<%=request.getContextPath()%>/front-end/donate/noPic.png" style="padding-right: 30px;"/>
                                    </div>
                                    <div style="text-align:center">
								<input type="file" class="upl custom-file-input" name="missing_img" id="missing_img">
								<label class="genric-btn info-border small" for="missing_img" >選擇圖片</label>
								</div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">失蹤內容描述：</label>
                                    <div class="input-group">
                                    <small class="form-text text-muted">可放入圖片</small>
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
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="missing_status_shelve" value="上架">
                            <input type="hidden" name="membno" value="<%=(memVO ==null)? "" : memVO.getMemb_id()%>">
                            
                            <div align="center">
                            <input type="submit"  value="送出"  style="width:120px;height:40px;font-size:20px;" onclick="sendMessage();">
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
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
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
		
	<!--推播-->
	    var MyPoint = "/missingCaseEchoServer";
	    var host = window.location.host;
	    var path = window.location.pathname;
	    var webCtx = path.substring(0, path.indexOf('/', 1));
	    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	    
		var statusOutput = document.getElementById("statusOutput");
		var webSocket;
		
		function connect() {
			// 建立 websocket 物件
			webSocket = new WebSocket(endPointURL);
			
			webSocket.onopen = function(event) {
				
			};

			webSocket.onmessage = function(event) {

			};

			webSocket.onclose = function(event) {
				
			};
		}
		
		function sendMessage() {
			swal("新增成功！","","success");
		   
			var missing_url = "<%=request.getContextPath()%>/front-end/missingCase/listAllMissingCase.jsp";
			
			 var jsonObj = {"missing_url" : missing_url};
			 webSocket.send(JSON.stringify(jsonObj));
		}

		
		
		
		function disconnect () {
			webSocket.close();
		}
	
		
		
	</script>
</body>
</html>