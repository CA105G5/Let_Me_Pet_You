<%@page import="java.sql.Timestamp"%>
<%@page import="com.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String missing_case_id = request.getParameter("missing_case_id");
	MemVO membVO = (MemVO) session.getAttribute("memVO");
	Timestamp report_missing_time = new Timestamp(System.currentTimeMillis());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<form METHOD="post"
		ACTION="<%=(membVO == null)
					? request.getContextPath() + "/front-end/members/login.jsp"
					: "http://localhost:8081/CA105G5/front-end/missingCase/reportMissing.do"%>">
		<div class="input-group mb-3">
			<input type="text" class="form-control" name="report_missing_cont"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<input type="hidden" name="missing_case_id"
			value="<%=request.getParameter("missing_case_id")%>"> <input
			type="hidden" name="memb_id"
			value="<%=(membVO == null) ? "" : membVO.getMemb_id()%>"> <input
			type="hidden" name="report_missing_sta" value="待審核"> <input
			type="hidden" name="report_missing_time"
			value="<%=report_missing_time%>"> <input type="hidden"
			name="action" value="insert">
	</form>

</body>
</html>