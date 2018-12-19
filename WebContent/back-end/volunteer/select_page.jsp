<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Volunteer: Home</title>

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
   <tr><td><h3>Volunteer: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Volunteer: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllVolunteer.jsp'>List</a> all Volunteers.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="volunteer.do" >
        <b>��J�Ӥu�s�� (�pV000000001):</b>
        <input type="text" name="volunteer">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="volunteerSvc" scope="page" class="com.volunteer.model.VolunteerService" />
   
  <li>
     <FORM METHOD="post" ACTION="volunteer.do" >
       <b>��ܭ��u�s��:</b>
       <select size="1" name="volunteer">
         <c:forEach var="volunteerVO" items="${volunteerSvc.all}" > 
          <option value="${volunteerVO.vlt_id}">${volunteerVO.vlt_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="volunteer.do" >
       <b>��ܭ��u�m�W:</b>
       <select size="1" name="volunteer">
         <c:forEach var="volunteerVO" items="${volunteerSvc.all}" > 
          <option value="${volunteerVO.vlt_id}">${volunteerVO.vlt_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addVolunteer.jsp'>Add</a> a new volunteer.</li>
</ul>

</body>
</html>