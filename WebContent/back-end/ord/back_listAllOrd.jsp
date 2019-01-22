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
    <title>浪我陪你-後台-訂單檢舉審核</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css"> --%>
<!--     <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->
    
<!--     <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    


<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->

<!-- 若要使用fai那版外掛icon，要import CDN，快捷鍵facdn=>tab -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- https://fontawesome.com/ 自己的css-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">



    
<!-- <!--     加上審核彈跳modal --> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<!-- <!--     加上審核彈跳modal --> -->
    

<!-- w3 CSS tabs -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- w3 CSS tabs -->


    
<!-- datatable -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend_UI_template/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<!-- datatable -->

    
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
        
       .modal {
  overflow-y:auto;
}

/* Timeline */
/* 參考網址https://bootsnipp.com/snippets/pjQlD */
.timeline,
.timeline-horizontal {
list-style: none;
padding: 20px;
position: relative;
}
.timeline:before {
top: 40px;
bottom: 0;
position: absolute;
content: " ";
width: 3px;
background-color: #eeeeee;
left: 50%;
margin-left: -1.5px;
}
.timeline .timeline-item {
margin-bottom: 20px;
position: relative;
}
.timeline .timeline-item:before,
.timeline .timeline-item:after {
content: "";
display: table;
}
.timeline .timeline-item:after {
clear: both;
}
.timeline .timeline-item .timeline-badge {
color: #fff;
width: 54px;
height: 54px;
line-height: 52px;
font-size: 22px;
text-align: center;
position: absolute;
top: 15px;
left: 50%;
margin-left: -25px;
background-color: #7c7c7c;
border: 3px solid #ffffff;
z-index: 100;
border-top-right-radius: 50%;
border-top-left-radius: 50%;
border-bottom-right-radius: 50%;
border-bottom-left-radius: 50%;
}
.timeline .timeline-item .timeline-badge i,
.timeline .timeline-item .timeline-badge .fa,
.timeline .timeline-item .timeline-badge .glyphicon {
top: 2px;
left: 0px;
}
.timeline .timeline-item .timeline-badge.primary {
background-color: #1f9eba;
}
.timeline .timeline-item .timeline-badge.info {
background-color: #5bc0de;
}
.timeline .timeline-item .timeline-badge.success {
background-color: #59ba1f;
}
.timeline .timeline-item .timeline-badge.warning {
background-color: #d1bd10;
}
.timeline .timeline-item .timeline-badge.danger {
background-color: #ba1f1f;
}
.timeline .timeline-item .timeline-panel {
position: relative;
width: 46%;
float: left;
right: 16px;
border: 1px solid #c0c0c0;
background: #ffffff;
border-radius: 2px;
padding: 20px;
-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}
.timeline .timeline-item .timeline-panel:before {
position: absolute;
top: 26px;
right: -16px;
display: inline-block;
border-top: 16px solid transparent;
border-left: 16px solid #c0c0c0;
border-right: 0 solid #c0c0c0;
border-bottom: 16px solid transparent;
content: " ";
}
.timeline .timeline-item .timeline-panel .timeline-title {
margin-top: 0;
color: inherit;
}
.timeline .timeline-item .timeline-panel .timeline-body > p,
.timeline .timeline-item .timeline-panel .timeline-body > ul {
margin-bottom: 0;
}
.timeline .timeline-item .timeline-panel .timeline-body > p + p {
margin-top: 5px;
}
.timeline .timeline-item:last-child:nth-child(even) {
float: right;
}
.timeline .timeline-item:nth-child(even) .timeline-panel {
float: right;
left: 16px;
}
.timeline .timeline-item:nth-child(even) .timeline-panel:before {
border-left-width: 0;
border-right-width: 14px;
left: -14px;
right: auto;
}
.timeline-horizontal {
list-style: none;
position: relative;
padding: 20px 0px 20px 0px;
display: inline-block;
}
.timeline-horizontal:before {
height: 3px;
top: auto;
bottom: 26px;
left: 50px;
right: 0;
width: 78%;
margin-bottom: 20px;
}
.timeline-horizontal .timeline-item {
display: table-cell;
height: 280px;
width: 20%;
min-width: 200px;
float: none !important;
padding-left: 0px;
padding-right: 20px;
margin: 0 auto;
vertical-align: bottom;
}
.timeline-horizontal .timeline-item .timeline-panel {
top: auto;
bottom: 64px;
display: inline-block;
float: none !important;
left: 0 !important;
right: 0 !important;
width: 120px;
margin-bottom: 20px;
}
.timeline-horizontal .timeline-item .timeline-panel:before {
top: auto;
bottom: -16px;
left: 28px !important;
right: auto;
border-right: 16px solid transparent !important;
border-top: 16px solid #c0c0c0 !important;
border-bottom: 0 solid #c0c0c0 !important;
border-left: 16px solid transparent !important;
}
.timeline-horizontal .timeline-item:before,
.timeline-horizontal .timeline-item:after {
display: none;
}
.timeline-horizontal .timeline-item .timeline-badge {
top: auto;
bottom: 0px;
left: 43px;
}
        
        
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

