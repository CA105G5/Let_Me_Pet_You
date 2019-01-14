<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
	RescueVO rescueVO  = (RescueVO) request.getAttribute("rescueVO");
	MemVO memVO =(MemVO) session.getAttribute("memVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>浪我陪你-新增救援</title>

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



	<jsp:include page="/index_Header.jsp" flush="true" />

	
	
	<section style="padding-top:30px" class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-xs-12 col-sm-2" style="top: 10px; bottom: auto;">
						<h3>救援</h3>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援</a></h5>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">今日救援地圖</a></h5>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></h5>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp">待完成救援案例</a></h5>
						<hr>
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
							<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/rescue/rescue.do" enctype="multipart/form-data">
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">救援案例名稱</label>
						  			<input type="text" class="form-control" placeholder="救援案例名稱" 
						  				   value="<%= (rescueVO==null)? "" : rescueVO.getRsc_name()%>" id="rsc_name" name="rsc_name" style="width: 500px;">
								</div>
								<br>
								<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">地區</label>
									<select class="form-control custom-control" id="reg_id" name="reg_id" style="width: 500px; height:32px;">
									
									    <c:forEach var="regionVO" items="${regionSvc.all}">
										<option value="${regionVO.reg_id}" ${(rescueVO.rsc_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
									    </c:forEach>
								  	</select>
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" for="rsc_add" style="width: 150px;">救援案例地點</label>
								  	<input type="text" class="form-control" placeholder="救援案例地點" 
								  		   value="<%= (rescueVO==null)? "" : rescueVO.getRsc_add()%>" id="rsc_add" name="rsc_add" style="width: 500px;">
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">上傳照片</label>
						  			<input type="file" class="form-control" id="rsc_img" name="rsc_img" multiple style="width: 500px;">
						  			<br>
						  			<br>
						  			<br>
						  			<br>
						  			<br>
						  			<DIV id="preview"><img src="<%=request.getContextPath()%>/front-end/donate/noPic.png" width="100px" style="bottom-padding: 50px"></DIV>
<!-- 						  			<input type="file" class="form-control" id="prod_ani_type_id" name="prod_ani_type_id" style="margin-left:150px;"> -->
<!-- 									<label class="form-control" for="prod_ani_type_id" style="text-align:center; ">選擇檔案</label> -->
								</div>
								<br>
								<div class="input-group">
									<label class="input-group-addon" style="width: 150px;">救援案例描述</label>
						  			<textarea name="rsc_des" id="rsc_des" rows="10" cols="80"><%= (rescueVO==null)? "" : rescueVO.getRsc_des()%></textarea>
			            			<script> CKEDITOR.replace( 'rsc_des', {}); </script> 
			            			<br>
								</div>
								<br>
									<input type="hidden" name="rsc_sponsor" value="${memVO.memb_id}">
									<input type="hidden" name="action" value="insert">
			            			<input type = "submit" value = "新增" style="text-align:center;">
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