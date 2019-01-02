<%@page import="com.orditem.model.OrdItemService"%>
<%@page import="com.ord.model.OrdVO"%>
<%@page import="com.ord.model.OrdService"%>
<%@page import="com.orditem.model.OrdItemVO"%>
<%@page import="java.util.List"%>
<%@page import="com.prod.model.ProdService"%>
<%@page import="com.prod.model.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
	List<OrdItemVO> ordItemlist;
	ordItemlist = (List<OrdItemVO>) request.getAttribute("ordItemlist");
	if (ordItemlist==null){
// 		OrdService ordSvc = new OrdService(); 
// 		List<OrdVO> ordList = ordSvc.getOrdByMem("M000000001"); 
// 		System.out.println("ordList.size()=" + ordList.size());
		OrdItemService ordItemSvc = new OrdItemService(); 
		ordItemlist = ordItemSvc.getAll();
		System.out.println("ordItemlist.size()=" + ordItemlist.size());
		pageContext.setAttribute("ordItemlist", ordItemlist);
		request.setAttribute("Test", "Test");
	}
	String tab = (String) request.getAttribute("tab");
	System.out.println("tab=" + tab);
	Integer tab_int = null;
	if (tab==null){
		tab="1";
		tab_int = new Integer(tab);
	}

%>	

<jsp:useBean id="ordSvc" scope="page" class="com.ord.model.OrdService" />
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
	
	
	
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>浪我陪你-後台</title>
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
    
    V<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
    
    
<!--     加上審核彈跳modal -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--     加上審核彈跳modal -->
    

<!-- w3 CSS tabs -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- w3 CSS tabs -->








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

	<jsp:include page="/back-end/product/back_shop_Header.jsp" flush="true" />
	
 <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
<!--         Header -->
<!--         <header id="header" class="header"> -->
<!--         </header> -->
        
        <!-- Content -->
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Data table</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">訂單檢舉審核</strong>
                            </div>
                            <div class="card-body">
                            
                            
                            
                            
                            
                            <div class="w3-container">

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openTab(event, 'toBeReviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red"><h4>待審核</h4></div>
    </a>
    <a href="javascript:void(0)" onclick="openTab(event, 'reviewed');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"><h4>已審核</h4></div>
    </a>
  </div>

  <div id="toBeReviewed" class="w3-container city" style="display:''; width:1100px">
 	<p> </p> 
    <table id="bootstrap-data-table2" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">檢舉時間</th>
															<th width="100px">檢舉理由</th>
															<th width="100px">檢舉審核狀態</th>
															<th width="100px">審核</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rt_status.equals('已檢舉') && ordItemVO.ord_item_review==null}" var="condition" scope="page">
																<% no++; %>
																<tr>
<%-- 																	<td><%=no %></td> --%> 
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rt_comm}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_review==null? "未審核": ordItemVO_Modal.ord_item_review}</td>
																	<td style=" margin-bottom: auto">
																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordItem/ordItem.do" style="text-align: center; margin-bottom: auto">
<!-- 																		<input type="submit" value="檢舉"> -->
																		<input type="submit" value="審核" id="review">
<%-- 																		<A type="button" href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Review">審核</a> --%>
<%-- 																	<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${ordItemVO.prod_id}">
																		<input type="hidden" name="ord_id"  value="${ordItemVO.ord_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="action"	value="getOneModal_For_Review">
																		</FORM>
<!-- 																		改成modal彈跳視窗 -->
<%-- 																		<A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">檢舉</a> --%>
<!-- 																		改成modal彈跳視窗 -->
																	
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
												
  </div>

  <div id="reviewed" class="w3-container city" style="display:none" style="width:1100px">
    <p> </p> 
    <table id="bootstrap-data-table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th width="100px">訂單編號</th>
															<th width="100px">照片</th>
															<th width="100px">商品名稱</th>
															<th width="100px">檢舉時間</th>
															<th width="100px">檢舉理由</th>
															<th width="100px">檢舉審核結果</th>
															<th width="100px">檢舉審核描述</th>
														</tr>
													</thead>
													<tbody>
								
														<% int no1=0;%>
														<c:forEach var="ordItemVO" items="${ordItemlist}">
															<c:if test="${ordItemVO.ord_item_rt_status.equals('已檢舉') && ordItemVO.ord_item_review!=null}" var="condition" scope="page">
																<% no1++; %>
																<tr>
<%-- 																	<td style=" margin-bottom: auto">${ordItemVO.ord_id}</td> --%>
																	<!--改成modal彈跳視窗 -->
																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rt_comm}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_review}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rv_des}</td>
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
    

<!--    加上檢舉彈跳modal  -->
<c:if test="${ReviewModal!=null}">

<div class="modal fade" id="ReviewModal" tabindex="-1" role="dialog" aria-labelledby="ReviewModal" aria-hidden="true" style="overflow: hidden">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header" style="height:auto">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/ord/listOneReviewModal.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>

        <script>
    		 $("#ReviewModal").modal({show: true});
        </script>
</c:if>
<!--    加上審核彈跳modal  -->   



<!--    加上明細彈跳modal  -->
<c:if test="${openModal!=null}">

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" style="overflow: hidden">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header" style="height:500px">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/ord/listOneOrdDetailModal.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>

        <script>
    		 $("#basicModal").modal({show: true});
        </script>
</c:if>
<!--    加上明細彈跳modal  -->   
    

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
      	});
  	</script>
  	<!-- backend datatable  -->
  	

</body>
</html>


