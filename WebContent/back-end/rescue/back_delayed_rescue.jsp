<%@page import="java.util.*"%>
<%@page import="com.rescue.model.*"%>
<%@page import="com.volunteer.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
	List<RescueVO> rescueDelayList;
	rescueDelayList = (List<RescueVO>) request.getAttribute("rescueDelayList");
	if (rescueDelayList==null){
		RescueService rescueSvc = new RescueService(); 
		rescueDelayList = rescueSvc.getAllDelay();
		pageContext.setAttribute("rescueDelayList", rescueDelayList);
		request.setAttribute("Test", "Test");
		System.out.println("rescueDelayList= " + rescueDelayList);
	}
	List<VolunteerVO> listVolunteerOnCall;
	listVolunteerOnCall = (List<VolunteerVO>) request.getAttribute("listVolunteerOnCall");
	if(listVolunteerOnCall==null){
		VolunteerService volunteerSvc = new VolunteerService();
		int day = new java.util.Date().getDay();
		Map<String, String[]> map = new TreeMap<String, String[]>();
		if(day==0||day==6){
			map.put("vlt_duty_day", new String[] { "假日" });
			map.put("vlt_sta", new String[] { "在職志工" });
		}else{
			map.put("vlt_duty_day", new String[] { "平日" });
			map.put("vlt_sta", new String[] { "在職志工" });
		}
		listVolunteerOnCall = volunteerSvc.getAll(map);
		pageContext.setAttribute("listVolunteerOnCall", listVolunteerOnCall);
	}
	String tab = (String) request.getAttribute("tab");
	System.out.println("tab=" + tab);
	Integer tab_int = null;
	if (tab==null){
		tab="1";
		tab_int = new Integer(tab);
	}
%>	
	
	
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService"/>	
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>浪我陪你</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/style.css">
    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />

<!-- w3 CSS tabs -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- w3 CSS tabs -->
<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>








   <style>
   
	   p{
	   		font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
			monospace;
		}

		div{
			font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
				monospace;
		}
   
	    #weatherWidget .currentDesc {
	        color: #ffffff!important;
	    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }

    </style>
</head>

<body>

	<jsp:include page="/back-end/rescue/back_rescue_header.jsp" flush="true" />
	
 <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
<!--         Header -->
<!--         <header id="header" class="header"> -->
<!--         </header> -->
        
        <!-- Content -->
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    

                </div>
            </div>
        </div>
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">逾時救援案例列表</strong>
                            </div>
                            <div class="card-body" id="sss">
                            
                            
                            
                            
                            
                            <div class="w3-container">

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openTab(event, 'toBeReviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red"><h4>未分配的救援</h4></div>
    </a>
    <a href="javascript:void(0)" onclick="openTab(event, 'reviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"><h4>已分配的救援</h4></div>
    </a>
  </div>

  <div id="toBeReviewed" class="w3-container city" style="display:''; width:1100px">
 	<p> </p> 
    <table style="text-align:center" id="bootstrap-data-table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th style="width: 100px">照片</th>
															<th>案例編號</th>
															<th>案例名稱</th>
															<th>發起會員</th>
															<th>案例地區</th>
															<th>發起時間</th>
															<th>案例狀態</th>
															<th>分派志工</th>
														</tr>
													</thead>
													<tbody>
								                       
														<% int no=0;%>
														<c:forEach var="rescueVO" items="${rescueDelayList}">
															<c:if test="${(rescueVO.rsc_sta =='待救援' or rescueVO.rsc_sta == '救援中')&&(rescueVO.vlt_id == null)}" var="condition" scope="page">
																<% no++; %>
																<tr id='${rescueVO.rsc_id}'>
																	<td><%=no %></td>
																	<td><img style="width:150px;height:150px" class="img-fluid" src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}" alt="" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${rescueVO.rsc_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescueVO.rsc_id}" target="_blank">${rescueVO.rsc_name}</a></td>
																	<td style=" margin-bottom: auto">${rescueVO.rsc_sponsor}<br>暱稱：${memSvc.getOneMem(rescueVO.rsc_sponsor).memb_nick}</td>
																	<td style=" margin-bottom: auto">${regionSvc.getOneRegion(rescueVO.rsc_reg).reg_name}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${rescueVO.rsc_btime}" type="both" /></td>
																	<td style=" margin-bottom: auto">${rescueVO.rsc_sta}</td>
																	<td style=" margin-bottom: auto">
																		<select name="select" id="${rescueVO.rsc_id}" class="form=control status">
																				<option value="">請選擇
																			<c:forEach var="volunteerVO" items="${listVolunteerOnCall}">
																				<c:if test="${volunteerVO.vlt_reg==rescueVO.rsc_reg}">
																				<option value="${volunteerVO.vlt_id}" ${(rescueVO.vlt_id==volunteerVO.vlt_name)? 'selected':'' } >${volunteerVO.vlt_name}
																			</c:if>
																			</c:forEach>
																		</select>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
												
