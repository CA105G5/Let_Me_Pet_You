<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.prodimg.model.ProdImgService"%>
<%@ page import="com.prodimg.model.ProdImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.ProdService"%>
<%@ page import="com.prod.model.ProdVO"%>

<%
	Map<String, String> cartMap  = (Map<String, String>) session.getAttribute("cartMap");
	System.out.println("cartMap= " + cartMap);
	System.out.println("cartMap.size()= " + cartMap.size());
// 	String amount  = (String) session.getAttribute("amount");
// 	System.out.println("amount= " + amount);
	System.out.println("location=" + request.getRequestURI());
%>
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/ord/style.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">

<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"  type="text/javascript"></script>
    
<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}


</style>
</head>
<body>

	<jsp:include page="/front-end/ord/cart_Header.jsp"
		flush="true" />
	<script>
		$("#step_info").attr("class","current")
	</script>
	
<form action="<%=request.getContextPath()%>/ord/ord.do" method="post" class="form" novalidate="novalidate">	
	<div style="height:auto; padding-top: 25px;">
	    <h5 style="text-align:center">本次結帳總金額:　　<i class="fas fa-coins"></i> <b id="amount">${amount}　　</b></h5>
	    
	    <a style="text-align:center; text-decoration: none;" id="collapse" data-toggle="collapse" href="#cc1" aria-expanded="false" aria-controls="#cc1">
		    <h5 style="text-align:center; color:black">總計　
		    	<b id="total_qty">${total_qty}　</b>件商品　 
				<i class="fa fa-chevron-down" id="collapse_icon"></i>
				
			</h5>
		</a>
	   
		<div class="collapse" id="cc1">
			<div class="shopping-cart" style="height:auto; width:825;">
		      	<div class="title">
		        	購物車清單
		     	</div>
		     	
				<c:forEach var="prod_id" items="${cartMap.keySet()}">
			      <div class="item">
			
			        <div class="image">
			          <img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prod_id}" alt="" width="100">
			        </div>
			
			        <div class="description">
			          <span>
			          	<a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prod_id}">
			          		${prodSvc.getOneProd(prod_id).prod_name}
			          	</a>
			          	<input type="hidden" name="prod_id" value='${prod_id}'>
			          </span>
			        </div>
			
			        <div class="quantity">
			          ${cartMap.get(prod_id)}
			          <input type="hidden" name="quantity" value='${cartMap.get(prod_id)}'>
			        </div>
			        <span></span>
			
			        <div class="total-price">
			        	<i class="fas fa-coins"></i><b>  ${prodSvc.getOneProd(prod_id).prod_price}</b>
			        </div>
			      </div>
			      
				</c:forEach>
			</div>
				    
<!-- 			<div class="shopping-cart" style="height:auto"> -->
<%-- 				<h3 style="text-align:right">結帳總金額:　　<i class="fas fa-coins"></i> <b id="amount">${amount}　　</b></h3> --%>
<!-- 			</div> -->
		</div>
	</div>
	
    <div class="row" style="height:auto; padding-top: 25px;">
    	<div class="col-lg-6 col-lg-offset-3">
			<div class="card">
<!-- 		    	<div class="card-header"> -->
<!-- 		        	<strong class="card-title">Credit Card</strong> -->
<!-- 		        </div> -->
		        <div class="card-body">
		        <!-- Credit Card -->
		        	<div id="pay-invoice">
		            	<div class="card-body">
		                	<div class="card-title">
		                    	<h3 class="">收件人資訊</h3>
		                 	</div>
		                    <hr>
                            <div class="form-group">
                                <label for="ord_receiver" class="control-label mb-1"><h4>姓名<span style="color:red">*　　　　　</span></h4></label><span id="error_name" style="color:red; font-size:14px"></span>
                                <input id="ord_receiver" name="ord_receiver" type="text" class="form-control" aria-required="true" aria-invalid="false" style="height:50px">
                            </div>
                            <div class="form-group">
                                <label for="ord_rc_tel" class="control-label mb-1"><h4>手機號碼<span style="color:red">*　　　</span></h4></label><span id="error_tel" style="color:red; font-size:14px"></span>
                                <input id="ord_rc_tel" name="ord_rc_tel" type="text" class="form-control ord_rc_tel valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="ord_rc_tel" aria-required="true" aria-invalid="false" aria-describedby="ord_rc_tel" style="height:50px">
                            </div>
                            <div class="form-group">
                                <label for="ord_rc_add" class="control-label mb-1"><h4>地址<span style="color:red">*　　　　　</span></h4></label><span id="error_add" style="color:red; font-size:14px"></span>
                                <div class="test-object-has-zipcode my-20"></div>
<!--                            style="width:80px; display: inline" -->
                                <input id="ord_rc_add" name="ord_rc_add" type="tel" class="form-control cc-number identified visa" value="" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number" style="height:50px">
                            </div>
                            <div class="form-group">
                                <label for="ord_rc_comm" class="control-label mb-1"><h4>備註</h4></label>
                                <textarea id="ord_rc_comm" name="ord_rc_comm" rows="5" class="form-control ord_rc_comm valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="ord_rc_comm" aria-required="true" aria-invalid="false" aria-describedby="ord_rc_comm" ></textarea>
                            </div>
                            <div class="form-group">
								<br>
								<br>
		                        <input type="hidden" name="ord_total" value="${amount}">
								<input type="hidden" name="action" value="insert">
								<input type="submit" value="確認結帳" id="check_Confirm" class="btn btn-success btn-lg form-control" style="background-color: #96c03d; height:50px">
                          	</div>
                        </div>
                    </div>
                </div>
            </div> <!-- .card -->    
        </div>
    </div>
