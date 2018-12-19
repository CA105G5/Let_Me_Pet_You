<%@page import="com.missingCase.model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>

<% missingCaseVO missingCaseVO = (missingCaseVO) request.getAttribute("missingCaseVO");%>
<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>

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

<table id="table-1">
	<tr><td>
		 <h3>失蹤案例 - listOneMissingCase.jsp</h3>
		 <h4><a href="select_missing_case.jsp"><img src="images/icons-return.png" width="32" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>案例編號</th>
		<th>會員編號</th>
		<th>失蹤日期</th>
		<th>失蹤內容描述</th>
		<th>失蹤動物名稱</th>
		<th>失蹤地點</th>
		<th>失蹤案例上架狀態</th>
	</tr>
	<tr>
			<td>${missingCaseVO.missing_case_id}</td>
			<td>${missingCaseVO.memb_id}</td>
			<td>${missingCaseVO.missing_date}</td>
			<td>${missingCaseVO.missing_des}</td>
			<td>${missingCaseVO.missing_name}</td>
			<td>${missingCaseVO.missing_loc}</td> 
			<td><img src="<%=request.getContextPath() %>/missingcase/missingcase.do?missingcaseno=${missingCaseVO.missing_case_id }"></td>
	</tr>
</table>

</body>
</html>