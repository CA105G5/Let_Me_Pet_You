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
	
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id;
	if(memVO!=null)
		memb_id = memVO.getMemb_id();
%>

<jsp:useBean id="bankDAO" scope="page" class="com.bank.model.BankJDBCDAO" />

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

/* tab panel */

body {
  font: 30px/1.5 sans-serif;
  padding: 1rem;
}

dt {
  font-weight: bold;
}

dl {
  margin-bottom: 50px;
}

#bug:target {
  outline: 4px solid #ccc;
}

/**
 * tab panel widget
 */
.tabPanel-widget {
  position: relative;  /* containing block for headings (top:0) */
  background: #66CDAA;
}

/**
 * because labels come first in source order - we use z-index to move them in front of the headings
 */
.tabPanel-widget > label {
  position: absolute;
  z-index: 1;
}

/**
 * labels and headings must share same values so grouping declarations in this rule prevents async edits (risk of breakage)
 * line-height == height -> vertical centering
 * the width dictates the offset for all headings but the first one: left offset = width * number of previous heading(s)
 * note that width and offset of label/heading pair can be customized if necessary
 */

.tabPanel-widget > label,
.tabPanel-widget > h2 {
  font-size: 1.1em;
  width: 9em;
  height: 2em;
  line-height: 2em;
  
}

/**
 * position:relative is for the markers (the down arrow in tabs)
 */
.tabPanel-widget > h2 {
  position: relative;
  margin: 0;
  text-align: center;
  background: #66CDAA;
  color: black;
  height: 50px; 
  font-size:20px;
/*   width:50%; */
}

.tabPanel-widget > label {
  border-right: 1px solid #fff; 
  height: 50px; 
  text-align: center;
/*   width:50%; */
}

/**
 * all first level labels and headings after the very first ones 
 */
.tabPanel-widget > label ~ label,
.tabPanel-widget > h2 ~ h2 {
  position: absolute;
  top: 0;
}


/**
 * We target all the label/heading pairs
 * we increment the :nth-child() params by 4 as well as the left value (according to "tab" width)
 */

.tabPanel-widget label:nth-child(1),
.tabPanel-widget h2:nth-child(3) {
  left: 0em;
}

.tabPanel-widget label:nth-child(5),
.tabPanel-widget h2:nth-child(7) {
  left: 9em;
}

.tabPanel-widget label:nth-child(9),
.tabPanel-widget h2:nth-child(11) {
  left: 18em;
}

/**
 * we visually hide all the panels
 * https://developer.yahoo.com/blogs/ydn/clip-hidden-content-better-accessibility-53456.html
 */
.tabPanel-widget input + h2 + div {
  position: absolute !important;
  clip: rect(1px, 1px, 1px, 1px);
  padding:0 !important;
  border:0 !important;
  height: 1px !important; 
  width: 1px !important; 
  overflow: hidden;
}
/**
 * we reveal a panel depending on which control is selected 
 */
.tabPanel-widget input:checked + h2 + div {
  position: static !important;
  padding: 1em !important;
  height: auto !important; 
  width: auto !important; 
}

/**
 * shows a hand cursor only to pointing device users
 */
.tabPanel-widget label:hover {
  cursor: pointer;
}

.tabPanel-widget > div {
  background: #f0f0f0;
  padding: 1em;
}

/**
 * we hide radio buttons and also remove them from the flow
 */
.tabPanel-widget input[name="tabs"] {
  opacity: 0;
  position: absolute;
}


/** 
 * this is to style the tabs when they get focus (visual cue)
 */

.tabPanel-widget input[name="tabs"]:focus + h2 {
  outline: 1px dotted #000;
  outline-offset: 10px;
}


/**
 * reset of the above within the tab panel (for pointing-device users)
 */
.tabPanel-widget:hover h2 {
  outline: none !important;
}

/**
 * visual cue of the selection
 */
.tabPanel-widget input[name="tabs"]:checked + h2 {
  background: #F4A460;
}

/**
 * the marker for tabs (down arrow)
 */
.tabPanel-widget input[name="tabs"]:checked + h2:after {
  content: '';
  margin: auto;
  position: absolute;
  bottom: -10px;
  left: 0;
  right: 0;
  width: 0;
  height: 0;
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-top: 10px solid #F4A460;
}

