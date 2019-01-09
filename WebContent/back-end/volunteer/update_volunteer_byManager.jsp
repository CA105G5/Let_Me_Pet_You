<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>

<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
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
<body bgcolor='white'>
<jsp:include page="/back-end/manager/back_end_index_header.jsp" flush="true" />
<div id="right-panel" class="right-panel">
	<div class="content">
		<div class="animated fadeIn">

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
				<div class="container" style="margin-top:150px;margin-left:500px">
									<div class="row">
										<div class="col-lg-offset-3 col-lg-6">	
				               <div class="card">
				                        <div class="card-header" align="center">志工修改</div>
				                        <div class="card-body card-block">
				                            <form action="volunteer.do" method="post" class="">
				                            	<div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">志工信箱(帳號):</div>
				                                        <input type="email" id="email3" name="vlt_mail" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_mail()%>" readonly="readonly">
				                                    </div>
				                                </div>
				                                <div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">志工姓名:</div>
				                                        <input type="text" id="username3" name="vlt_name" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_name()%>" readonly="readonly">
				                                    </div>
				                                </div>
				                                <div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">志工性別:</div>
				                                        <input type="text" id="username332" name="vlt_gender" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_gender()%>" readonly="readonly">
				                                    </div>
				                                </div>
					                                
				                                <div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">手機號碼:</div>
				                                        <input type="text" id="phone3" name="vlt_tel" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_tel()%>" readonly="readonly">
				                                    </div>
				                                </div>
				                                <div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">可值勤日:</div>
				                                        <input type="text" id="username33" name="vlt_duty_day" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_duty_day()%>" readonly="readonly">
				                                    </div>
				                                </div>
				                                <jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
				                                <div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">服務區域:<font color=red><b>*</b></font></div>
				                                        <select size="1" name="reg_id">
															<c:forEach var="regionVO" items="${regionSvc.all}">
																<option value="${regionVO.reg_id}" ${(volunteerVO.vlt_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
															</c:forEach>
														</select>
				                                        
				                                    </div>
				                                </div>
				                                <div class="form-group">
				                                    <div class="input-group">
				                                        <div class="input-group-addon">服務區域:<font color=red><b>*</b></font></div>
				                                        <select size="1" name="vlt_sta">
															<option value="離職志工" ${(volunteerVO.vlt_sta=='離職志工')? 'selected':'' }>離職志工
															<option value="救援中" ${(volunteerVO.vlt_sta=='救援中')? 'selected':'' }>救援中
															<option value="在職志工" ${(volunteerVO.vlt_sta=='在職志工')? 'selected':'' }>在職志工
														</select>
				                                    </div>
				                                </div>
				                                
				                                	<input type="hidden" name="action" value="updatebymanager">
													<input type="hidden" name="vlt_id" value="<%=volunteerVO.getVlt_id()%>">
													<input type="hidden" name="vlt_registerdate" value="<%=volunteerVO.getVlt_registerdate()%>">
													<div class="form-actions form-group" align="center">
				                                    	<button type="submit" class="btn btn-primary btn-sm">送出修改</button>
				                                	</div>
				                            </form>
				                        </div>
				                    </div>
				               </div>
				         </div>
				 </div>
		</div>
	</div>
</div>







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


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>
</body>
</html>