html {
    overflow-x: scroll; 
    overflow-y: scroll;
  }




    </style>
</head>

<body>

	<jsp:include page="/back-end/manager/back_end_index_header.jsp" flush="true" />
	
 <!-- Right Panel -->
    <div id="right-panel" class="right-panel" style="margin-top:-30px">
<!--         Header -->
<!--         <header id="header" class="header"> -->
<!--         </header> -->
        
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
        <div class="content" style="height:700px">
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
<!-- 														<tr class="success"> -->
														<tr class="">
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
<%-- 																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td> --%>
																	<td><input type="button" value="${ordItemVO.ord_id}" id="ord_detail1" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#toReview<%= no %>"}></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rt_comm}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_review==null? "未審核": ordItemVO_Modal.ord_item_review}</td>
																	<td style=" margin-bottom: auto">
<%-- 																		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordItem/ordItem.do" style="text-align: center; margin-bottom: auto"> --%>
<!-- 																		<input type="submit" value="審核" id="review"> -->
																		<input type="button" value="審核" id="review" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#rv_modal<%= no %>" ${ordItemVO.ord_item_sp_status==null? "disabled": ""}>
<%-- 																		<A type="button" href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Review">審核</a> --%>
<%-- 																	<input type="hidden" name="whichPage"  value="<%=whichPage%>"> --%>
																		<input type="hidden" name="prod_id"  value="${ordItemVO.prod_id}">
																		<input type="hidden" name="ord_id"  value="${ordItemVO.ord_id}">
																		<input type="hidden" name="tab"  value="1">
																		<input type="hidden" name="action"	value="getOneModal_For_Review">
<!-- 																		</FORM> -->
<!-- 																		改成modal彈跳視窗 -->
<%-- 																		<A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">檢舉</a> --%>
<!-- 																		改成modal彈跳視窗 -->
																	
																	</td>
																</tr>
																
<!-- 審核 -->
				
	<div class="modal" id="rv_modal<%= no %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel"><b style="color:black">訂單檢舉</b></h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
				<div class="container">
					<div class="form-group" style="width:700px">
							<h4>訂單內容</h4>
							<hr>
							<h4 style="display:inline">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</h4>
							<span style="font-size: 1.5em; color: Tomato; text-indent:300px; display:inline">
								<i class="fas fa-coins"></i>
								<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
							</span>
							<h4 style="display:inline">X ${ordItemVO.ord_item_qty}</h4>
							
							<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="">
					</div>
					<br>
					<div class="form-group" style="width:700px">
							<h3>檢舉理由</h3>
							<hr>
							<h5>${ordItemVO.ord_item_rt_comm} </h5><br> 
							<div>${ordItemVO.ord_item_rt_pic} </div>
					</div>
					
					
					<br>
					<h3>審核</h3>
					<hr>
					<span id="result_error<%=no%>" style="color:red"></span>
					<span id="reason_error<%=no%>" style="color:red"></span>
					<div class="input-group-icon mt-10" style="width: 200px; ">
						<div class="icon">
							<i class="fa fa-thumb-tack" aria-hidden="true"></i>
						</div>
						<div class="form-select" id="default-select">
							<select style="width: 120px" id="report_result<%=no%>" name="report_result">
								<option value="0">審核結果</option> 
								<option value="通過" >通過</option>
								<option value="不通過" >不通過</option>
							</select>
						</div>
					</div> 
					<br>
					
					

 		    		<div class="form-group" style="width:700px"> 
 		    		<textarea class="form-control" id="reason<%=no%>" rows="5" placeholder="請輸入審核理由"></textarea> 
 		    		</div> 
 		    		<br>
 		    		<input type="button" value="提交" class="button" id="submit<%=no %>">
