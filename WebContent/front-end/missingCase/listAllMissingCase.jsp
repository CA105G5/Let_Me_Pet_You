<%@page import="java.util.List"%>
<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	missingCaseService missingCaseSvc = new missingCaseService();
	List<missingCaseVO> list = missingCaseSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ����ܮר� - listAllMissingCase.jsp</title>

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
		<tr>
			<td>
				<h3>�Ҧ��ר� - missingCase.jsp</h3>
				<h4>
					<a href="select_missing_case.jsp"><img
						src="images/icons-return.png" width="32" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>�רҽs��</th>
			<th>�|���s��</th>
			<th>���ܤ��</th>
			<th>���ܤ��e�y�z</th>
			<th>���ܰʪ��W��</th>
			<th>���ܦa�I</th>
			<th>���ܮרҤW�[���A</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="missingCaseVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${missingCaseVO.missing_case_id}</td>
				<td>${missingCaseVO.memb_id}</td>
				<td>${missingCaseVO.missing_date}</td>
				<td>${missingCaseVO.missing_des}</td>
				<td>${missingCaseVO.missing_name}</td>
				<td>${missingCaseVO.missing_loc}</td>
				<td><img
					src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"></td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="missing_case_id" value="${missingCaseVO.missing_case_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/missingCase/miss.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="missing_case_id"  value="${missingCaseVO.missing_case_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>