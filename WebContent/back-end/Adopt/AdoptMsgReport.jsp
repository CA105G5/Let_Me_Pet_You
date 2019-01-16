<%@page import="com.AdoptMsgReport.moedl.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
AdoptMsgReportService adoptMsgReportSvc = new AdoptMsgReportService();
List<AdoptMsgReportVO> list = adoptMsgReportSvc.listAllReport();
pageContext.setAttribute("list", list);
%>	
	
	
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<jsp:useBean id="adoptMsgSvc" scope="page" class="com.AdoptMsg.model.AdoptMsgService"/>	
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
                            <strong class="card-title">認養案例留言檢舉</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">留言檢舉編號</th>
                                        <th scope="col">檢舉會員</th>
                                        <th scope="col">留言所屬案例</th>
                                        <th scope="col">留言內容</th>
                                        <th scope="col">檢舉原因</th>
                                        <th scope="col">狀態</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="adoptMsgReportVO" items="${list}">
                                    <tr>
                                        <td style=" margin-bottom: auto">${adoptMsgReportVO.adopt_msg_rt_id}</td>
                                        <td style=" margin-bottom: auto">${memSvc.getOneMem(adoptMsgReportVO.memb_id).memb_nick}</td>
                                        <td style=" margin-bottom: auto">
                                        <a href="<%=request.getContextPath()%>/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id=${adoptMsgSvc.getOneMsg(adoptMsgReportVO.adopt_msg_id).adopt_id}">
								<button type="button" class="btn btn-outline-primary">查看案例</button>
							</a></td>
                                        <td style=" margin-bottom: auto">${adoptMsgSvc.getOneMsg(adoptMsgReportVO.adopt_msg_id).adopt_msg_comm}</td>
                                        <td style=" margin-bottom: auto">${adoptMsgReportVO.adopt_msg_rt_comm}</td>
                                        <td style=" margin-bottom: auto">
                                        <c:if test="${adoptMsgReportVO.adopt_msg_rt_status == '未審核'}"></c:if>
                                        <c:if test="${adoptMsgReportVO.adopt_msg_rt_status == '通過'}">通過</c:if>
                                        <c:if test="${adoptMsgReportVO.adopt_msg_rt_status == '未通過'}">未通過</c:if>
                                        <c:if test="${adoptMsgReportVO.adopt_msg_rt_status == '未審核'}">
                                        <table style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"><tr style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"><td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
															<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/adopt/AdoptMsgReportServlet.do" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
																<input type="hidden" name="adopt_msg_rt_status" value="通過">
																<input type="hidden" name="adopt_msg_rt_id" value="${adoptMsgReportVO.adopt_msg_rt_id}">
																<input type="hidden" name="action" value="changeStatus">
																<input style="width:100%;" type="submit" value="通過"  class="btn btn-success">
															</FORM>	
															</td><td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
																	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/adopt/AdoptMsgReportServlet.do" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
																<input type="hidden" name="adopt_msg_rt_status" value="未通過">
																<input type="hidden" name="adopt_msg_rt_id" value="${adoptMsgReportVO.adopt_msg_rt_id}">
																<input type="hidden" name="action" value="changeStatus">
																		<input style="width:100%;" type="submit" value="不通過"  class="btn btn-warning">
																	</FORM>
															</td><tr></table></c:if>
                                        
                                        
                                        
                                        
                                        </td>
                                    </tr>
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



    
	
	<!-- backend datatable  -->
	<script type="text/javascript">
	
		$(document).ready(function() {
        	$('#bootstrap-data-table1').DataTable();
        	$('#bootstrap-data-table2').DataTable();
      	});
		
		
		
  	</script>
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


