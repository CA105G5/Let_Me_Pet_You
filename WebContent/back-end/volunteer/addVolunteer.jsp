<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>

<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�Ӥu��Ʒs�W </title>



</head>
<body bgcolor='white'>
<jsp:include page="/back-end/manager/back_end_index_header.jsp" flush="true" />
<div id="right-panel" class="right-panel">
	<div class="content">
	<div class="animated fadeIn">
	<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="container" style="margin-top:300px;margin-left:500px">
					<div class="row">
						<div class="col-lg-offset-3 col-lg-6">	
               <div class="card">
                        <div class="card-header" align="center">�Ӥu�s�W</div>
                        <div class="card-body card-block">
                            <form action="volunteer.do" method="post" class="">
                            	<div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">�Ӥu�H�c(�b��):</div>
                                        <input type="email" id="email3" name="vlt_mail" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_mail()%>">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">�Ӥu�m�W:</div>
                                        <input type="text" id="username3" name="vlt_name" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_name()%>">
                                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">������X:</div>
                                        <input type="text" id="phone3" name="vlt_tel" class="form-control" value="<%= (volunteerVO==null)? "" : volunteerVO.getVlt_tel()%>">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">�i�ȶԤ�:<font color=red><b>*</b></font></div>
                                        <select size="1" name="vlt_duty_day">
												<option value="����" ${(volunteerVO.vlt_duty_day=='����')? 'selected':'' }>����
												<option value="����" ${(volunteerVO.vlt_duty_day=='����')? 'selected':'' }>����
												<option value="�C��" ${(volunteerVO.vlt_duty_day=='�C��')? 'selected':'' }>�C��
			
										</select>
                                        
                                    </div>
                                </div>
                                <jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">�A�Ȱϰ�:<font color=red><b>*</b></font></div>
                                        <select size="1" name="reg_id">
											<c:forEach var="regionVO" items="${regionSvc.all}">
												<option value="${regionVO.reg_id}" ${(volunteerVO.vlt_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
											</c:forEach>
										</select>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">�Ӥu�ʧO:</div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        		<label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="vlt_gender" class="form-check-input" value="�k" ${(volunteerVO.vlt_gender=='M')? 'checked':''} >�k
                                                </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="vlt_gender" class="form-check-input" value="�k" ${(volunteerVO.vlt_gender=='F')? 'checked':'' } >�k
                                                </label>
                                        
                                    </div>
                                </div>
                                <input type="hidden" name="action" value="insert">
                                <div class="form-actions form-group" align="center">
                                    <button type="submit" class="btn btn-primary btn-sm">�e�X�s�W</button>
                                </div>
                            </form>
                        </div>
                    </div>
               </div>
         </div>
 </div>             

				
			


              
                
                   
            <!-- /#add-category -->
        </div>
      </div>  
            <!-- .animated -->
</div>





</body>
</html>