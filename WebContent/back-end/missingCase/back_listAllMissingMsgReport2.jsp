<%@page import="com.missingMsgReport.model.missingMsgReportVO"%>
<%@page import="com.missingMsgReport.model.missingMsgReportService"%>
<%@page import="com.missingMsg.model.missingMsgVO"%>
<%@page import="com.missingMsg.model.missingMsgService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	
	int x = 0;
	missingMsgReportService missingMsgReportSvc = new missingMsgReportService();
	List<missingMsgReportVO> list = missingMsgReportSvc.listAllReport();
	pageContext.setAttribute("list", list);

%>
<jsp:useBean id="missingMsgSvc" scope="page" class="com.missingMsg.model.missingMsgService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />


<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>失蹤寵物管理</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/backend_UI_template/assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/backend_UI_template/assets/css/style.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
	rel="stylesheet" />

<!-- w3 CSS tabs -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- w3 CSS tabs -->



<style>
#weatherWidget .currentDesc {
	color: #ffffff !important;
}

.traffic-chart {
	min-height: 335px;
}

#flotPie1 {
	height: 150px;
}

#flotPie1 td {
	padding: 3px;
}

#flotPie1 table {
	top: 20px !important;
	right: -10px !important;
}

.chart-container {
	display: table;
	min-width: 270px;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#flotLine5 {
	height: 105px;
}

#flotBarChart {
	height: 150px;
}

#cellPaiChart {
	height: 160px;
}
</style>
</head>

