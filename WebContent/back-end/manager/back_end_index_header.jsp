<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.manager.model.*"%>
<%
ManagerVO managerVO = (ManagerVO) session.getAttribute("managerVO");
System.out.println("111111111111111111111111111="+session.getId());
System.out.println( "是否登入:"+ (managerVO != null));
%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>LET ME PET YOU</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/logo3.png">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />


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
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                   
                    <li class="menu-title active"><a href="index.html">後台管理</a></li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-plus-square"></i>救援管理</a>
                        <ul class="sub-menu children dropdown-menu">                            
                        	<li><i class="fa fa-list-ul"></i><a href="<%=request.getContextPath()%>/back-end/rescue/back_rescue.jsp">救援案例列表</a></li>
                            <li><i class="fa fa-exclamation-circle"></i><a href="<%=request.getContextPath()%>/back-end/rescue/back_delayed_rescue.jsp">逾時案例列表</a></li>
                            <li><i class="fa fa-wpforms"></i><a href="<%=request.getContextPath()%>/back-end/rescue/back_done_rescue.jsp">完成的救援審核</a></li>
                            <li><i class="fa fa-flag"></i><a href="ui-cards.html">救援檢舉審核</a></li>
                            <li><i class="fa fa-comments"></i><a href="ui-alerts.html">救援留言檢舉審核</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>認養管理</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="tables-basic.html">審核認養案例</a></li>
                            <li><i class="fa fa-table"></i><a href="tables-data.html">認養案例結案管理</a></li>
                            <li><i class="fa fa-table"></i><a href="tables-data.html">審核檢舉認養留言</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>失蹤協尋管理</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">審核檢舉失蹤案例</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">審核檢舉失蹤案例留言</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="<%=request.getContextPath()%>/back-end/ord/back_listAllOrd.jsp" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>訂單管理</a>
                        <ul class="sub-menu children dropdown-menu">                            
                            <li><i class="fa fa-id-card-o"></i><a href="<%=request.getContextPath()%>/back-end/ord/back_listAllOrd.jsp">審核訂單檢舉</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="<%=request.getContextPath()%>/back-end/product/back_shop.jsp" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>捐贈管理</a>
                        <ul class="sub-menu children dropdown-menu">                            
                            <li><i class="fa fa-id-badge"></i><a href="<%=request.getContextPath()%>/back-end/product/back_Money_Don.jsp">愛心捐款管理</a></li>
<%--                             <li><i class="fa fa-id-badge"></i><a href="<%=request.getContextPath()%>/back-end/product/back_Money_Don_Total.jsp">愛心捐款查詢</a></li> --%>
                            <li><i class="fa fa-bars"></i><a href="<%=request.getContextPath()%>/back-end/product/back_shop.jsp">愛心物資管理</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>志工管理</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="<%=request.getContextPath()%>/back-end/volunteer/addVolunteer.jsp">志工新增</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="<%=request.getContextPath()%>/back-end/volunteer/listAllVolunteer.jsp">志工查詢</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/back-end/manager/back_end_index.jsp"><img src="<%=request.getContextPath()%>/back-end/manager/images/logo-2.png" alt="Logo" height="40"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">





                    </div>

                    <div class="user-area dropdown float-right">
						
				<% 
					out.print(managerVO.getMa_name()+"，你好");
				%>
				<a href="<%=request.getContextPath()%>/back-end/manager/manager.do?action=logout">登出</a>
                    </div>

                </div>
            </div>
        </header>
        <!-- /#header -->
        <!-- Content -->
<!--         <div class="breadcrumbs"> -->
<!--             <div class="breadcrumbs-inner"> -->
<!--                 <div class="row m-0"> -->
<!--                     <div class="col-sm-4"> -->
<!--                         <div class="page-header float-left"> -->
<!--                             <div class="page-title"> -->
<!--                                 <h1>Dashboard</h1> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-sm-8"> -->
<!--                         <div class="page-header float-right"> -->
<!--                             <div class="page-title"> -->
<!--                                 <ol class="breadcrumb text-right"> -->
<!--                                     <li><a href="#">Dashboard</a></li> -->
<!--                                     <li><a href="#">Table</a></li> -->
<!--                                     <li class="active">Data table</li> -->
<!--                                 </ol> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->

<!--         <div class="content"> -->
<!--             <div class="animated fadeIn"> -->
<!--                 <div class="row"> -->

<!--                     <div class="col-md-12"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-header"> -->
<!--                                 <strong class="card-title">愛心商品捐贈審核</strong> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
<!--                                 <table id="bootstrap-data-table" class="table table-striped table-bordered"> -->
<!--                                     <thead> -->
<!--                                         <tr> -->
<!--                                             <th>Name</th> -->
<!--                                             <th>Position</th> -->
<!--                                             <th>Office</th> -->
<!--                                             <th>Salary</th> -->
<!--                                         </tr> -->
<!--                                     </thead> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td>Tiger Nixon</td> -->
<!--                                             <td>System Architect</td> -->
<!--                                             <td>Edinburgh</td> -->
<!--                                             <td>$320,800</td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->


<!--                 </div> -->
<!--             </div>.animated -->
<!--         </div>.content    -->
<!--         /.content -->
<!--         <div class="clearfix"></div> -->
<!--         Footer -->
<!--         <footer class="site-footer"> -->
<!--             <div class="footer-inner bg-white"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-sm-6"> -->
<!--                         Copyright &copy; 2018 Ela Admin -->
<!--                     </div> -->
<!--                     <div class="col-sm-6 text-right"> -->
<!--                         Designed by <a href="https://colorlib.com">Colorlib</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </footer> -->
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/main.js"></script>

    <!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <!--Chartist Chart-->
    <script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/weather-init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend_UI_template/assets/js/init/fullcalendar-init.js"></script>

