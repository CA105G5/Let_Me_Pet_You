<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>

<%
    MemService memSvc = new MemService();
    List<MemVO> list = memSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>所有會員資料 - listAllMembers.jsp</title>

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
<body bgcolor='orange'>
<table id="table-1">
	<tr><td>
		 <h3>所有會員資料 - listAllMembers.jsp</h3>
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
		<th>會員編號</th>
		<th>會員狀態</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員姓名</th>
		<th>會員暱稱</th>
		<th>會員Email</th>
		<th>會員違規次數</th>
		<th>會員照片</th>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memVO.memb_id}</td>
			<td>${memVO.memb_sta}</td>
			<td>${memVO.memb_acc}</td>
			<td>${memVO.memb_psw}</td>
			<td>${memVO.memb_name}</td>
			<td>${memVO.memb_nick}</td> 
			<td>${memVO.memb_email}</td>
			<td>${memVO.memb_vio_times}</td>
			<td><img src="<%=request.getContextPath()%>/back-end/members/memImg.do?memb_id=${memVO.memb_id}"/></td> 
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/members/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="memb_id"  value="${memVO.memb_id}">
			     <input type="hidden" name="action"	value="updateFromManager"></FORM>
			</td>
		</tr>
	</c:forEach>

</table>
<%@ include file="page2.file" %>

</body>


</html>