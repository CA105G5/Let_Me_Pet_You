<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); 
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|����ƭק� - client_update.jsp</title>

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
		 <h3>�|����ƭק� - client_update.jsp</h3>
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

<FORM METHOD="post" ACTION="mem.do" name="form1">
<table>
	<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemb_id()%></td>
	</tr>
	<tr>
		<td>�|���b��:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemb_acc()%></td>
	</tr>
	<tr>
		<td>�|���K�X:</td>
		<td><input type="TEXT" name="memb_psw" size="45" value="<%=memVO.getMemb_psw()%>" /></td>
	</tr>
	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="memb_name" size="45" value="<%=memVO.getMemb_name()%>" /></td>
	</tr>
	<tr>
		<td>�|���ʺ�:</td>
		<td><input type="TEXT" name="memb_nick" size="45" value="<%=memVO.getMemb_nick()%>" /></td>
	</tr>
	<tr>
		<td>�|���H�c:</td>
		<td><input type="TEXT" name="memb_email" size="45" value="<%=memVO.getMemb_email()%>" /></td>
	</tr>
	<tr>
		<td>�|�����:</td>
		<td><input type="TEXT" name="memb_cellphone" size="45" value="<%=memVO.getMemb_cellphone()%>" /></td>
	</tr>
	<tr>
		<td>�|���ʧO:</td>
		<td><input type="TEXT" name="memb_gender" size="45" value="<%=memVO.getMemb_gender()%>" /></td>
	</tr>
	<tr>
		<td>�H�Υd����:</td>
		<td><input type="TEXT" name="memb_cre_type" size="45" value="<%=memVO.getMemb_cre_type()%>" /></td>
	</tr>
	<tr>
		<td>���d�H:</td>
		<td><input type="TEXT" name="memb_cre_name" size="45" value="<%=memVO.getMemb_cre_name()%>" /></td>
	</tr>
	<tr>
		<td>�H�Υd����~:</td>
		<td><input type="TEXT" name="memb_cre_year" size="45" value="<%=memVO.getMemb_cre_year()%>" /></td>
	</tr>
	<tr>
		<td>�H�Υd�����:</td>
		<td><input type="TEXT" name="memb_cre_month" size="45" value="<%=memVO.getMemb_cre_month()%>" /></td>
	</tr>

	<tr>
		<td>�|���Ӥ�:</td>
		<td><input type="TEXT" name="memb_photo" size="45" value="<%=memVO.getMemb_photo()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="client_update">
<input type="hidden" name="memb_id" value="<%=memVO.getMemb_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>




</html>