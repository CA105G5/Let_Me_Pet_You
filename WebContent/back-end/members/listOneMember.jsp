<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //MemServlet.java(Concroller), 存入req的memVO物件
%>

<html> 
<head>
<title>會員資料 - listOneMem.jsp</title>

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
		 <h3>員工資料 - ListOneMember.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>會員編號</th>
		<th>會員狀態</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員姓名</th>
		<th>會員暱稱</th>
		<th>會員Email</th> 
		<th>會員照片</th>
	</tr>
	<tr>
		<td><%=memVO.getMemb_id()%></td>
		<td><%=memVO.getMemb_sta()%></td>
		<td><%=memVO.getMemb_acc()%></td>
		<td><%=memVO.getMemb_psw()%></td>
		<td><%=memVO.getMemb_name()%></td>
		<td><%=memVO.getMemb_nick()%></td>
		<td><%=memVO.getMemb_email()%></td>
		<td><img src="<%=request.getContextPath()%>/back-end/members/memImg.do?memb_id=${memVO.memb_id}"/></td>
	</tr>
</table>

</body>
</html>