<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.rescue.model.*"%>
<%@ page import="com.rescuing.model.*"%>
<%@ page import="com.Adoption.model.*"%>
<%@ page import="com.AdoptApply.model.*"%>
<%@ page import="java.util.*"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO");
String memb_id = memVO.getMemb_id();

MemService memSvc = new MemService();
List<AdoptionVO> list_adoption = memSvc.selectAdoption(memb_id);
pageContext.setAttribute("list_adoption",list_adoption);
List<AdoptApplyVO> list_adoptapply = memSvc.selectAdoptApply(memb_id);
pageContext.setAttribute("list_adoptapply",list_adoptapply);

%>

<html>
<head>
<%-- Mobile Specific Meta --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>所有通知</title>
			
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body>
<jsp:include page="/index_Header.jsp" flush="true" />




<br><br><br><br><br><br><br><br><br>
<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-2 cl-md-2" style="top: 180px; bottom: auto;"></div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-10">
						<div class="row">
							<div class="page-header">
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
								
								<c:if test="${not empty msg}">
									<div>
										<font style="color:red">${msg}</font>
									</div>
								</c:if>
								
								<h1>認養案例紀錄列表 <small>點擊案例名稱查看詳情</small></h1>
							
								<div class="container">
									<div role="tabpanel">
									    <!-- 標籤面板：標籤區 -->
									    <ul class="nav nav-tabs" role="tablist">
									        <li role="presentation" class="active"> 
									            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">發起的認養</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">欲認養的案例</a>
									        </li>
									    </ul>
									
									    <!-- 標籤面板：內容區 -->
									    <br>
									    <div class="tab-content">
									        <div role="tabpanel" class="tab-pane active" id="tab1">

												<table id="table1" class="table table-striped table-bordered table-hover" style="width:800px">
												
														
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th>認養案例編號</th>
															<th>認養案例寵物種類</th>
															<th>認養案例發起時間</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="AdoptionVO" items="${list_adoption}">
															
																<% no++; %>
															<tr>
																<td><%=no %></td>
																<td>${AdoptionVO.adopt_id}</td>
																<td>${AdoptionVO.adopt_species}</td>
																<td>${AdoptionVO.adopt_btime}</td>
															</tr>
															
														</c:forEach>
													</tbody>
												</table>
															        
									        </div>
									        <div role="tabpanel" class="tab-pane active" id="tab2">
												<table id="table2" class="table table-striped table-bordered table-hover" style="width:800px">
														
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															
															<th>認養案例編號</th>
															<th>認養申請描述</th>
															<th>認養申請審核狀態</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no2=0;%>
														
														<c:forEach var="AdoptApplyVO" items="${list_adoptapply}">
																<% no2++; %>
															<tr>
																<td><%=no2 %></td>
																<td>${AdoptApplyVO.adopt_id}</td>
																<td>${AdoptApplyVO.adopt_des}</td>
																<td>${AdoptApplyVO.adopt_id_status}</td>
																
															</tr>
															
														</c:forEach>
													</tbody>
												</table>
															        
									        </div>

										    
										   
									    
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



<%-- 模板後script 加在自己的script前--%>
				<!-- 注意!!! 若有多個jquery會衝突 -->
<!-- 	<script src="https://code.jquery.com/jquery.js"></script>  -->
	<script src="<%=request.getContextPath()%>/horse_UI_template/js/jquery.dataTables.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script>
		$(document).ready(function() {
		    $('#table1').DataTable();
		    $('#table2').DataTable();
		} );
	</script>
<%-- RWD--%>
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
<!-- 			<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</body>
</html>