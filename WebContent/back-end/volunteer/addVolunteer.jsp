<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>
 
<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>志工資料新增 </title>
<script src="<%=request.getContextPath()%>/horse_UI_template/js/vendor/jquery-2.2.4.min.js"></script>



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
<div class="container">
					<div class="row">
						<div class=" col-lg-12">	
               <div class="card">
                        <div class="card-header" align="center">志工新增</div>
                        <div class="card-body card-block">
                            <form action="volunteer.do" method="post" class="">
                            	<div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">志工信箱(帳號):</div>
                                        <input type="email" id="vlt_mail" name="vlt_mail" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_mail()%>">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">志工姓名:</div>
                                        <input type="text" id="vlt_name" name="vlt_name" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_name()%>">
                                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">手機號碼:</div>
                                        <input type="text" id="vlt_tel" name="vlt_tel" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_tel()%>">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">可值勤日:<font color=red><b>*</b></font></div>
                                        <select size="1" name="vlt_duty_day">
												<option value="平日" ${(volunteerVO.vlt_duty_day=='平日')? 'selected':'' }>平日
												<option value="假日" ${(volunteerVO.vlt_duty_day=='假日')? 'selected':'' }>假日
												<option value="每日" ${(volunteerVO.vlt_duty_day=='每日')? 'selected':'' }>每日
			
										</select>
                                        
                                    </div>
                                </div>
                                <jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">服務區域:<font color=red><b>*</b></font></div>
                                        <select size="1" name="reg_id">
											<c:forEach var="regionVO" items="${regionSvc.all}">
												<option id="${regionVO.reg_id}" value="${regionVO.reg_id}" ${(volunteerVO.vlt_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
											</c:forEach>
										</select>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">志工性別:</div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        		<label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="vlt_gender" class="form-check-input" value="男" ${(volunteerVO.vlt_gender=='M')? 'checked':''} >男
                                                </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="vlt_gender" class="form-check-input" value="女" ${(volunteerVO.vlt_gender=='F')? 'checked':'' } >女
                                                </label>
                                        
                                    </div>
                                </div>
                                <input type="hidden" name="action" value="insert">
                                <div class="form-actions form-group" align="center">
                                    <button type="submit" class="btn btn-primary btn-sm">送出新增</button>
                                </div>
                            </form>
                        </div>
                    </div>
               </div>
         </div>
 </div>             

				
<img id="miracleBtn" style="width:60px;height:60px;"class="img-fluid" src="<%=request.getContextPath()%>/images/magicbtn.png">


              
                
                   
            <!-- /#add-category -->
        </div>
      </div>  
            <!-- .animated -->
</div>



<script type="text/javascript">
			$('#miracleBtn').click(function(){
				console.log('1111111111111111');
				$('#vlt_mail').val('ca105demo@gmail.com');
				$('#vlt_name').val('商商');
				$('#vlt_tel').val('0979-089890');
				$("#inline-radio1").prop("checked",true);
				$("#REG0000004").prop("selected",true);
				
			});
</script> 

</body>
</html>