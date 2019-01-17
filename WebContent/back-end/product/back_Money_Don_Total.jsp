<%@page import="com.donate.model.DonateService"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="com.donate.model.DonateVO"%>
<%@page import="java.util.List"%>
<%@page import="com.prod.model.ProdService"%>
<%@page import="com.prod.model.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<%
	List<DonateVO> list;
	list = (List<DonateVO>) request.getAttribute("list");
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id = null;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
	if (list==null){
		DonateService donSvc = new DonateService(); 
		list = donSvc.getAll();
		pageContext.setAttribute("list", list);
		request.setAttribute("Test", "Test");
		System.out.println("list.size()="+list.size());
	}
	String tab = (String) request.getAttribute("tab");
	System.out.println("tab=" + tab);
	Integer tab_int = null;
	if (tab==null){
		tab="1";
		tab_int = new Integer(tab);
	}
%>	

<jsp:useBean id="prodImgSvc" scope="page" class="com.prodimg.model.ProdImgService" />
	
	
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>浪我陪你-後台</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css"> --%>
<!--     <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->
    
<!--     <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->

<!--     加上審核彈跳modal -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--     加上審核彈跳modal -->

	
    

	<!-- w3 CSS tabs -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- w3 CSS tabs -->
	
	<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">


    
<!-- datatable -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<!-- datatable -->

    
<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
    



   <style>
   
/* button click動畫 */ 
.button { 
  display: inline-block; 
  padding: 15px 25px; 
  font-size: 24px; 
  cursor: pointer; 
  text-align: center; 
  text-decoration: none; 
  outline: none; 
  color: #fff; 
  background-color: #4CAF50; 
  border: none; 
  border-radius: 15px; 
  box-shadow: 0 9px #999; 
} 
	
.button:hover {background-color: #3e8e41}
	
.button:active { 
background-color: #3e8e41; 
box-shadow: 0 5px #666; 
transform: translateY(4px); 
} 

</style>
</head>

<body>

	<jsp:include page="/back-end/manager/back_end_index_header.jsp" flush="true" />
	
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
                                <strong class="card-title">愛心款項查詢</strong>
                            </div>
                            <div class="card-body">
                            
                            
                            
                            
                            
                            <div class="w3-container">

<!--   <div class="w3-row"> -->
<!--     <a href="javascript:void(0)" onclick="openTab(event, 'reviewed');"> -->
<!--       <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"><h4>款項已確認</h4></div> -->
<!--     </a> -->
<!--   </div> -->


<!--   <div id="reviewed" class="w3-container city" style="width:1100px"> -->
  <br>
    <p style="display:inline; padding-left:15px">依捐款年月份查詢　</p> 
	
    
    <select style="width: 120px" id="donate_month" name="donate_month" style="display:inline">
		<option value="0">All</option>
		<option value="2018-12">2018/12</option>
		<option value="2019-01">2019/01</option>
	</select>
<!-- 	<br> -->
<!-- 	<br> -->
	<p style="display:inline"><h3 id="total" style="display:inline; padding-left:50px">目前收到捐款總計 $ </h3></p> 
	<br>
    <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="success">
															<th style="width: 100px">捐款人</th>
															<th style="width: 100px">捐款人電話</th>
<!-- 															<th style="width: 100px">捐款人e-mail</th> -->
															<th style="width: 100px">捐款時間</th>
															<th style="width: 80px">捐款方式</th>
															<th style="width: 80px">捐款金額</th>
															<th style="width: 120px">捐款帳號/卡號</th>
															<th style="width: 80px">款項狀態</th>
															<th style="width: 100px">愛心幣發放</th>
														</tr>
													</thead>
													<tbody>
													
														<script> var total = 0;</script>
														<% int no2=0;%>
														<c:forEach var="donateVO" items="${list}">
															<c:if test="${donateVO.donate_status.equals('已收到')}" var="condition" scope="page">
																<% no2++; %>
																<tr class="aaa">
<%-- 																	<td><%=no2 %></td> --%>
																	<td style=" margin-bottom: auto">${donateVO.donate_name}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_phone}</td>
<%-- 																	<td style=" margin-bottom: auto">${donateVO.donate_mail}</td> --%>
																	<td class="info" style=" margin-bottom: auto"><fmt:formatDate value="${donateVO.donate_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_amount}</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_src_trn==null? donateVO.donate_src_cre : donateVO.donate_src_trn}</td>
																	<td style=" margin-bottom: auto">已確認</td>
																	<td style=" margin-bottom: auto">${donateVO.donate_coin}</td>
																</tr>
																
																<script>
																	total += ${donateVO.donate_amount};
																</script>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
<!--   </div> -->

<!-- <p style="display:inline"><h3 id="total">目前收到捐款總計 $ </h3></p>  -->


</div>
                            
                            
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->   
        <!-- /.content -->
        <div class="clearfix"></div>
    <!-- /#right-panel -->
   </div>
    



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
        	var datatable = $('#bootstrap-data-table2').DataTable();
      	});
  	</script>
  	<!-- backend datatable  -->
  	
  	
  	<script>
	(function($) {
		$('#total').text("目前收到所有捐款總計 $" + total);
	})(jQuery);
	
	(function($) {
		$('#donate_month').on('change', function(){
			console.log("111111");
			console.log($('#donate_month').val());
			console.log($('#donate_month').val()!=0);
			console.log($('#bootstrap-data-table_filter').find(":input").attr("type"));
			
			var $search = $('#bootstrap-data-table_filter').find(":input");
			$search.val('');
			$('#total').text('');
			
			if($('#donate_month').val()!=0){
				$search.val($('#donate_month').val());
				$search.focus();
				
			} else{
				$('#total').text("目前收到所有捐款總計 $" + total);
			}
			
			//setup event
 			$search.keypress(function(event) {
 			    if ((event.keyCode) == 13) {
 			        alert('keypress triggered');
 			    }
 			});
			
 			e = jQuery.Event("keyup");
			e.which = 13; //enter charecter 13 used
			e.keyCode = 13;
			$search.trigger(e);
			
			if($('#donate_month').val()!=0){
				$.ajax({
					url: '<%=request.getContextPath()%>/donate/donate.do?action=check_total_by_month',
					type: "get",
					data: { 'action': 'check_total_by_month', 
							'donate_year': $('#donate_month').val().substring(0,4), 
							'donate_month': $('#donate_month').val().substring(5),
						  },
					dataType: 'json',
					success: function(res){
						console.log("0000000000");
						console.log(res);
						$('#total').text($('#donate_month').val().substring(0,4)+"年"+$('#donate_month').val().substring(5)+"月收到捐款總計 $" + res);
	
					},
					error: function(res){
						console.log("eeeeeeee");
						console.log("res="+res);
					}
				
				});
			}

// 			var total2 = 0;
// 			$(".info").each(function(){
			
// 				if($('#donate_month').val()==0){
// 					console.log("00000"+$(this).next().next().text());
// 					$('#total').text("目前收到所有捐款總計 $" + total);
// 				}	else if($(this).html().substring(0,7)==$('#donate_month').val()){
// 					console.log("$$$$$$$"+$(this).next().next().text());
// 					total2= total2 + parseInt($(this).next().next().text());
// 					$('#total').text($('#donate_month').val().substring(0,4)+"年"+$('#donate_month').val().substring(5)+"月收到捐款總計 $" + total2);
// 				}
				
// 			});
			
			
		});
	})(jQuery);
	
	
</script>
  	

  	

</body>
</html>