/**
 * Make it plain/simple below 45em (stack everything)
 */
@media screen and (max-width: 45em) {
  
  /* hide unecessary label/control pairs */
  .tabPanel-widget label,
  .tabPanel-widget input[name="tabs"] {
    display: none;
  }
  
  /* reveal all panels */
  .tabPanel-widget > input + h2 + div {
    display: block !important;
    position: static !important;
    padding: 1em !important;
    height: auto !important; 
    width: auto !important; 
  }
  
  /* "unstyle" the heading */
  .tabPanel-widget h2 {
    width: auto;
    position: static !important;
    background: #FFE4E1 !important;
  }
  
  /* "kill" the marker */
  .tabPanel-widget h2:after {
    display: none !important;
  }

}

/* tab panel */


</style>
</head>
<body>



	<jsp:include page="/index_Header.jsp" flush="true" />
	
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->

<!-- 			<!-- 左側邊list-group --> 
<!-- 			<div class="col-xs-12 col-sm-3"> -->
<!-- 				<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto"> -->
<!-- 					<h3>愛心捐贈</h3> -->
<!-- 					<hr> -->
<%-- 					<h5><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心捐款</a></h5> --%>
<!-- 					<hr> -->
<%-- 					<h5><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心商品捐贈</a></h5> --%>
<!-- 					<hr> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	<section class="training-area section-gap">
		<div class="container">
			<div id="sider" class="n-browse-nav m-sticky-on" style="top: 180px; bottom: auto;">
				<div class="row">
					<div class="col-lg-3 cl-md-3" style="top: 180px; bottom: auto;">
						<div id="sider" class="n-browse-nav m-sticky-on" style="top: 150px; position: fixed; bottom: auto">
							<h3>愛心捐贈</h3>
							<hr>
							<h5><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心捐款</a></h5>
							<hr>
							<h5><a href="<%=request.getContextPath()%>/front-end/donate/addProdDon.jsp">愛心商品捐贈</a></h5>
							<hr>
						</div>
					</div> <!-- position: fixed -->
					<div class="col-xs-12 col-sm-9">
						<div class="row">
							<h1 class="pb-10">愛心捐款</h1>
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
							
							<br>
							<br>
							
							<div class="tabPanel-widget" style="width:1000px;" >
								<label for="tab-1" tabindex="0" style="height:50px; width:50%"></label>
								<input id="tab-1" type="radio" name="tabs" checked="true" aria-hidden="true" style="height:50px">
								<h2>轉帳捐款</h2>
								<div>
									<h4>
										收款帳號資訊: <br>
										銀行代碼：中華郵政（700）中壢分行<br>
										銀行戶名：浪我陪你動物救援協會<br>
										銀行帳號：1234567-7654321<br>
										可臨櫃填寫匯款單，也可使用ATM轉帳，轉帳後請填寫下表捐款資訊。<br>
									</h4>