<body>

	<jsp:include page="/back-end/missingCase/back_missingCase_Header.jsp"
		flush="true" />

	<!-- Right Panel -->
	<div class="right-panel">
		<div class="content">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<h4 class="box-title">失蹤留言檢舉管理</h4>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table ">
								<thead>
									<tr>
										<th class="serial">#</th>
										<th>留言編號</th>
										<th>檢舉會員</th>
										<th>檢舉時間</th>
										<th class="avatar">失蹤留言檢舉原因</th>
										<th>檢舉狀態</th>
									</tr>
								</thead>
								<tbody>
									<%@ include file="page1.file"%>
									<c:forEach var="missingMsgReportVO" items="${list}"
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<tr>
											<td class="serial"><%=++x%></td>
											<td class="avatar">${missingMsgReportVO.missing_msg_id}
											</td>
											<td><span class="name">${memSvc.getOneMem(missingMsgReportVO.memb_id).memb_nick}</span></td>
											<td><span class=""><fmt:formatDate
														value="${missingMsgReportVO.missing_msg_rt_time}" pattern="yyyy-MM-dd" /></span></td>
											<td><span class="product">${missingMsgReportVO.missing_msg_rt_cont }</span>
											</td>
											<td><select name="bootstrap-data-table_length"
												aria-controls="bootstrap-data-table"
												class="form-control form-control-sm status">
												<option value="${missingMsgReportVO.missing_msg_rt_id}">未審核</option>
												<option value="${reportMissingVO.missing_msg_rt_id}">通過</option>
												<option value="${reportMissingVO.missing_msg_rt_id}">未通過</option>
											</select></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<%@ include file="page2.file"%>
						</div>
						<!-- /.table-stats -->
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col-lg-8 -->

		</div>
	</div>
	<!-- Footer -->
	<footer class="site-footer">
		<div class="footer-inner bg-white">
			<div class="row">
				<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
				<div class="col-sm-6 text-right">
					Designed by <a href="https://colorlib.com">Colorlib</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- /.site-footer -->
	</div>
	<!-- /#right-panel -->

	<!-- Scripts -->
	<!--     <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<!--     <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
	<script
		src="<%=request.getContextPath()%>/backend_UI_template/assets/js/main.js"></script>

	<!--  Chart js -->
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

	<!--Chartist Chart-->
	<script
		src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

	<!--     <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script> -->
	<!--     <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script> -->
	<!--     <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script> -->

	<!--     <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script> -->
	<script
		src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/weather-init.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/fullcalendar-init.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="jquery-3.3.1.min.js"></script>
	<!--Local Stuff-->
	<script type="text/javascript">
	$(document).ready(function(){	
		 $('.status').change(function(){
// 		alert($("option:selected", this).text())
			 $.ajax({
			 type: "POST",
		 url: "<%=request.getContextPath() %>/missingCaseAjax.do", 
			 data:changeStatus($(this).val(),$("option:selected", this).text()),
			 datatype:"json",
			 error: function(){alert("AJAX-grade發生錯誤囉!")},
			 success:function(data){
				 
				 $('#contentDiv').html(data);
			 }
		 	})
		})
	})
	
	function changeStatus(report_missing_id,status){
		var cStatus = {"action":"reportMissing","report_missing_id":report_missing_id,"status":status};
		return cStatus;
	}

	
		jQuery(document)
				.ready(
						function($) {
							"use strict";

							// Pie chart flotPie1
							var piedata = [ {
								label : "Desktop visits",
								data : [ [ 1, 32 ] ],
								color : '#5c6bc0'
							}, {
								label : "Tab visits",
								data : [ [ 1, 33 ] ],
								color : '#ef5350'
							}, {
								label : "Mobile visits",
								data : [ [ 1, 35 ] ],
								color : '#66bb6a'
							} ];

							$.plot('#flotPie1', piedata, {
								series : {
									pie : {
										show : true,
										radius : 1,
										innerRadius : 0.65,
										label : {
											show : true,
											radius : 2 / 3,
											threshold : 1
										},
										stroke : {
											width : 0
										}
									}
								},
								grid : {
									hoverable : true,
									clickable : true
								}
							});
							// Pie chart flotPie1  End
							// cellPaiChart
							var cellPaiChart = [ {
								label : "Direct Sell",
								data : [ [ 1, 65 ] ],
								color : '#5b83de'
							}, {
								label : "Channel Sell",
								data : [ [ 1, 35 ] ],
								color : '#00bfa5'
							} ];
							$.plot('#cellPaiChart', cellPaiChart, {
								series : {
									pie : {
										show : true,
										stroke : {
											width : 0
										}
									}
								},
								legend : {
									show : false
								},
								grid : {
									hoverable : true,
									clickable : true
								}

							});
							// cellPaiChart End
							// Line Chart  #flotLine5
							var newCust = [ [ 0, 3 ], [ 1, 5 ], [ 2, 4 ],
									[ 3, 7 ], [ 4, 9 ], [ 5, 3 ], [ 6, 6 ],
									[ 7, 4 ], [ 8, 10 ] ];

							var plot = $.plot($('#flotLine5'), [ {
								data : newCust,
								label : 'New Data Flow',
								color : '#fff'
							} ], {
								series : {
									lines : {
										show : true,
										lineColor : '#fff',
										lineWidth : 2
									},
									points : {
										show : true,
										fill : true,
										fillColor : "#ffffff",
										symbol : "circle",
										radius : 3
									},
									shadowSize : 0
								},
								points : {
									show : true,
								},
								legend : {
									show : false
								},
								grid : {
									show : false
								}
							});
							// Line Chart  #flotLine5 End
							// Traffic Chart using chartist
							if ($('#traffic-chart').length) {
								var chart = new Chartist.Line('#traffic-chart',
										{
											labels : [ 'Jan', 'Feb', 'Mar',
													'Apr', 'May', 'Jun' ],
											series : [
													[ 0, 18000, 35000, 25000,
															22000, 0 ],
													[ 0, 33000, 15000, 20000,
															15000, 300 ],
													[ 0, 15000, 28000, 15000,
															30000, 5000 ] ]
										}, {
											low : 0,
											showArea : true,
											showLine : false,
											showPoint : false,
											fullWidth : true,
											axisX : {
												showGrid : true
											}
										});

								chart
										.on(
												'draw',
												function(data) {
													if (data.type === 'line'
															|| data.type === 'area') {
														data.element
																.animate({
																	d : {
																		begin : 2000 * data.index,
																		dur : 2000,
																		from : data.path
																				.clone()
																				.scale(
																						1,
																						0)
																				.translate(
																						0,
																						data.chartRect
																								.height())
																				.stringify(),
																		to : data.path
																				.clone()
																				.stringify(),
																		easing : Chartist.Svg.Easing.easeOutQuint
																	}
																});
													}
												});
							}
							// Traffic Chart using chartist End
							//Traffic chart chart-js
							if ($('#TrafficChart').length) {
								var ctx = document
										.getElementById("TrafficChart");
								ctx.height = 150;
								var myChart = new Chart(
										ctx,
										{
											type : 'line',
											data : {
												labels : [ "Jan", "Feb", "Mar",
														"Apr", "May", "Jun",
														"Jul" ],
												datasets : [
														{
															label : "Visit",
															borderColor : "rgba(4, 73, 203,.09)",
															borderWidth : "1",
															backgroundColor : "rgba(4, 73, 203,.5)",
															data : [ 0, 2900,
																	5000, 3300,
																	6000, 3250,
																	0 ]
														},
														{
															label : "Bounce",
															borderColor : "rgba(245, 23, 66, 0.9)",
															borderWidth : "1",
															backgroundColor : "rgba(245, 23, 66,.5)",
															pointHighlightStroke : "rgba(245, 23, 66,.5)",
															data : [ 0, 4200,
																	4500, 1600,
																	4200, 1500,
																	4000 ]
														},
														{
															label : "Targeted",
															borderColor : "rgba(40, 169, 46, 0.9)",
															borderWidth : "1",
															backgroundColor : "rgba(40, 169, 46, .5)",
															pointHighlightStroke : "rgba(40, 169, 46,.5)",
															data : [ 1000,
																	5200, 3600,
																	2600, 4200,
																	5300, 0 ]
														} ]
											},
											options : {
												responsive : true,
												tooltips : {
													mode : 'index',
													intersect : false
												},
												hover : {
													mode : 'nearest',
													intersect : true
												}

											}
										});
							}
							//Traffic chart chart-js  End
							// Bar Chart #flotBarChart
							$.plot("#flotBarChart", [ {
								data : [ [ 0, 18 ], [ 2, 8 ], [ 4, 5 ],
										[ 6, 13 ], [ 8, 5 ], [ 10, 7 ],
										[ 12, 4 ], [ 14, 6 ], [ 16, 15 ],
										[ 18, 9 ], [ 20, 17 ], [ 22, 7 ],
										[ 24, 4 ], [ 26, 9 ], [ 28, 11 ] ],
								bars : {
									show : true,
									lineWidth : 0,
									fillColor : '#ffffff8a'
								}
							} ], {
								grid : {
									show : false
								}
							});
							// Bar Chart #flotBarChart End
						});
	
		
		function openTab(evt, cityName) {
			var i, x, tablinks;
			x = document.getElementsByClassName("city");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < x.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" w3-border-red", "");
			}
			document.getElementById(cityName).style.display = "block";
			document.getElementById(cityName).style.width = "950px";
			evt.currentTarget.firstElementChild.className += " w3-border-red";
		}
	</script>

</body>
</html>