</form>	
    <div style="height:25px;"></div>
		

    <script type="text/javascript">
    	var t=0;
    	$('#collapse').on('click', function(e) {
    		t++;
	    	e.preventDefault();
	    	if(t%2==1){
        		$('#collapse_icon').attr('class','fa fa-chevron-up');
	    	} else{
        		$('#collapse_icon').attr('class','fa fa-chevron-down');
	    	}
        	console.log($('#collapse_icon').attr("class"));
    	});

   
    	
    </script>
    
    <script src="<%=request.getContextPath()%>/front-end/ord/tw-city-selector.js"></script>

	<script>
	  // --------------------
		// role-attribute 方式加載
		// --------------------
	
	  new TwCitySelector();
	
	
	  // --------------------
	  // 實例方式加載
		// --------------------
	
		// 實例方式加載 - 無zipcode
	  var a = new TwCitySelector({
	    el: '.test-object-normal'
	  });
	
	  // 實例方式加載 - 有zipcode
	  var a = new TwCitySelector({
	    el: '.test-object-has-zipcode',
	    hasZipcode: true
	  });
	
	  // 實例方式加載 - 正體字
	  var a = new TwCitySelector({
	    el: '.test-object-standard-words',
	    standardWords: true
	  });
	
	  // 顯示部分縣市-台北市、台中市、高雄市
	  new TwCitySelector({
	    el: '.test-object-limit-counties',
	    only: ['台北市', '台中市', '高雄市']
	  });
	
	  // 顯示部分縣市及區域-台北市(大同區、萬華區)、台中市(西區)、嘉義市(不設限)
	  new TwCitySelector({
	    el: '.test-object-limit-counties-and-district',
	    only: ['台北市@大同區|萬華區', '台中市@西區', '嘉義市']
	    // only: '台北市@大同區|萬華區'
	  });
	
	  // 指定選單 element
	  new TwCitySelector({
	    el: '.city-selector-set',
	    elCounty: '.county', // 在 el 裡查找 element
	    elDistrict: '.district', // 在 el 裡查找 element
	    elZipcode: '.zipcode' // 在 el 裡查找 element
	  });
	
	  // new TwCitySelector({
	  //   el: '.selector-bootstrap',
	  //   elCounty: '.el-county',
	  //   countyClassName: 'county form-control',
	  //   elDistrict: '.el-district',
	  //   districtClassName: 'district form-control',
	  //   elZipcode: '.el-zipcode',
	  //   zipcodeClassName: 'zipcode form-control',
	  //   showZipcode: true
	  // });
	
	 
	</script>
	
<!-- 	設定select並行 -->
	<script type="text/javascript">
// 		$(".my-20").find("select").css("display": "inline");
// 		console.log("aaaaa"+$(".my-20").find("select"))
	</script>
	
<!-- 	錯誤檢查 -->

		    
	<script type="text/javascript">
		var pattern = /^[\u002B]?[0-9]{10,15}$/; 
		$(function () {
			event.preventDefault();
		$('.form').submit(function () {
			var $this = $('.form');
 			$('#error_name').text('');
 			$('#error_tel').text('');
 			$('#error_add').text('');
 			var ord_receiver = $('#ord_receiver').val().trim();
 			var ord_rc_tel = $('#ord_rc_tel').val().trim();
 			var ord_rc_add = $('#ord_rc_add').val().trim();
 			var county = $('.county').val().trim();
 			var district = $('.district').val().trim();
		    console.log('ord_receiver=' + ord_receiver);
		    console.log('ord_rc_tel=' + ord_rc_tel);
		    console.log('ord_rc_add=' + ord_rc_add);
		    console.log('county=' + county);
		    console.log('district=' + district);
		    
		    var has_empty = false;
		    
		    if (ord_receiver.length == 0){
		    	$('#error_name').text('| 請輸入姓名');
		    	has_empty = true;
		    }
		    if (ord_rc_tel.length == 0){
		    	$('#error_tel').text('| 請輸入手機號碼');
		    	has_empty = true;
		    }
		    if (!pattern.test(ord_rc_tel)){
		    	$('#error_tel').text('| 請輸入正確手機號碼');
		    	has_empty = true;
		    }
		    if (county.length == 0){
		    	$('#error_add').text('| 請選擇縣市');
		    	has_empty = true;
		    }
		    if (district.length == 0){
		    	$('#error_add').append(' | 請選擇區域');
		    	has_empty = true;
		    }
		    if (ord_rc_add.length <5){
		    	$('#error_add').append(' | 請輸入正確地址');
		    	has_empty = true;
		    }
		    
		    if ( has_empty ) { 
		    	return false; 
		    } else{
// 		    	setTimeout(function() { $this.submit();}, 3000); // 1 second delay
		    	swal({
		    	     title: "完成",
		    	     text: "已完成訂購",
		    	     type: "success",
		    	     timer: 3000
		    	}),
		    	function() { 
		    		$this.submit();
		    	};
		    	
		    }
		      
		      
		    	  
		});
		});
		
		//剛開始進來顯示購物車數量
		$(function(){
			$.ajax({
				url: '<%=request.getContextPath()%>/prodcart2.do',
				type: "get",
				success: function(res){
					console.log(res);
					if (parseInt(res) > 0){
						console.log("parseInt = " + parseInt(res));
						$('#itemCount').html(res).css('display', 'block');
					}
				},
				error: function(res){
					console.log(res);
				}
			
			});
		});
		
		
		
		
	</script>


	
</body>
</html>