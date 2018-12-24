<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.volunteer.model.*"%>

<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�Ӥu��ƭק�</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�Ӥu��ƭק�</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="volunteer.do" name="form1">
<table>
	<tr>
		<td>�Ӥu�s��:<font color=red><b>*</b></font></td>
		<td><%=volunteerVO.getVlt_id()%></td>
	</tr>
	<tr>
		<td>�Ӥu�m�W:</td>
		<td><input type="TEXT" name="vlt_name" size="45" 
			 value="<%=volunteerVO.getVlt_name()%>" /></td>
	</tr>
	<tr>
		<td>�Ӥ�:</td>
		<td><img src="<%=request.getContextPath()%>/back-end/volunteer/volunteerImg.do?vlt_id=${volunteerVO.vlt_id}"/></td>
	</tr>
	<tr>
		<td>e-mail(�b��):</td>
		<td><input type="TEXT" name="vlt_mail" size="45"
			 value="<%=volunteerVO.getVlt_mail()%>" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>�K�X:</td> -->
<!-- 		<td><input type="TEXT" name="vlt_pw" size="45" -->
<%-- 			 value="<%=volunteerVO.getVlt_pw()%>" /></td> --%>
<!-- 	</tr> -->

	<tr>
		<td>�ʧO:</td>
		<td><input type="RADIO" name="vlt_gender" value="M" ${(volunteerVO.vlt_gender=="M")? "checked":'' }/>�k
			<input type="RADIO" name="vlt_gender" value="F" ${(volunteerVO.vlt_gender=="F")? "checked":'' }/>�k</td>
	</tr>
	<tr>
		<td>������X:</td>
		<td><input type="TEXT" name="vlt_tel" size="45"
			 value="<%=volunteerVO.getVlt_tel()%>" /></td>
	</tr>
	<tr>
		<td>�[�J���:</td>
		<td><%=volunteerVO.getVlt_registerdate()%></td>
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
		<tr>
		<td>�Ӥu���A:<font color=red><b>*</b></font></td>
		<td><select size="1" name="vlt_sta">
				<option value="��¾�Ӥu" ${(volunteerVO.vlt_sta=='��¾�Ӥu')? 'selected':'' }>��¾�Ӥu
				<option value="�ϴ���" ${(volunteerVO.vlt_sta=='�ϴ���')? 'selected':'' }>�ϴ���
				<option value="�b¾�Ӥu" ${(volunteerVO.vlt_sta=='�b¾�Ӥu')? 'selected':'' }>�b¾�Ӥu
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="updatebymanager">
<input type="hidden" name="vlt_id" value="<%=volunteerVO.getVlt_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>
</html>