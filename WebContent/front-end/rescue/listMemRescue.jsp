<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>


<%
	RescueVO rescueVO  = (RescueVO) request.getAttribute("rescueVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待完成的救援案例</title>


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

</style>
</head>
<body>



	<jsp:include page="/front-end/rescue/rescue_header.jsp" flush="true" />
	
			<div class="container">
			<div class="row">

<!-- 				左側邊list-group -->
 				<div class="col-xs-12 col-sm-3">
				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
					<h3>救援</h3>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">今日救援地圖</a></h5>
					<hr>
					<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></h5>
					<hr>

					
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>