<%--  		    		<input type="submit" value="送出" id="submit<%=no %>"> --%>
<%--  		    		<input type="button" value="提交" class="button" id="submit<%=no %>" onclick="reviewSubmit()"> --%>
 		    		<input type="hidden" name="prod_id" id="product_id" value='${ordItemVO.prod_id}'>
					<input type="hidden" name="ord_id"  id="ord_id" value='${ordItemVO.ord_id}'>
					<input type="hidden" name="img"  value="">
 		    		
 		    		
		</div>
								                        
								                        </div>
								                        <div class="modal-footer">
<!-- 								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button> -->
<!-- 								                            <button type="button" class="btn btn-primary">Confirm</button> -->
								                        </div>
								                    </div>
								                </div>	
											</div>				
																
																
																
																
<!-- 審核 -->
																
																														
<script>
(function($) {
 	$('#submit<%=no%>').on('click', function () {
// 	function reviewSubmit(e){
		 var $this = $(this);
// 		 console.log("e.target="+e);
		 console.log("$this="+$this);
		 console.log("$this.val()="+$this.val());
		 var c=0;
		 $("#result_error<%=no%>").text("");
		 $("#reason_error<%=no%>").html("");
		 console.log("#report_result="+$("#report_result<%=no%>").val());
		 console.log("#reason="+$("#reason<%=no%>").val());
		 console.log("ord_id="+ $this.next().next().val());
		 console.log("prod_id="+ $this.next().val());
		 console.log("ord_id="+ '${ordItemVO.ord_id}');
		 console.log("prod_id="+ '${ordItemVO.prod_id}');
		 
		 var has_empty = false;
		    
		 if ($("#report_result<%=no%>").val()==0){
			 $("#result_error<%=no%>").text("請輸入審核理由");
			 has_empty = true;
			 c++;
		 } 
		 
		 if ($("#reason<%=no%>").val()==null || $("#reason<%=no%>").val().trim().length==0){
			 has_empty = true;
			 if (c==0)
			 	$("#reason_error<%=no%>").text("請輸入審核描述");
			 else
			 	$("#reason_error<%=no%>").html("<br>請輸入審核描述");
			 
		 } 
		 if ( has_empty ) { 
		 	 return false; 
		 }
		 
		 var $this = $(this);
		 console.log("11111111");
		 console.log("reason<%=no%>=" + $("#reason<%=no%>").val());
		 console.log("report_result<%=no%>=" + $("#report_result<%=no%>").val());
		 console.log("22222222");
	     	$.ajax({
	    		url: '<%=request.getContextPath()%>/ordItem/ordItem.do',
	    		type: "post",
	    		data: { 'action': 'getOne_For_Review_Update', 'ord_id': '${ordItemVO.ord_id}' , 'prod_id': '${ordItemVO.prod_id}', 'ord_item_review' : $("#report_result<%=no%>").val(), 'ord_item_rv_des' : $("#reason<%=no%>").val()  },
	    		dataType: 'json',
	    		success: function(res){
	    			console.log("0000000000");
	    			console.log(res);
	    			swal({
	    				title: "完成!",
	    				text: "已完成審核",
	    				type: "success",
	    				timer: 3000
	    			});
	    			console.log("11111111");
	    			setInterval(function() { window.location.href = '<%=request.getContextPath()%>/back-end/ord/back_listAllOrd.jsp';}, 2000);
	    			console.log("22222222");
	    		},
	    		error: function(res){
	    			console.log("eeeeeeee");
	    			console.log("res="+res);
	    		}
	    	});
// 	};
		});
})(jQuery);
</script>																	
																
																
																
																
																
																	<!--訂單明細modal -->
