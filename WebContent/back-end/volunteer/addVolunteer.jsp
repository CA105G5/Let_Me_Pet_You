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
		 <h3>�Ӥu��Ʒs�W</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

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
		<td><input type="RADIO" name="vlt_gender" value="M" ${(volunteerVO.vlt_reg=='M')? 'checked':'' }/>�k
			<input type="RADIO" name="vlt_gender" value="F" ${(volunteerVO.vlt_reg=='F')? 'checked':'' }/>�k</td>
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
</body>