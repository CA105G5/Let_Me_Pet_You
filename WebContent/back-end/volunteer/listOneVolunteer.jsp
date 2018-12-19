<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.volunteer.model.VolunteerService"%>
<%@ page import="com.volunteer.model.VolunteerVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.volunteer.model.VolunteerService"%>
<%@ page import="com.volunteer.model.VolunteerVO"%>

<%
  VolunteerVO volunteerVO = (VolunteerVO) request.getAttribute("volunteerVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
  pageContext.setAttribute("volunteerVO", volunteerVO);
%>

<html>
<head>
<title>志工資料</title>

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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>志工資料</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>志工編號</th>
		<th>姓名</th>
		<th>密碼</th>
		<th>性別</th>
		<th>電話</th>
		<th>照片</th>
		<th>加入日期</th>
		<th>可值勤日</th>
		<th>志工狀態</th>
		<th>服務區域</th>
	</tr>
	<tr>
		<td><%=volunteerVO.getVlt_id()%></td>
		<td><%=volunteerVO.getVlt_name()%></td>
		<td><%=volunteerVO.getVlt_pw()%></td>
		<td><%=volunteerVO.getVlt_gender()%></td>
		<td><%=volunteerVO.getVlt_tel()%></td>
		<td><img src="<%=request.getContextPath()%>/volunteer/volunteerImg.do?vlt_id=${volunteer.vlt_id}"/></td>
		<td><%=volunteerVO.getVlt_registerdate()%></td>
		<td><%=volunteerVO.getVlt_duty_day()%></td>
		<td><%=volunteerVO.getVlt_sta()%></td>
		<td><%=volunteerVO.getVlt_reg()%></td>
	
	</tr>
</table>

</body>
</html>