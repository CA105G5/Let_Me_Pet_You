<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
RescueVO rescueVO = (RescueVO) request.getAttribute("rescueVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完成救援報告</title>

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

</style>
</head>
<body>


	
	
	<section style="padding-top:30px" class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-xs-12 col-sm-2" style="top: 10px; bottom: auto;">
					</div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-1"></div>
					<div class="col-xs-12 col-sm-9">
						<div class="row">
							<h1 class="pb-10">新增救援案例</h1>
							<%-- 錯誤表列 --%>
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
							<form METHOD="post" ACTION="<%=request.getContextPath()%><%=request.getContextPath()%>/front-end/rescuing/rescuing.do" enctype="multipart/form-data">
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">救援案例編號</label>
						  			<input type="text" class="form-control"  readonly="readonly"
						  				   value="${rescuingVO.rsc_id}" id="rsc_id" name="rsc_id" style="width: 500px;">
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" for="rscing_ptcp" style="width: 150px;">填寫會員</label>
								  	<input type="text" class="form-control"  readonly="readonly"
								  		   value="${rescuingVO.rscuing_ptcp}" id="rscing_ptcp" name="rscing_ptcp" style="width: 500px;">
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">完成描述</label>
						  			<textarea name="rsc_des" id="rsc_des" rows="10" cols="80"><%= (rescueVO==null)? "" : rescueVO.getRsc_des()%></textarea>
			            			<script> CKEDITOR.replace( 'rsc_des', {}); </script> 
			            			<br>
								</div>
								<br>
									
								<br>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	<script>
		var i;
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
		$("#rsc_img").change(function() {
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
					var img = $("<img width='300' height='200'>").attr('src', e.target.result);
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
	
	</script>



</body>
</html>