<!-- 												<div id="dialog" title="Dialog box"> -->
<%-- 												<%=request.getContextPath()%>/product/product_upload.do?action=getOneModal_For_Display&prod_id=${prodVO.prod_id} --%>
<%-- 												<jsp:include page="/front-end/product/listOneProd.jsp" flush="true" /> --%>
												
												</div>
  </div>

  <div id="reviewed" class="w3-container city" style="display:none" style="width:1100px">
    <p> </p> 
    <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 30px">序號</th>
															<th style="width: 100px">照片</th>
															<th>案例編號</th>
															<th>案例名稱</th>
															<th>發起會員</th>
															<th>案例地區</th>
															<th>發起時間</th>
															<th>案例狀態</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no1=0;%>
														<c:forEach var="rescueVO" items="${rescueDelayList}">
															<c:if test="${rescueVO.rsc_sta =='分派給志工' or rescueVO.rsc_sta == '志工已完成'}" var="condition" scope="page">
																<% no1++; %>
																<tr>
																	<td><%=no1 %></td>
																	<td><img style="width:150px;height:150px" class="img-fluid" src="<%=request.getContextPath()%>/back-end/rescue/rescueImg.do?rsc_id=${rescueVO.rsc_id}" alt="" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto">${rescueVO.rsc_id}</td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescueVO.rsc_id}" target="_blank">${rescueVO.rsc_name}</a></td>
																	<td style=" margin-bottom: auto">${rescueVO.rsc_sponsor}<br>暱稱：${memSvc.getOneMem(rescueVO.rsc_sponsor).memb_nick}</td>
																	<td style=" margin-bottom: auto">${regionSvc.getOneRegion(rescueVO.rsc_reg).reg_name}</td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${rescueVO.rsc_btime}" type="both" /></td>
																	<td style=" margin-bottom: auto">${rescueVO.rsc_sta}</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
  </div>

</div>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->   
        <!-- /.content -->
        <div class="clearfix"></div>
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/main.js"></script>

    <!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <!--Chartist Chart-->
    <script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

<!--     <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script> -->

<!--     <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script> -->
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/weather-init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/fullcalendar-init.js"></script>

	<script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/datatables-init.js"></script>



    
    <!-- w3 css tab -->
	<script>
		function openTab(evt, cityName) {
		  var i, x, tablinks;
		  x = document.getElementsByClassName("city");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < x.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  document.getElementById(cityName).style.width = "1100px";
		  evt.currentTarget.firstElementChild.className += " w3-border-red";
		}
	</script>
	<!-- w3 css tab -->
	
	<!-- backend datatable  -->
	<script type="text/javascript">
	
		$(document).ready(function() {
        	$('#bootstrap-data-table1').DataTable();
        	$('#bootstrap-data-table2').DataTable();
        	
        	 $('.status').change(function(){
        		 var $this = $(this);
        		 console.log("$this=" + $this);
        		 console.log("$this.val()=" + $this.val());
        		 swal({
        			  title: "確定分派給此志工嗎?",
        			  text: "分派後無法更換志工!",
        			  type: "warning",
        			  showCancelButton: true,
  		        	  showCloseButton: true,
        			}).then(
        			function(result){
        			  if (result) {
        				  console.log("11111");
        				  $.ajax({
        	     		     type: "POST",
        	     			 url: "<%=request.getContextPath()%>/back-end/rescue/RescueAjax.do", 
        	     			 data:{"action":"getChange","rsc_id":$this.attr('id'),"vlt_id":$this.val()},
        	     			 datatype:"json",
        	     			 error: function(){alert("AJAX-grade發生錯誤囉!")},
        	     			 success:function(data){
        	     				swal({
	    				    	     title: "完成分派!",
	    				    	     text: "已發通知給志工",
	    				    	     type: "success",
	    				    	    
	    				    	}).then(
	    				    			function(result){
	    				    		if(result){
	    				    		setTimeout("window.location.reload()",100);
	    				    	}
	    				    		}
	    				    			)
 	        	     			 
        	     				

        	     			 }
        	     		 }) 
        			  }
        			}, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
	            		swal("取消", "取消分派", "error");
		        }).catch(swal.noop);
		    });
       		
     			function changeVlt_id(rsc_id,vlt_id){
	     			var cVlt_id = {"action":"getChange","rsc_id":rsc_id,"vlt_id":vlt_id};
	     			return cVlt_id;
     			}
	
     			
     			
      	});
		
		
		
  	</script>
  	<!-- backend datatable  -->
  	
<!--   	review modal -->
  	<script>
	  	$(function() {
	
	  	  $("#dialog").dialog({
	  	     autoOpen: false,
	  	     modal: true
	  	   });
	
	  	  $("#review").on("click", function(e) {
	  	      e.preventDefault();
	  	      $("#dialog").dialog("open");
	  	  });
	
	  	});
  	</script>
<!--   	review modal -->

  	

</body>
</html>


