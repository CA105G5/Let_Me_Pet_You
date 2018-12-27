<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Members</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>Members</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Members</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
<li><a href='listAllMembers.jsp'>List all members.</a>  <br><br></li>
  <li>
    <FORM METHOD="post" ACTION="mem.do" >
        <b>查詢全部會員</b>
        <input type="hidden" name="action" value="getAll">
        <input type="submit" value="開始查">
    </FORM>
  </li>
  
  <li>
    <FORM METHOD="post" ACTION="mem.do" >
        <b>輸入會員編號 (如M000000001):</b>
        <input type="text" name="memb_id">
        <input type="hidden" name="action" value="getOne">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
   <li>
     <FORM METHOD="post" ACTION="mem.do" >
       <b>選擇會員編號:</b>
       <select size="1" name="memb_id">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.memb_id}">${memVO.memb_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne">
       <input type="submit" value="送出">
    </FORM>
  </li>

</ul>


<h3>會員管理</h3>



</body>






</html>