<%@page import="java.util.*"%>
<%@page import="com.rescue.model.*"%>
<%@page import="com.rescuing.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
List<RescuingVO> rescuingReviewList;
rescuingReviewList = (List<RescuingVO>) request.getAttribute("rescuingReviewList");
if (rescuingReviewList==null){
	RescuingService rescuingSvc = new RescuingService(); 
	rescuingReviewList = rescuingSvc.getAll();
	pageContext.setAttribute("rescuingReviewList", rescuingReviewList);
	request.setAttribute("Test", "Test");
	System.out.println("rescuingReviewList= " + rescuingReviewList);
}

%>	
	
	
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="rescue" scope="page" class="com.rescue.model.RescueService"/>	
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
       
        
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">待審核完成的救援</strong>
                            </div>
                            <div class="card-body">
                                <table style="text-align:center" id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                        	<th style="width: 30px">序號</th>
                                            <th>救援案例編號</th>
                                            <th>完成案例送審會員</th>
                                            <th>完成送審描述</th>
                                            <th>完成救援時間</th>
                                            <th>審核</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% int no=0;%>
										<c:forEach var="rescuingVO" items="${rescuingReviewList}">
<%-- 										<c:if test="${rescuingVO.rscing_sta =='完成救援送審中' and rescuingVO.rscing_cdes != ''}" var="condition" scope="page"> --%>
												<% no++; %>
												<tr>
													<td><%=no %></td>
													<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/front-end/rescue/rescue.do?action=getOne_For_Display&rsc_id=${rescuingVO.rsc_id}">${rescuingVO.rsc_id}</a></td>
													<td style=" margin-bottom: auto">${rescuingVO.rscing_ptcp}<br>暱稱：${memSvc.getOneMem(rescuingVO.rscing_ptcp).memb_nick}</td>
													<td style=" margin-bottom: auto">
														<button type="button" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#${rescuingVO.rsc_id}">完成報告</button>
													</td>
													<td style=" margin-bottom: auto"><fmt:formatDate value="${rescuingVO.rscing_ctime}" type="both" /></td>
													<td style=" margin-bottom: auto">
											
														<select name="bootstrap-data-table_length"
															aria-controls="bootstrap-data-table"
															class="form-control form-control-sm status">
															<option value="">請選擇</option>
															<option value="完成救援">通過</option>
															<option value="不通過">不通過</option>
														</select>
														<div style="display:none">${rescuingVO.rsc_id}</div>
													</td>
												</tr>
									       <div class="modal fade" id="${rescuingVO.rsc_id}" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h5 class="modal-title" id="largeModalLabel">完成報告</h5>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
								                            ${rescuingVO.rscing_cdes}
								                        </div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">Confirm</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>
								        <%-- 										</c:if> --%>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
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
        		 console.log($this.next().text());
        		 
        		 if($this.val()=='完成救援'){
        			 console.log("yyyyyyyy");
        			 
//             		 swal({
//        			  title: "確定通過嗎?",
//        			  text: "確定後無法改變!",
//        			  type: "warning",
//        			  showCancelButton: true,
//  		        	  showCloseButton: true,
//        			}).then(
//        			function(result){
//        			  if (result) {
//        				  
//        				  $.ajax({
//        	     		     type: "POST",
<%--         	     			 url: "<%=request.getContextPath()%>/back-end/rescue/RescuingAjax.do",  --%>
//        	     			 data:{"action":"doneRscPass","rsc_id":$this.next().text()},
//        	     			 datatype:"json",
//        	     			 error: function(){alert("AJAX-grade發生錯誤囉!")},
//        	     			 success:function(data){
//        	     				swal({
//	    				    	     title: "完成!",
//	    				    	     text: "已發通知給會員!",
//	    				    	     type: "success",
	    				    	    
//	    				    	}).then(
//	    				    			function(result){
//	    				    				if(result){
//	    				    					$this.parent().parent().css("display","none")
//	    				    				}
//	    				    			}
//	    				    		)
//        	     			 }
//        	     		 }) 
//        			  }
//        			}, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
//	            		swal("取消", "取消審核", "error");
//		        }).catch(swal.noop);
//		    });
        			 
        			 
        		 }else{
//         			 if($this.val()=='不通過'){
//         				 console.log("nnnnnnn");
        				 
//         				 swal({
//            				  title: '請描述不通過原因',
//            				  input: 'textarea',
//            				  showCancelButton: true,
//            				  inputValidator: function (value) {
//            				    return new Promise(function (resolve, reject) {
//            				      if (value) {
//            				        resolve()
//            				      } else {
//            				        reject('請輸入原因!')
//            				      }
//            				    })
//            				  }
//            				}).then(function (result) {
//            				  console.log(result);
//            				})
//                 		 swal({
//           			  title: "確定不通過嗎?",
//           			  text: "確定後無法改變!",
//           			  type: "warning",
//           			  showCancelButton: true,
//     		        	  showCloseButton: true,
//           			}).then(
//           			function(result){
//           			  if (result) {
//           				  
//           				  $.ajax({
//           	     		     type: "POST",
   <%--         	     			 url: "<%=request.getContextPath()%>/back-end/rescue/RescueAjax.do",  --%>
//           	     			 data:{"action":"doneRscNoPass","rsc_id":$this.next().text()},
//           	     			 datatype:"json",
//           	     			 error: function(){alert("AJAX-grade發生錯誤囉!")},
//           	     			 success:function(data){
//           	     				swal({
//   	    				    	     title: "完成!",
//   	    				    	     text: "已發通知給會員!",
//   	    				    	     type: "success",
   	    				    	    
//   	    				    	}).then(
//   	    				    			function(result){
//   	    				    				if(result){
//   	    				    					$this.parent().parent().css("display","none")
//   	    				    				}
//   	    				    			}
//   	    				    		)
//           	     			 }
//           	     		 }) 
//           			  }
//           			}, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
//   	            		swal("取消", "取消審核", "error");
//   		        }).catch(swal.noop);
//   		    });
        			 }
        		 }

        	 });


       		

	
     			
     			
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


