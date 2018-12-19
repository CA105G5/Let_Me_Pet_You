<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.volunteer.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    VolunteerService volunteerSvc = new VolunteerService();
    List<VolunteerVO> list = volunteerSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有志工資料</title>

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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有志工資料</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
		<th>修改</th>
		<th>刪除</th>
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
			     <input type="submit" value="修改">
			     <input type="hidden" name="vlt_id"  value="${volunteerVO.vlt_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/volunteer/volunteer.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="vlt_id"  value="${volunteerVO.vlt_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>