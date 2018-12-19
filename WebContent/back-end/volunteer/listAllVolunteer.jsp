<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.volunteer.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    VolunteerService volunteerSvc = new VolunteerService();
    List<VolunteerVO> list = volunteerSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��Ӥu���</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��Ӥu���</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�Ӥu�s��</th>
		<th>�m�W</th>
		<th>�K�X</th>
		<th>�ʧO</th>
		<th>�q��</th>
		<th>�Ӥ�</th>
		<th>�[�J���</th>
		<th>�i�ȶԤ�</th>
		<th>�Ӥu���A</th>
		<th>�A�Ȱϰ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="volunteerVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${volunteerVO.vlt_id}</td>
			<td>${volunteerVO.vlt_name}</td>
			<td>${volunteerVO.vlt_pw}</td>
			<td>${volunteerVO.vlt_gender}</td>
			<td>${volunteerVO.vlt_tel}</td>
			<td><img src="<%=request.getContextPath()%>/back-end/volunteer/volunteerImg.do?vlt_id=${volunteerVO.vlt_id}"/></td> 
			<td>${volunteerVO.vlt_registerdate}</td>
			<td>${volunteerVO.vlt_duty_day}</td>
			<td>${volunteerVO.vlt_sta}</td>
			<td>${volunteerVO.vlt_reg}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/volunteer/volunteer.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="vlt_id"  value="${volunteerVO.vlt_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/volunteer/volunteer.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="vlt_id"  value="${volunteerVO.vlt_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>