<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title>管理員登入畫面</title>

			
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">


</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="container" style="margin-top:160px">
					<div class="row">
						<div class="col-lg-offset-3 col-lg-6">
							<div class="card">
	                            <div class="card-header" align="center">
	                                <strong style="color:brown;font-size:50px">LET ME PET YOU</strong> <br><div style="color:black;font-size:50px">管理員登入系統</div>
	                            </div>
	                            		<form action="manager.do" method="post" class="form-horizontal">
	                            <div class="card-body card-block">
	                                
	                                    <div class="row form-group">
	                                        <div class="col col-md-3"><label for="ma_acc" class=" form-control-label">帳號:</label></div>
	                                        <div class="col-12 col-md-9"><input type="text" id="ma_acc" name="ma_acc" placeholder="" class="form-control" value=""><span class="help-block"></span></div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3"><label for="ma_psw" class=" form-control-label">密碼:</label></div>
	                                        <div class="col-12 col-md-9"><input type="password" id="ma_psw" name="ma_psw" placeholder="" class="form-control" value=""><span class="help-block"></span></div>
	                                    </div>
	                                    <input type="hidden" name="action" value="login">
	                                
	                            </div>
	                            <div class="card-footer" align="center">
	                                <button type="submit" class="btn btn-primary btn-sm">
	                                    <i class="fa fa-dot-circle-o"></i> 登入
	                                </button>
	                                <button type="reset" class="btn btn-danger btn-sm">
	                                    <i class="fa fa-ban"></i> 清除
	                                </button>
	                            </div>
	                            		</form>
	                            		
                     		</div>
						</div>
					</div>
</div>
	<button id="miracleBtn"></button>				
 <script type="text/javascript">
			$('#miracleBtn').click(function(){
				console.log('1111111111111111');
				$('#ma_acc').val('hmkuo');
				$('#ma_psw').val('123456');
				
				
				
			});
</script>   

    

			
			
			
</body>
</html>