<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescuing.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
RescuingVO rescuingVO = (RescuingVO) request.getAttribute("rescuingVO");
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
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
							
							<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/rescuing/rescuing.do" enctype="multipart/form-data">
   								<h1>完成案例報告</h1>
   								<br>
								<h4>救援案例編號：</h4>					  			
								<input type="text" name="rsc_id" value="${rescuingVO.rsc_id}" readonly="readonly" required="" class="single-input">
								<br>
								<h4>填寫會員暱稱：</h4>
								<input type="text" name="memb_nick" value="${memSvc.getOneMem(rescuingVO.rscing_ptcp).memb_nick}" readonly="readonly" required="" class="single-input">
								<br>
								<div class="single-element-widget mt-30">
									<h3 class="mb-30">Checkboxes</h3>
									<div class="switch-wrap d-flex justify-content-between">
										<p>01. Sample Checkbox</p>
										<div class="primary-checkbox">
											<input type="checkbox" id="default-checkbox">
											<label for="default-checkbox"></label>
										</div>
									</div>
									<div class="switch-wrap d-flex justify-content-between">
										<p>02. Primary Color Checkbox</p>
										<div class="primary-checkbox">
											<input type="checkbox" id="primary-checkbox" checked="">
											<label for="primary-checkbox"></label>
										</div>
									</div>
									<div class="switch-wrap d-flex justify-content-between">
										<p>03. Confirm Color Checkbox</p>
										<div class="confirm-checkbox">
											<input type="checkbox" id="confirm-checkbox">
											<label for="confirm-checkbox"></label>
										</div>
									</div>

								
								</div>
								<br>
								<h4>完成描述</h4>
						  		<textarea name="rscing_rv_des" id="rscing_rv_des" rows="10" cols="80"><%= (rescuingVO.getRscing_rv_des()==null)? "" : rescuingVO.getRscing_rv_des()%></textarea>
			            		<script> CKEDITOR.replace( 'rscing_rv_des', {}); </script> 
			            		<br>
								<br>
								<br>
								<button class="genric-btn success circle arrow">完成救援<span class="lnr lnr-arrow-right"></span></button>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



</body>
</html>