<%-- 									<form METHOD="post" ACTION="<%=request.getContextPath()%>//donate/donate.do" enctype="multipart/form-data"> --%>
				                        <div class="card">
				                            <div class="card-header"><strong><i class="glyphicon glyphicon-user"></i>　基本資料</strong><small></small></div>
				                            <div class="card-body card-block">
				                                <div class="form-group"><label for="name" class=" form-control-label">姓名</label><span id="name_error" style="color:red"></span>
				                                	<input type="text" id="trn_name" name="donate_name" placeholder="請輸入您的姓名" class="form-control">
				                                </div>
				                                <div class="form-group"><label for="tel" class=" form-control-label">電話</label><span id="phone_error" style="color:red"></span>
				                                	<input type="text" id="trn_tel" name="donate_phone" placeholder="請輸入您的電話" class="form-control">
				                                </div>
				                                <div class="form-group"><label for="email" class=" form-control-label">信箱</label><span id="mail_error" style="color:red"></span>
				                                	<input type="text" id="trn_email" name="donate_mail" placeholder="請輸入您的e-mail" class="form-control">
				                                </div>
				                            </div>
				                        </div>
				                        <br>
				                        <br>
				                        <div class="card">
				                            <div class="card-header"><strong><i class="glyphicon glyphicon-credit-card"></i>　帳戶資料</strong><small></small></div>
				                            <div class="card-body card-block">
				                                <div class="form-group">
				                                	<label for="cardnum" class=" form-control-label">轉出銀行</label><span id="bank_error" style="color:red"></span>
				                                	<div class="form-select" id="default-select" style="display:inline">
														<select style="width: 120px" id="prod_qty" name="bank_id">
															<option value="0">銀行代碼</option>
															<c:forEach var="trn_bankVO" items="${bankDAO.getAll()}">
																<option value="${bankVO.bank_id}">${bankVO.bank_id}　${bankVO.bank_name}</option>
															</c:forEach>
														</select>
													</div>
				                                </div>
				                                <br>
				                                <br>
				                                <div class="form-group">
				                                	<label for="month" class=" form-control-label">轉出帳號</label><br><span id="account_error" style="color:red"></span>
					                                <input type="text" id="trn_account" name="donate_src_trn" placeholder="轉出帳號" class="form-control" style="width:25%;display:inline">
				                                </div>
				                            </div>
				                        </div>
				                        <br>
				                        <br>
				                        <div class="card">
				                            <div class="card-header"><strong><i class="fa fa-usd"></i>　捐贈金額</strong><small></small></div><span id="money_error" style="color:red"></span>
				                            <div class="card-body card-block">
				                                <input type="text" id="trn_money" name="trn_donate_amount" placeholder="請輸入捐款金額" class="form-control">
				                            </div>
				                        </div>
									
									
									
									
									
									
									
										<br>
										<input type="hidden" name="action" value="transfer_donate">
										<input type="hidden" name="donate_src" value="轉帳">
				            			<input type = "submit" id="submit_transfer" value = "捐款" style="text-align:center;">
										<br>
<!-- 									</form> -->
								
							    </div>
							    
							    <label for="tab-2" tabindex="0"></label>
							    <input id="tab-2" type="radio" name="tabs" aria-hidden="true" style="height:50px">
							    <h2>信用卡捐款</h2>
							    <div>
<%-- 							    	<form METHOD="post" ACTION="<%=request.getContextPath()%>/donate/donate.do"> --%>
				                         <div class="card-header"><strong><i class="glyphicon glyphicon-user"></i>　基本資料</strong><small></small></div>
				                            <div class="card-body card-block">
				                                <div class="form-group"><label for="name" class=" form-control-label">姓名</label><span id="cre_name_error" style="color:red"></span>
				                                	<input type="text" id="cred_name" name="donate_name" placeholder="請輸入您的姓名" class="form-control">
				                                </div>
				                                <div class="form-group"><label for="tel" class=" form-control-label">電話</label><span id="cre_phone_error" style="color:red"></span>
				                                	<input type="text" id="cred_tel" name="donate_phone" placeholder="請輸入您的電話" class="form-control">
				                                </div>
				                                <div class="form-group"><label for="email" class=" form-control-label">信箱</label><span id="cre_mail_error" style="color:red"></span>
				                                	<input type="text" id="cred_email" name="donate_mail" placeholder="請輸入您的e-mail" class="form-control">
				                                </div>
				                            </div>
				                        <br>
				                        <br>
				                        <div class="card">
				                            <div class="card-header"><strong><i class="glyphicon glyphicon-credit-card"></i>　信用卡資料</strong><small></small></div>
				                            <div class="card-body card-block">
				                                <div class="form-group"><label for="cardnum" class=" form-control-label">信用卡號</label><span id="cre_num_error" style="color:red"></span>
				                                	<input type="text" id="cred_num" name="donate_src_cre" placeholder="請輸入信用卡號" class="form-control" style="width:25%">
				                                </div>
				                                <div class="form-group"><label for="month" class=" form-control-label">有效年月</label><span id="cre_date_error" style="color:red"></span><br>
					                                <input type="text" id="cred_year" name="credit_year" placeholder="有效年份" class="form-control" maxlength="2" style="width:12%;display:inline">
					                                <input type="text" id="cred_month" name="credit_month" placeholder="有效月份" class="form-control" maxlength="2" style="width:12%; display:inline" >
				                                </div>
				                                <div class="form-group"><label for="vat" class=" form-control-label">安全碼</label><span id="cre_vat_error" style="color:red"></span>
				                                	<input type="text" id="cred_vat" name="credit_vat" placeholder="安全碼" class="form-control" maxlength="3"　style="width:12%">
				                                </div>
				                            </div>
				                        </div>
				                        <br>
				                        <br>
				                        <div class="card">
				                            <div class="card-header"><strong><i class="fa fa-usd"></i>　捐贈金額</strong><span id="cre_money_error" style="color:red"></span></div>
				                            <div class="card-body card-block">
				                                <input type="text" id="cred_money" name="donate_amount" placeholder="請輸入捐款金額" class="form-control">
				                            </div>
				                        </div>
									
										<br>
										<input type="hidden" name="action" value="insert_cre">
										<input type="hidden" name="donate_src" value="信用卡">
				            			<input type="submit" id="submit_credit" value = "捐款" style="text-align:center;">
										<br>
