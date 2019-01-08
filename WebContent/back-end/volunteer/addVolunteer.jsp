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
               <div class="card">
                        <div class="card-header">Example Form</div>
                        <div class="card-body card-block">
                            <form action="#" method="post" class="">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">Username</div>
                                        <input type="text" id="username3" name="username3" class="form-control">
                                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">Email</div>
                                        <input type="email" id="email3" name="email3" class="form-control">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">Password</div>
                                        <input type="password" id="password3" name="password3" class="form-control">
                                        <div class="input-group-addon"><i class="fa fa-asterisk"></i></div>
                                    </div>
                                </div>
                                <div class="form-actions form-group">
                                    <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
              

				<h3>��Ʒs�W:</h3>



<FORM METHOD="post" ACTION="volunteer.do" name="form1">
<table>
	<tr>
		<td>�Ӥu�m�W:</td>
		<td><input type="TEXT" name="vlt_name" size="45" 
			 value="<%= (volunteerVO==null)? "���" : volunteerVO.getVlt_name()%>" /></td>
	</tr>
	<tr>
		<td>e-mail(�b��):</td>
		<td><input type="TEXT" name="vlt_mail" size="45"
			 value="<%= (volunteerVO==null)? "jjuies424@gmail.com" : volunteerVO.getVlt_mail()%>" /></td>
	</tr>

	<tr>
		<td>�ʧO:</td>
		<td><input type="RADIO" name="vlt_gender" value="�k" ${(volunteerVO.vlt_gender=='M')? 'checked':'' }/>�k
			<input type="RADIO" name="vlt_gender" value="�k" ${(volunteerVO.vlt_gender=='F')? 'checked':'' }/>�k</td>
	</tr>
	<tr>
		<td>������X:</td>
		<td><input type="TEXT" name="vlt_tel" size="45"
			 value="<%= (volunteerVO==null)? "0939-393570" : volunteerVO.getVlt_tel()%>" /></td>
	</tr>

	<tr>
		<td>�i�ȶԤ�:<font color=red><b>*</b></font></td>
		<td><select size="1" name="vlt_duty_day">
				<option value="����" ${(volunteerVO.vlt_duty_day=='����')? 'selected':'' }>����
				<option value="����" ${(volunteerVO.vlt_duty_day=='����')? 'selected':'' }>����
				<option value="�C��" ${(volunteerVO.vlt_duty_day=='�C��')? 'selected':'' }>�C��
			
		</select></td>
	</tr>

	<jsp:useBean id="regionSvc" scope="page" class="com.region.model.RegionService" />
	<tr>
		<td>�A�Ȱϰ�:<font color=red><b>*</b></font></td>
		<td><select size="1" name="reg_id">
			<c:forEach var="regionVO" items="${regionSvc.all}">
				<option value="${regionVO.reg_id}" ${(volunteerVO.vlt_reg==regionVO.reg_id)? 'selected':'' } >${regionVO.reg_name}
			</c:forEach>
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
              
                
                   
            <!-- /#add-category -->
        </div>
            <!-- .animated -->
</div>





</body>
</html>