<!--     Local Stuff -->
    <script>
         jQuery(document).ready(function($) {
             "use strict";

             // Pie chart flotPie1
             var piedata = [
                 { label: "Desktop visits", data: [[1,32]], color: '#5c6bc0'},
                 { label: "Tab visits", data: [[1,33]], color: '#ef5350'},
                 { label: "Mobile visits", data: [[1,35]], color: '#66bb6a'}
             ];

             $.plot('#flotPie1', piedata, {
                 series: {
                     pie: {
                         show: true,
                         radius: 1,
                         innerRadius: 0.65,
                         label: {
                             show: true,
                            radius: 2/3,
                             threshold: 1
                         },
                         stroke: {
                             width: 0
                         }
                     }
                 },
                 grid: {
                     hoverable: true,
                     clickable: true
                 }
             });
             // Pie chart flotPie1  End
             // cellPaiChart
             var cellPaiChart = [
                 { label: "Direct Sell", data: [[1,65]], color: '#5b83de'},
                { label: "Channel Sell", data: [[1,35]], color: '#00bfa5'}
             ];
             $.plot('#cellPaiChart', cellPaiChart, {
                 series: {
                     pie: {
                         show: true,
                         stroke: {
                             width: 0
                         }
                     }
                 },
                 legend: {
                     show: false
                 },grid: {
                     hoverable: true,
                     clickable: true
                 }

             });
             // cellPaiChart End
             // Line Chart  #flotLine5
             var newCust = [[0, 3], [1, 5], [2,4], [3, 7], [4, 9], [5, 3], [6, 6], [7, 4], [8, 10]];

             var plot = $.plot($('#flotLine5'),[{
                 data: newCust,
                 label: 'New Data Flow',
                 color: '#fff'
             }],
             {
                 series: {
                     lines: {
                        show: true,
                         lineColor: '#fff',
                         lineWidth: 2
                     },
                    points: {
                         show: true,
                         fill: true,
                         fillColor: "#ffffff",
                         symbol: "circle",
                         radius: 3
                     },
                     shadowSize: 0
                 },
                 points: {
                     show: true,
                 },
                 legend: {
                     show: false
                 },
                 grid: {
                     show: false
                 }
             });
             // Line Chart  #flotLine5 End
             // Traffic Chart using chartist
             if ($('#traffic-chart').length) {
                 var chart = new Chartist.Line('#traffic-chart', {
                   labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                   series: [
                   [0, 18000, 35000,  25000,  22000,  0],
                   [0, 33000, 15000,  20000,  15000,  300],
                   [0, 15000, 28000,  15000,  30000,  5000]
                   ]
               }, {
                   low: 0,
                   showArea: true,
                   showLine: false,
                   showPoint: false,
                   fullWidth: true,
                   axisX: {
                     showGrid: true
                 }
             });
                 chart.on('draw', function(data) {
                     if(data.type === 'line' || data.type === 'area') {
                         data.element.animate({
                             d: {
                                 begin: 2000 * data.index,
                                 dur: 2000,
                                 from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                 to: data.path.clone().stringify(),
                                 easing: Chartist.Svg.Easing.easeOutQuint
                             }
                         });
                     }
                 });
             }
             // Traffic Chart using chartist End
             //Traffic chart chart-js
             if ($('#TrafficChart').length) {
                 var ctx = document.getElementById( "TrafficChart" );
                 ctx.height = 150;
                 var myChart = new Chart( ctx, {
                     type: 'line',
                     data: {
                         labels: [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul" ],
                         datasets: [
                        {
                             label: "Visit",
                             borderColor: "rgba(4, 73, 203,.09)",
                             borderWidth: "1",
                             backgroundColor: "rgba(4, 73, 203,.5)",
                             data: [ 0, 2900, 5000, 3300, 6000, 3250, 0 ]
                         },
                         {
                             label: "Bounce",
                             borderColor: "rgba(245, 23, 66, 0.9)",
                             borderWidth: "1",
                             backgroundColor: "rgba(245, 23, 66,.5)",
                             pointHighlightStroke: "rgba(245, 23, 66,.5)",
                             data: [ 0, 4200, 4500, 1600, 4200, 1500, 4000 ]
                         },
                         {
                             label: "Targeted",
                             borderColor: "rgba(40, 169, 46, 0.9)",
                             borderWidth: "1",
                             backgroundColor: "rgba(40, 169, 46, .5)",
                             pointHighlightStroke: "rgba(40, 169, 46,.5)",
                             data: [1000, 5200, 3600, 2600, 4200, 5300, 0 ]
                         }
                         ]
                     },
                     options: {
                         responsive: true,
                         tooltips: {
                             mode: 'index',
                             intersect: false
                         },
                         hover: {
                             mode: 'nearest',
                             intersect: true
                         }

                     }
                 } );
             }
             //Traffic chart chart-js  End
             // Bar Chart #flotBarChart
             $.plot("#flotBarChart", [{
                 data: [[0, 18], [2, 8], [4, 5], [6, 13],[8,5], [10,7],[12,4], [14,6],[16,15], [18, 9],[20,17], [22,7],[24,4], [26,9],[28,11]],
                 bars: {
                     show: true,
                     lineWidth: 0,
                     fillColor: '#ffffff8a'
                 }
             }], {
                 grid: {
                     show: false
                 }
             });
             // Bar Chart #flotBarChart End
         });
     </script> 
</body>
</html>