<!-- 									</form> -->
							    
							    </div>
							</div>
							
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	
	<script>
		
		$("ul.nav-menu li").attr('class', "" );
		$("#donate").attr('class', 'menu-active menu-has-children' )
		 
		 
	</script>
	
	<script>
	
	//確認捐款
	var c=0;
		$("#submit_credit").click(function(){
			$('#cre_name_error').text('');
			$('#cre_phone_error').text('');
			$('#cre_mail_error').text('');
			$('#cre_date_error').text('');
			$('#cre_vat_error').text('');
			$('#cre_money_error').text('');
			$('#cre_num_error').text('');
			
			console.log("33333");
			if($('#cred_name').val() == null || $('#cred_name').val().trim().length==0){
				$('#cre_name_error').text('　　請輸入姓名');
				c++;
			} 
			if($('#cred_tel').val() == null || $('#cred_tel').val().trim().length==0){
				$('#cre_phone_error').text('　　請輸入電話');
				c++;
			} 
			if($('#cred_email').val() == null || $('#cred_email').val().trim().length==0){
				$('#cre_mail_error').text('　　請輸入e-mail');
				c++;
			} 
			if($('#cred_num').val() == null || $('#cred_num').val().trim().length==0){
				$('#cre_num_error').text('　　請輸入信用卡號');
				c++;
			} 
			if($('#cred_year').val() == null || $('#cred_year').val().trim().length!=2 || $('#cred_month').val() == null || $('#cred_month').val().trim().length!=2){
				$('#cre_date_error').text('　　請輸入信用卡有效年月日');
				c++;
			} 
			if($('#cred_vat').val() == null || $('#cred_vat').val().trim().length!=3){
				$('#cre_vat_error').text('　　　請輸入信用卡安全碼');
				c++;
			} 
			if($('#cred_money').val() == null || $('#cred_money').val().trim().length==0){
				$('#cre_money_error').text('　　請輸入捐款金額');
				c++;
			} 
			if(c!=0){
				return;
			}
			else {
				console.log("ajax");
					$.ajax({
						url: '<%=request.getContextPath()%>/donate/donate.do?action=credit_donate',
						type: "post",
						data: { 'action': 'insert_cre', 'donate_name': $('#cred_name').val(), 'donate_phone':$('#cred_tel').val(),
								'donate_mail': $('#cred_email').val(), 'donate_src_cre': $('#cred_num').val(), 'donate_amount': $('#cred_money').val(),
								'donate_src' : '信用卡'},
						dataType: 'json',
						success: function(res){
							console.log("success="+res);
							swal("完成", "浪我陪你動物救援平台感謝您的捐助", "success").catch(swal.noop);
							console.log("11111111");
			    			setInterval(function() { window.location.href = '<%=request.getContextPath()%>/donate/addMoneyDon.jsp';}, 2000);
						
						},
						error: function(res){
							console.log("error="+res);
						}
					
					});
					
			}
		});

		
		$("ul.nav-menu li").attr('class', "" );
		$("#shop").attr('class', 'menu-active menu-has-children' )

	</script>


	
</body>
</html>