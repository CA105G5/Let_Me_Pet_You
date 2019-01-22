<%@page import="com.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	ProdVO prodVO  = (ProdVO) request.getAttribute("prodVO");
	List<ProdImgVO> prodImgList  = (List<ProdImgVO>) request.getAttribute("prodImgList");
	request.setAttribute("Test", "Test");
	
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Horse Club</title>

<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

li>a{
	color:black;
}
li>a:hover{
	text-decoration:none;
	color:red;
}

</style>
</head>
<body>



	<jsp:include page="/index_Header.jsp" flush="true" />
	
	<img src="banner10.jpg" style="width:1500px; height:300px">
	
	<div class="container-fluid" style="padding-top: 50px">
		<div class="row">

			<div class="col-xs-12 col-sm-1"></div>
				<div class="col-xs-12 col-sm-2 sidebar" style="top: 0px; bottom: auto;">
					<div class="single-widget category-widget" style="padding-top:0px;">
						<h2 class="title" style="margin-bottom:10px;padding-top:30px;margin-top:0px">愛心捐贈</h2>
							<ul>
								<li><a href="<%=request.getContextPath()%>/front-end/donate/addMoneyDon.jsp" class="justify-content-between align-items-center d-flex"><h4>愛心捐款</h4></a></li>
								<li><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp" class="justify-content-between align-items-center d-flex"><h4>愛心商品捐贈</h4></a></li>
					
							</ul>
						<div style="padding-top: 20px;padding-left: 20px;">
                    		<img id="miracleBtn" style="width:60px;height:60px;"class="img-fluid" src="<%=request.getContextPath()%>/images/magicbtn.png">	
                		</div>
					</div>
				</div>
			<div class="col-xs-12 col-sm-1"></div>
			<div class="col-xs-12 col-sm-7">
				<div class="row">
					<h1 class="pb-10">愛心商品捐贈</h1>
					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<div>
							<font style="color:red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color:red">${message}</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
							<form METHOD="post" ACTION="<%=request.getContextPath()%>/product/product_upload.do" enctype="multipart/form-data">
								<div class="card">
			                        <div class="card-header" style="text-align:left">
										<strong>愛心商品捐贈</strong>
		                            </div>
									<br>
									<div class="card-body card-block">
										<div class="form-group" style="text-align:left">
											<label class=" form-control-label" >愛心商品名稱</label>
			                                <div class="input-group">
			                                    <div class="input-group-addon"><i style="color:orange" class="fas fa-bookmark"></i></div>
			                                    <input type="text" class="form-control" placeholder="愛心商品名稱" 
									  				   value="<%= (prodVO==null)? "" : prodVO.getProd_name()%>" id="prod_name" name="prod_name" >
			                                </div>      
			                            </div>
			                            <br>
										<div class="form-group" style="text-align:left">
											<label class=" form-control-label" >捐贈數量</label>
			                                <div class="input-group">
			                                    <div class="input-group-addon"><i style="color:green" class="fas fa-infinity"></i></div>
			                                    <input type="text" class="form-control" placeholder="捐贈數量" 
									  				   value="<%= (prodVO==null)? "" : prodVO.getProd_qty()%>" id="prod_qty" name="prod_qty" >
			                                </div>      
			                            </div>
			                            <br>
										<div class="form-group" style="text-align:left">
											<label class=" form-control-label" >愛心商品價格</label>
			                                <div class="input-group">
			                                    <div class="input-group-addon"><i style="color:brown" class="fas fa-coins"></i></div>
			                                    <input type="text" class="form-control" placeholder="愛心商品價格" 
									  				   value="<%= (prodVO==null)? "" : prodVO.getProd_price()%>" id="prod_price" name="prod_price" >
			                                </div>      
			                            </div>
			                            <br>
			                            <div class="form-group" style="text-align:left">
		                                    <label class=" form-control-label">愛心商品種類</label>
		                                    <div class="input-group">
		                                        <div class="input-group-addon"><i style="gray" class="fas fa-rocket"></i></div>
		                                        <select class="form-control custom-control" id="prod_type_id" name="prod_type_id" style="width: 100px; height:32px;" required="required">
												<option value="">請選擇
												<option value="食" ${ prodVO.prod_type_id.equals("食")? "selected":""}>食</option>
											    <option value="衣" ${ prodVO.prod_type_id.equals("衣")? "selected":""}>衣</option>
											    <option value="住" ${ prodVO.prod_type_id.equals("住")? "selected":""}>住</option>
											    <option value="行" ${ prodVO.prod_type_id.equals("行")? "selected":""}>行</option>
											    <option value="育" ${ prodVO.prod_type_id.equals("育")? "selected":""}>育</option>
											    <option value="樂" ${ prodVO.prod_type_id.equals("樂")? "selected":""}>樂</option>
												
										  	</select>
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group" style="text-align:left">
		                                    <label class=" form-control-label">愛心商品使用對象</label>
		                                    <div class="input-group">
		                                        <div class="input-group-addon"><i style="color:lightblue" class="fas fa-bone"></i></i></div>
		                                        <select class="form-control custom-control" id="prod_ani_type_id" name="prod_ani_type_id" style="width: 100px; height:32px;" required="required">
												<option value="">請選擇
												<option value="貓" ${ prodVO.prod_ani_type_id.equals("貓")? "selected":""}>貓</option>
											    <option value="狗" ${ prodVO.prod_ani_type_id.equals("狗")? "selected":""}>狗</option>
											    <option value="飛禽" ${ prodVO.prod_ani_type_id.equals("飛禽")? "selected":""}>飛禽</option>
											    <option value="兔" ${ prodVO.prod_ani_type_id.equals("兔")? "selected":""}>兔</option>
											    <option value="其他" ${ prodVO.prod_ani_type_id.equals("其他")? "selected":""}>其他</option>
												
										  	</select>
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group" style="text-align:left">
											<label class=" form-control-label" >愛心商品資訊</label>
			                                <div class="input-group">
			                                    <div class="input-group-addon"><i style="color:purple" class="fas fa-plus-circle"></i></div>
			                                    <textarea class="form-control custom-control" rows="5" style="resize:none;" id="prod_info" name="prod_info"><%= (prodVO==null)? "" : prodVO.getProd_info() %></textarea>
			                                </div>      
			                            </div>
			                            <br>
			                            <div class="form-group" style="text-align:left">
		                                    <label class=" form-control-label">上傳商品照片</label>
		                                    <div class="input-group" id="preview">
		                                    	<img width="300" height="200" src="<%=request.getContextPath()%>/front-end/donate/noPic.png" style="padding-right: 30px;"/>
		                                    </div>
		                                    <div style="width:270px;text-align:center">
												<input type="file" class="upl custom-file-input" id="prod_img" name="prod_img" multiple >
												<label class="genric-btn info-border small" for="prod_img" >選擇圖片</label>
											</div>
		                                </div>
		                                <br>
										<div class="form-group" style="text-align:left">
		                                    <label class=" form-control-label">愛心商品描述</label>
		                                    <div class="input-group">
		                                    </div>
		                                    <textarea rows="30" cols="80" name="prod_des" id="prod_des"><%= (prodVO==null)? "" : prodVO.getProd_des()%></textarea>
		                                    <script> CKEDITOR.replace( 'prod_des', {
					            				extraPlugins: 'easyimage',
					            				height:300,
					            			    cloudServices_tokenUrl: 'https://36758.cke-cs.com/token/dev/g529dLeMZwwIpbMNAdeiRdeIbIjTrMw6aq0ncGUTnfbb08SqLh6Z2I87wBM3',
					            			    cloudServices_uploadUrl: 'https://36758.cke-cs.com/easyimage/upload/',
					            			}); </script> 
		                                </div>
									</div>
									
									<input type="hidden" name="action" value="insert">
		                            <div align="center">
		                            	<button class="genric-btn primary" style="width:120px;height:40px;font-size:20px;" id="submit">送出</button>
			                            <br>
			                            <br>
		                            </div>
									
							</div>
							</form>
						</div>
					</div>

				</div>
			</div>
	
	<script>
		var i;
		var files = $("#form :file"); //若只有單一表格要做動態樣式，則可以使用css選擇器
		$("#prod_img").change(function() {
			$("#preview").html("");
			console.log(this);
			readURL(this);
		});
	
		function readURL(input) {
			if (input.files && input.files.length>= 0) {
				for (var i = 0; i < input.files.length; i++) {
					var reader = new FileReader();
					reader.readAsDataURL(input.files[i]);
					reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src', e.target.result);
						console.log(img);
						$("#preview").append(img).append("<br>").append("<br>");
					}
				}
			}
		}
	
	</script>
	
	<script>
		
		$("ul.nav-menu li").attr('class', "" );
		$("#donate").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>
	
	
<!-- 神奇小按鈕 -->
	<script type="text/javascript">
				$(function(){
					$('#miracleBtn').click(function(){
					console.log('1111111111111111');
					$('#prod_name').val('仿生態烏龜缸');
					$('#prod_qty').val('1');
					$('#prod_price').val('100');
					$('#prod_type_id').val('住');
					$('#prod_ani_type_id').val('其他');
					$('#prod_info').val('【產品名稱】仿生態烏龜缸+加溫燈泡+烏龜島造景<br>'+
							'【產品規格】尺寸約50cm*60cm*60cm<br>'+
							'【產品產地】美國<br>');
					});
				});
	</script>

	
</body>
</html>