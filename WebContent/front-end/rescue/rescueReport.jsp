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
<meta charset="UTF-8">
<title>完成救援報告</title>

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


</style>
</head>
<body>

<jsp:include page="/index_Header.jsp" flush="true" />
	
	
	<section style="padding-top:30px" class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-xs-12 col-sm-2" style="top: 10px; bottom: auto;">
						<h3>救援</h3>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/addRescue.jsp">新增救援</a></h5>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescueMap.jsp">今日救援地圖</a></h5>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listAllRescue.jsp">救援案例總覽</a></h5>
						<hr>
						<h5><a href="<%=request.getContextPath()%>/front-end/rescue/listMemRescue.jsp">待完成救援案例</a></h5>
						<hr>
					</div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-1"></div>
					<div class="col-xs-12 col-sm-9">
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
								<h4>完成描述：</h4>
						  		<textarea name="rscing_cdes" id="rscing_cdes" rows="10" cols="80"><%= (rescuingVO.getRscing_cdes()==null)? "" : rescuingVO.getRscing_cdes()%></textarea>
			            		<script> CKEDITOR.replace("rscing_cdes"); </script> 
			            		<br>
								<br>
								<br>
								<div class="genric-btn success circle arrow" id="done">送出報告</div>
							</form>
						</div>
					</div>

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