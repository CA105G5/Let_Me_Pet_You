<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescuing.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
RescuingVO rescuingVO = (RescuingVO) request.getAttribute("rescuingVO");
List<RescuingVO> listRescuingMem;
listRescuingMem =(List<RescuingVO>) request.getAttribute("listRescuingMem");
if(listRescuingMem==null){
	RescuingService rescuingSvc =new RescuingService();
	Map<String, String[]> map = new TreeMap<String, String[]>();
	map.put("rsc_id", new String[] {rescuingVO.getRsc_id()});
	listRescuingMem = rescuingSvc.getAll(map);
	pageContext.setAttribute("listRescuingMem",listRescuingMem);
}
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<!-- Site Title -->
<title>浪我陪你-完成救援報告</title>

<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

table{
	border-spacing:10px !important;
	border-collapse:separate !important;
}
#scroll {
    /*width: 150px;*/
    height: 350px;
    overflow: scroll;
}
li>a{
	color:black;
}
li>a:hover{
	text-decoration:none;
	color:red;
}


</style>
</head>
<body>

<jsp:include page="/index_Header.jsp" flush="true" />
		<div class="row d-flex justify-content-center" style="background-image: url(http://www.savedogs.org/upload/Masthead/r/rw4cztmo87qqjof8mm5wovypicoyu4cl1hx0/main.jpg); height: 250px;width: 1900px;margin-left: 7.5px;margin-right: 0px;">
				<div class="col-md-9 pb-40 header-text text-center" style="margin-top: 100px;">
				<br><br><br>
				<h1 class="pb-10"style="color:white;">搶救生命，分秒必爭</h1>
				</div>
			</div>
	
	<section style="padding-top:30px" class="training-area section-gap">
		<div class="container-fulid">
		
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
				<div class="col-xs-12 col-sm-1"></div>
					<div class="col-xs-12 col-sm-2" style="top: 10px; bottom: auto;">
						<div class="single-widget category-widget"style="padding-top: 20px;">
						<h2 class="title" style="margin-bottom:10px;padding-top:0px;margin-top:0px">救援</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>新增救援</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp" class="justify-content-between align-items-center d-flex"><h4>今日救援地圖</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>救援案例總覽</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp" class="justify-content-between align-items-center d-flex"><h4>待完成救援案例</h4></a></li>
					
							</ul>
					</div>
					</div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-1"></div>
					<div class="col-xs-12 col-sm-7">
						<div class="row">
							
							<form>
   								<h1>完成案例報告</h1>
   								<br>
   								
								<h4>救援案例編號：</h4>					  			
								<input type="text" id="rsc_id" name="rsc_id" value="${rescuingVO.rsc_id}" readonly="readonly" required="" class="single-input">
								<br>
								<h4>填寫會員暱稱：</h4>
								<input type="text" name="memb_nick" value="${memSvc.getOneMem(rescuingVO.rscing_ptcp).memb_nick}" readonly="readonly" required="" class="single-input">
								<input type="hidden" name="reporter" id="reporter" value="${rescuingVO.rscing_ptcp}">
								<br>
								<div class="single-element-widget mt-30 ">
								
								
									 <c:choose>
									 <c:when test="${listRescuingMem.size()==1}">
									 <h4 style="color:red">無其它會員參與救援</h4>
									 </c:when>
									 <c:otherwise>
									 <h4>一起參與的會員：</h4>
									    <div class="switch-wrap justify-content-between " id="scroll">
									    <c:forEach var="rescuingVO2" items="${listRescuingMem}">
									    <c:if test="${rescuingVO2.rscing_ptcp!=rescuingVO.rscing_ptcp}" var="condition" scope="page">
									        <div class="checkbox">
									            <label><input style="height: 20px;margin-top: 0px;bottom: 50px;top: 40px;width: 20px;" type="checkbox" name="rscing_ptcp" value="${rescuingVO2.rscing_ptcp}">
									            
									            <table style="text-align:center">
									            <tr>
									            <td>
										<img style="width:80px;height:80px"src="<%=request.getContextPath()%>/back-end/members/memImg.do?memb_id=${memSvc.getOneMem(rescuingVO2.rscing_ptcp).memb_id}" alt="">
										</td>
										
										<td style="width:100px;text-aling:center" >${memSvc.getOneMem(rescuingVO2.rscing_ptcp).memb_nick}</td>

									            </tr>
									            </table>
									            </label>
									        </div>
									        </c:if>
									    </c:forEach>
										</div>
									</c:otherwise>
									</c:choose>

								
								</div>
								<br>
								<br>
								<h4>完成描述：<strong style="color:red">必填!</strong></h4>
						  		<textarea name="rscing_cdes" id="rscing_cdes" rows="10" cols="80"><%= (rescuingVO.getRscing_cdes()==null)? "" : rescuingVO.getRscing_cdes()%></textarea>
			            		<script> 
			            		CKEDITOR.replace("rscing_cdes", {
  				                   	removePlugins:'image',
                               		extraPlugins: 'easyimage',
                               		height:500,
				                    cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
				                    cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',}); </script> 
			            		<br>
								<br>
								<br>
								<div class="genric-btn success circle arrow" id="done">送出報告</div>
							</form>
						</div>
					</div>
					<div class="col-xs-12 col-sm-1"></div>
				</div>
			</div>
		</div>
	</section>



<script type="text/javascript">
$(document).ready(function() {
	
	$('#done').click(function(e){
		var doneRescueMemslist =[];
		<%System.out.println("000000000000");%>
		 console.log(CKEDITOR.instances.rscing_cdes.getData());
		 
		if(CKEDITOR.instances.rscing_cdes.getData()==""){
			swal({
	    	     title: "錯誤!",
	    	     text: "完成描述請勿空白!",
	    	     type: "error",
	    	    
	    	});
			return false;
		}else{

		 $('input[name="rscing_ptcp"]:checked').each(function(){
			 console.log("---------------!!!!!!!!!!!!!!!!!!!!!" + $(this).val());
			 doneRescueMemslist.push($(this).val());
// 			 console.log($(e));
// 			 console.log($(e.target));
		 });
		 console.log(doneRescueMemslist);
		 swal({
			  title: "確定送出報告?",
			  text: "送出後無法更改!",
			  type: "warning",
			  showCancelButton: true,
	   		  showCloseButton: true,
			}).then(
			function(result){
			  if (result) {
				  console.log("11111");
				  $.ajax({
	     		     type: "POST",
	     			 url: "<%=request.getContextPath()%>/back-end/rescuing/RescuingAjax.do", 
	     			 data:{
	     				 "action":"doneReport",
	     				 "rsc_id":$('#rsc_id').val(),
	     				 "rscing_ptcp":doneRescueMemslist,
	     				 "rscing_cdes":CKEDITOR.instances.rscing_cdes.getData(),
	     				 "reporter":($('#reporter').val())
	     				 },
	     			 datatype:"json",
	     			 error: function(){alert("AJAX-grade發生錯誤囉!")},
	     			 success:function(data){
	     				swal({
				    	     title: "完成!",
				    	     text: "已送出報告!",
				    	     type: "success",
				    	    
				    	}).then(
				    			function(result){
				    		if(result){
				    		setTimeout("document.location.href='<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp'",100);
				    	}
				    		}
				    			)
     	     			 
	     				

	     			 }
	     		 }) 
			  }
			}, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
        		swal("取消", "取消送出!", "error");
        }).catch(swal.noop);
		
		
		
		
		
		
		
		
		}
		
	});
	
	
	
	
	
	
	
});

</script>

</body>

</html>