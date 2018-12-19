<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>失蹤案例</title>

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
   <tr><td><h3>失蹤案例: 首頁</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for 失蹤案例: 首頁</p>

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
  <li><a href = "listAllMissingCase.jsp" >Click</a>all MissingCase.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="miss.do" >
        <b>輸入案例編號 (如S000000001):</b>
        <input type="text" name="missing_case_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="missingCaseSvc" scope="page" class="com.missingCase.model.missingCaseService" />
   
  <li>
     <FORM METHOD="post" ACTION="miss.do" >
       <b>選擇案例編號:</b>
       <select size="1" name="missing_case_id">
         <c:forEach var="missingCaseVO" items="${missingCaseSvc.all}" > 
          <option value="${missingCaseVO.missing_case_id}">${missingCaseVO.missing_case_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="miss.do" >
       <b>選擇失蹤寵物名稱:</b>
       <select size="1" name="missing_case_id">
         <c:forEach var="missingCaseVO" items="${missingCaseSvc.all}" > 
          <option value="${missingCaseVO.missing_case_id}">${missingCaseVO.missing_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>員工管理</h3>

<ul>
  <li><a href='addMissing.jsp'>Add</a> a new Emp.</li>
</ul>

</body>
</html>