<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mem.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //MemServlet.java(Concroller), �s�Jreq��memVO����
%>

<html> 
<head>
<title>�|����s���� - listOneMember.jsp</title>

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
	width: 600px;
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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�|����s���� - listOneMember.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�|���m�W</th>
		<th>�|���ʺ�</th>
		<th>�|��Email</th>
		<th>�|�����</th>
		<th>�|���ʧO</th>
		<th>�H�Υd����</th>
		<th>���d�H</th>
		<th>�H�Υd����~</th>
		<th>�H�Υd�����</th>
		<th>�|���Ӥ�</th>
	</tr>
	<tr>
		<td><%=memVO.getMemb_id()%></td>
		<td><%=memVO.getMemb_acc()%></td>
		<td><%=memVO.getMemb_psw()%></td>
		<td><%=memVO.getMemb_name()%></td>
		<td><%=memVO.getMemb_nick()%></td>
		<td><%=memVO.getMemb_email()%></td>
		<td><%=memVO.getMemb_cellphone()%></td>
		<td><%=memVO.getMemb_gender()%></td>
		<td><%=memVO.getMemb_cre_type()%></td>
		<td><%=memVO.getMemb_cre_name()%></td>
		<td><%=memVO.getMemb_cre_year()%></td>
		<td><%=memVO.getMemb_cre_month()%></td>
		<td><%=memVO.getMemb_photo()%></td>
	</tr>
</table>

</body>
</html>