<div class="modal" id="toReview<%= no %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel">訂單明細</h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
		<div class="container">
			<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<div class="container">
								<hr>
								<div class="row">
									<div class="col-xs-3 col-sm-3">
										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px">
									</div>
									<div class="col-xs-6 col-sm-6">
										<h5>${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
											</span>
											X ${ordItemVO.ord_item_qty}
										</h5>
									</div>
								</div>
							</div>
							
			</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>收件人資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</td></tr> --%>
<%-- 								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</td></tr> --%>
<%-- 								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</td></tr> --%>
<%-- 								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</td></tr> --%>
<!-- 							</table> -->
								<span>收件人　　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</span><br>
								<span>收件人電話　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</span><br>
								<span>收件人地址　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</span><br>
								<span>收件備註　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px; display: ${ordItemVO.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>檢舉狀態</th><td>${ordItemVO.ord_item_rt_status}</td></tr> --%>
<%-- 								<tr><th>檢舉時間</th><td>${ordItemVO.ord_item_rt_date}</td></tr> --%>
<%-- 								<tr><th>檢舉理由</th><td>${ordItemVO.ord_item_rt_comm} <br> ${ordItemVO.ord_item_rt_pic} </td></tr> --%>
<%-- 								<tr><th>檢舉審核結果</th><td>${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</td></tr> --%>
<%-- 								<tr><th>檢舉審核描述</th><td>${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</td></tr> --%>
<!-- 							</table> -->
								<span>檢舉狀態　　　${ordItemVO.ord_item_rt_status}</span><br>
								<span>檢舉時間　　　${ordItemVO.ord_item_rt_date}</span><br>
								<span>檢舉理由　　　${ordItemVO.ord_item_rt_comm}</span><br>
								<span>檢舉照片<br></span>
								<span style="padding-left:100px">${ordItemVO.ord_item_rt_pic}</span><br><br>
								<span>檢舉審核結果　${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</span><br>
								<span>檢舉審核描述　${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3 style="display:inline">訂單狀態 </h3>
							<c:choose>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">已檢舉</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('未檢舉')}">
							        <span><h4 style="display:inline">已收貨</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rc_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">待收貨</h4></span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
							<hr>
							
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>訂單歷史</h3>
							<hr>
							
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div style="display:inline-block;width:700px">
												<ul class="timeline timeline-horizontal">
													<li class="timeline-item" style="width:170px">
														<div class="timeline-badge ${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">訂單成立
																<p><small class="text-muted"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_sp_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">出貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rc_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">收貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rt_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">檢舉時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
						
					</div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">送出</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>	
								                


<!--訂單明細modal -->



	
				
																
																
																
																
																
															</c:if>
														</c:forEach>
													</tbody>
												</table>
												
								
											
												
												
												
												
												
  </div>

  <div id="reviewed" class="w3-container city" style="display:none" style="width:1100px">
    <p> </p> 
    <table id="bootstrap-data-table1" class="table table-striped table-bordered table-hover" style="width:100%">
													<thead>
														<tr class="">
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
<%-- 																	<td><A href="<%=request.getContextPath()%>/ordItem/ordItem.do?prod_id=${ordItemVO.prod_id}&ord_id=${ordItemVO.ord_id}&action=getOneModal_For_Detail">${ordItemVO.ord_id}</a></td> --%>
																	<td><input type="button" value="${ordItemVO.ord_id}" id="ord_detail1" class="btn btn-outline-info mb-1" data-toggle="modal" data-target="#reviewed<%= no1 %>"}></td>
																	<!--改成modal彈跳視窗 -->
																	<td style=" margin-bottom: auto"><img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="50px" style="margin-bottom: auto"></td>
																	<td style=" margin-bottom: auto"><a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${ordItemVO.prod_id}">${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}</a></td>
																	<td style=" margin-bottom: auto"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd"/></td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rt_comm}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_review}</td>
																	<td style=" margin-bottom: auto">${ordItemVO.ord_item_rv_des}</td>
																</tr>
																
																
																<!--訂單明細modal -->
<div class="modal" id="reviewed<%= no1 %>" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
								                <div class="modal-dialog modal-lg" role="document">
								                    <div class="modal-content">
								                        <div class="modal-header">
								                            <h3 class="modal-title" id="largeModalLabel">訂單明細</h3>
								                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                                <span aria-hidden="true">&times;</span>
								                            </button>
								                        </div>
								                        <div class="modal-body">
		<div class="container">
			<div class="form-group" style="width:700px">
							<h3>訂單內容</h3>
							<div class="container">
								<hr>
								<div class="row">
									<div class="col-xs-3 col-sm-3">
										<img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${ordItemVO.prod_id}" alt="" width="200px">
									</div>
									<div class="col-xs-6 col-sm-6">
										<h5>${prodSvc.getOneProd(ordItemVO.prod_id).prod_name}
											<span style="font-size: 1em; color: Tomato; text-indent:50px;">
												<i class="fas fa-coins"></i>
												<b>${prodSvc.getOneProd(ordItemVO.prod_id).prod_price}</b>
											</span>
											X ${ordItemVO.ord_item_qty}
										</h5>
									</div>
								</div>
							</div>
							
			</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>收件人資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>收件人</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</td></tr> --%>
<%-- 								<tr><th>收件人電話</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</td></tr> --%>
<%-- 								<tr><th>收件人地址</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</td></tr> --%>
<%-- 								<tr><th>收件備註</th><td>${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</td></tr> --%>
<!-- 							</table> -->
								<span>收件人　　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_receiver}</span><br>
								<span>收件人電話　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_tel}</span><br>
								<span>收件人地址　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_add}</span><br>
								<span>收件備註　　${ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm==null? "無" : ordSvc.getOneOrd(ordItemVO.ord_id).ord_rc_comm}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px; display: ${ordItemVO.ord_item_rt_status.equals("已檢舉")? "" : "none"}" >
							<h3>檢舉資訊</h3>
							<hr>
<!-- 							<table> -->
<%-- 								<tr><th>檢舉狀態</th><td>${ordItemVO.ord_item_rt_status}</td></tr> --%>
<%-- 								<tr><th>檢舉時間</th><td>${ordItemVO.ord_item_rt_date}</td></tr> --%>
<%-- 								<tr><th>檢舉理由</th><td>${ordItemVO.ord_item_rt_comm} <br> ${ordItemVO.ord_item_rt_pic} </td></tr> --%>
<%-- 								<tr><th>檢舉審核結果</th><td>${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</td></tr> --%>
<%-- 								<tr><th>檢舉審核描述</th><td>${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</td></tr> --%>
<!-- 							</table> -->
								<span>檢舉狀態　　　${ordItemVO.ord_item_rt_status}</span><br>
								<span>檢舉時間　　　${ordItemVO.ord_item_rt_date}</span><br>
								<span>檢舉理由　　　${ordItemVO.ord_item_rt_comm}</span><br>
								<span>檢舉照片<br></span>
								<span style="padding-left:100px">${ordItemVO.ord_item_rt_pic}</span><br><br>
								<span>檢舉審核結果　${ordItemVO.ord_item_review==null? "未審核": ordItemVO.ord_item_review}</span><br>
								<span>檢舉審核描述　${ordItemVO.ord_item_rv_des==null? "未審核": ordItemVO.ord_item_rv_des}</span><br>
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3 style="display:inline">訂單狀態 </h3>
							<c:choose>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('已檢舉')}">
							        <span><h4 style="display:inline; padding-left:30px">已檢舉</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rt_status.equals('未檢舉')}">
							        <span><h4 style="display:inline">已收貨</h4></span>
							    </c:when>
							    <c:when test="${ordItemVO.ord_item_rc_status==null}">
							        <span><h4 style="display:inline; padding-left:30px">待收貨</h4></span>
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
							<hr>
							
						</div>
						<br>
						<div class="form-group" style="width:700px">
							<h3>訂單歷史</h3>
							<hr>
							
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div style="display:inline-block;width:700px">
												<ul class="timeline timeline-horizontal">
													<li class="timeline-item" style="width:170px">
														<div class="timeline-badge ${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">訂單成立
																<p><small class="text-muted"><fmt:formatDate value="${ordSvc.getOneOrd(ordItemVO.ord_id).ord_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_sp_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">出貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_sp_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rc_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">收貨時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rc_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge ${ordItemVO.ord_item_rt_date==null? '':'primary'}"><i class="glyphicon glyphicon-time" style="font-size: 1em;"></i></div>
														<div class="timeline-panel">
															<div class="timeline-heading">檢舉時間
																<p><small class="text-muted"><fmt:formatDate value="${ordItemVO.ord_item_rt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></small></p>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
						
					</div>
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
<!-- 								                            <button type="button" class="btn btn-primary">送出</button> -->
								                        </div>
								                    </div>
								                </div>
								            </div>	
								                


<!--訂單明細modal -->
																
																
																
															</c:if>
														</c:forEach>
													</tbody>
												</table>

</div>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->   
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
    </div>
    <!-- /#right-panel -->
    



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


