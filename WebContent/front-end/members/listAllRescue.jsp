<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.rescue.model.*"%>
<%@ page import="com.rescuing.model.*"%>
<%@ page import="java.util.*"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO");
String memb_id = memVO.getMemb_id(); 

System.out.println("11111111111111"+memb_id);

Map<String, String[]> map1 = new TreeMap<String, String[]>();
map1.put("rsc_sponsor",new String[] {memVO.getMemb_id()});
RescueService rescueSvc = new RescueService();
List<RescueVO> list =rescueSvc.getAll(map1);
pageContext.setAttribute("list",list);

Map<String, String[]> map2 = new TreeMap<String, String[]>();
map2.put("rscing_ptcp",new String[] {memVO.getMemb_id()});
RescuingService rescueingSvc = new RescuingService();
List<RescuingVO> list2 =rescueingSvc.getAll(map2);
pageContext.setAttribute("list2",list2);
String ntf_src_id = (String)request.getAttribute("ntf_src_id");
// String tab = (String) request.getAttribute("tab");
// System.out.println("tab=" + tab);
// Integer tab_int = null;
// if (tab==null){
// 	tab="1";
// 	tab_int = new Integer(tab);
// }
%>
<jsp:useBean id="rescueSvc2" scope="page" class="com.rescue.model.RescueService" />
<html>
<head>
<%-- Mobile Specific Meta --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
<title>浪我陪你-所有救援</title>
			
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
								
								<h1>救援案例紀錄列表 <small>點擊案例名稱查看詳情</small></h1>
							
								<div class="container">
									<div role="tabpanel">
									    <!-- 標籤面板：標籤區 -->
									    <ul class="nav nav-tabs" role="tablist">
									        <li role="presentation" class="active"> 
									            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">發起的救援</a>
									        </li>
									        <li role="presentation">
									            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">參與的救援</a>
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
															<th>救援名稱</th>
															<th>救援地址</th>
															<th>救援狀態</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="rescueVO" items="${list}">
															
																<% no++; %>
															<tr id="${rescueVO.rsc_id}">
																<td><%=no %></td>
																<td>${rescueVO.rsc_name}</td>
																<td>${rescueVO.rsc_add}</td>
																<td>${rescueVO.rsc_sta}</td>
															</tr>
															
														</c:forEach>
													</tbody>
												</table>
															        
									        </div>
									        <div role="tabpanel" class="tab-pane" id="tab2">
												<table id="table2" class="table table-striped table-bordered table-hover" style="width:800px">
														
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th>救援名稱</th>
															<th>救援地址</th>
															<th>救援狀態</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no2=0;%>
														
														<c:forEach var="rescuingVO" items="${list2}">
																<% no2++;%>
															<tr id="${rescuingVO.rsc_id}">
																<td><%=no2 %></td>
																<td>${rescueSvc2.getOneRescue(rescuingVO.rsc_id).rsc_name}</td>
																<td>${rescueSvc2.getOneRescue(rescuingVO.rsc_id).rsc_add}</td>
																<td>${rescuingVO.rscing_sta}</td>
																
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
<% if(ntf_src_id != null){
%>

<script type="text/javascript">
<%
System.out.println("ntf_src_id="+ntf_src_id);
%>
$(function(){
	$("#<%=ntf_src_id%>").css("background-color","#77DDFF");
//  	$("#tab1").attr('class', "tab-pane" );
//  	$("#tab2").attr('class', "tab-pane" );
<%-- 	$("#<%=ntf_src_id%>").parent().parent().parent().parent().attr("class","tab-pane active") ;  --%>
 	
});
			
</script>
	
	
	
<%	}%>
<script>
$("ul.nav-menu li").attr('class', "" );
$("#member").attr('class', 'menu-active menu-has-children' )

</script>

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