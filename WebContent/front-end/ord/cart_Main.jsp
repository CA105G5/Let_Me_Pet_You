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
	Map<String, String> cartMap  = (Map<String, String>) session.getAttribute("cartMap");
	System.out.println("cartMap= " + cartMap);
	System.out.println("cartMap.size()= " + cartMap.size());
	Integer amount  = (Integer) session.getAttribute("amount");
	System.out.println("amount= " + amount);
	System.out.println("location=" + request.getRequestURI());
	System.out.println("this is cartMain");
	
	
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String memb_id=null;
	if (memVO!=null){
		memb_id = memVO.getMemb_id();
	}
%>
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo3.png">

<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/ord/style.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>

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
	
	<div style="margin-top: 100px; margin-left: 300px; position: fixed" id="miracleBtn">
        	<i style="color:pink" class="fas fa-bolt"></i>
    </div>
	<div class="shopping-cart" style="height:auto; width:900px">
      	<div class="title">
        	購物車清單
     	</div>
     	<form method="post" action="<%=request.getContextPath()%>/prodcart2.do" >
		<c:forEach var="prod_id" items="${cartMap.keySet()}">
<%-- 		"prod_id=" + ${prod_id} --%>
	      <!-- Product #1 -->
	      <div class="item" ${prodSvc.getOneProd(prod_id).prod_stock==0? 'style=color:gray':""}>
<!-- 	      加上checkbox -->
<!-- 	      	<div class="switch-wrap d-flex justify-content-between"> -->
<!-- 				<div class="primary-checkbox"> -->
<!-- 					<input type="checkbox" id="default-checkbox"> -->
<!-- 					<label for="default-checkbox"></label> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 	      加上checkbox -->
	        <div class="buttons">
	          <span class="delete-btn"></span>
	          <span class="like-btn" id="${prod_id}"></span>
	        </div>
	
	        <div class="image">
<!-- 	          <img src="item-1.png" alt="" /> -->
	          <img class="img-fluid" src="<%=request.getContextPath()%>/util/PicReader?prod_id=${prod_id}" alt="" width="100">
	        </div>
	
	        <div class="description" style="width:150px">
	          <span>
	          	<a href="<%=request.getContextPath()%>/product/product_upload.do?action=getOne_For_Display&prod_id=${prod_id}">
	          		${prodSvc.getOneProd(prod_id).prod_name}
	          	</a>
	          	<input type="hidden" name="prod_id" value='${prod_id}'>
	          </span>
<!-- 	          <span>Bball High</span> -->
<!-- 	          <span>White</span> -->
	        </div>
	
	        <div class="quantity" style="margin-right: 30px;">
	          <button class="minus-btn" type="button" name="button" ${prodSvc.getOneProd(prod_id).prod_stock==0? "disabled":""}>
<!-- 	            <img src="minus.svg" alt="" /> -->
					<i class="glyphicon glyphicon-minus" style="color:gray"></i>
	          </button>
	          <input type="text" name="quantity" value="${prodSvc.getOneProd(prod_id).prod_stock==0? '0':cartMap.get(prod_id)}" class="${prod_id}" ${prodSvc.getOneProd(prod_id).prod_stock==0? 'readonly':''}>
	          <button class="plus-btn" type="button" name="button" ${prodSvc.getOneProd(prod_id).prod_stock==0? "disabled":""}>
<!-- 	            <img src="plus.svg" alt="" /> -->
					<i class="glyphicon glyphicon-plus" style="color:gray"></i>
	          </button>
	        </div>
	        <span style="width:150px; margin-top:25px; color:orange">${prodSvc.getOneProd(prod_id).prod_stock==0? '無庫存': ''}</span>
	
	        <div class="total-price" style="margin-right:10px">
	        	<i class="fas fa-coins"></i><b>  ${prodSvc.getOneProd(prod_id).prod_price}</b>
	        </div>
	      </div>
	      <script>
	      	
	      	console.log("目前數量=" + $('.${prod_id}').val());

		    var pattern = /^[1-9][0-9]?$/; 
		 // 判斷使用者輸入的數量是否正確
		    $('.${prod_id}').on('change', function() {
				var $this = $(this);
			    console.log('.on(change) = ' + $(this).val());
			    console.log(pattern.test($(this).val()));
		      	if ($this.val()<1 || !pattern.test($this.val()) ){
		      		$this.parent().next().text('輸入數量錯誤');
		      		function timer1(){
				    	$this.val(1);
			      		$this.parent().next().text('');
		      		
				    	$.ajax({
							url: '<%=request.getContextPath()%>/prodcart.do',
							type: "get",
							data: { 'action': 'changeCart', 'prod_qty': 1 , 'prod_id': '${prod_id}' },
							dataType: 'json',
							success: function(res){
								console.log("res=" + res);
								console.log(res.success);
								console.log(res.prod_stock);
								$('#amount').text(res.amount); //顯示的總金額
								$('#total').val(res.amount); //隱藏欄位的總金額
								
							},
							error: function(res){
								console.log(res);
							}
						
						});
		      		}
		      		//setTimeout(myFunc,5000);
			    	setTimeout(timer1,500);  
		      	} else{
			    	    $($(this).parent().next()).text('');
			    	  	$.ajax({
							url: '<%=request.getContextPath()%>/prodcart.do',
							type: "get",
							data: { 'action': 'changeCart', 'prod_qty': $this.val() , 'prod_id': '${prod_id}' },
							dataType: 'json',
							success: function(res){
								console.log("res=" + res);
								console.log(res.success);
								console.log(res.prod_stock);
								if (res.success==0){
						      		function timer2(){
										console.log("==========");
										console.log('目前庫存量為 '+res.prod_stock);
											$this.val(res.prod_stock);
											$this.parent().next().text('目前剩餘庫存量:'+res.prod_stock);
											$('#amount').text(res.amount);
											$('#total').val(res.amount);
						      		}
									
						      		//setTimeout(myFunc,5000);
							    	setTimeout(timer2,1000);   
								} else{
									$('#amount').text(res.amount); //顯示的總金額
									$('#total').val(res.amount); //隱藏欄位的總金額
								}
								
							},
							error: function(res){
								console.log(res);
							}
						
						});
		      		}
		    	  
		    });
	      
	      
	      </script>
	      
	      <script>
    
		  //剛開始進來顯示是否已追蹤
		    $.ajax({
		    	url: '<%=request.getContextPath()%>/prodtrack.do',
		    	type: "get",
		    	data: { 'action': 'checkFav', 'prod_id': '${prod_id}' },
		    	dataType: 'json',
		    	success: function(res){
		    		console.log(res);
		    		if (res=="1"){
	// 	    			$(".like-btn").attr("class", "is-active");
		    			$('#${prod_id}').toggleClass('is-active');
		    		}
		    	},
		    	error: function(res){
		    		console.log(res);
		    	}
		
		    });
		  
		 
	      </script>
	      
	      
		</c:forEach>
    </div>
    
    <div class="shopping-cart" style="height:auto">
    	<h3 style="text-align:right" id="show_total">結帳總金額:　　<i class="fas fa-coins"></i> <b id="amount" style="padding-right: 25px;">${amount}</b></h3>
	    <span id="no_prod_img" style="display:none; text-align:center"><img src="<%=request.getContextPath()%>/front-end/ord/icon_blank_cart.png"></span>
	    <span id="no_prod_des" style="display:none; text-align:center; padding-bottom: 50px;">您的購物車中沒有商品</span>
	    
	    <input type="hidden" name="amount" id="total" value="${amount}">
	    <input type="hidden" name="action" value="receiver">
	    <input type="submit" value="下一步" id="next" class="btn btn-lg" style="background-color: #96c03d;"></form>
    </div>

    <script type="text/javascript">
    
      var pattern = /^[1-9][0-9]?$/;
      $('.minus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());

	    		if(!pattern.test(value)){
	    			value = 1;
	    		}
	    		
	    		if (value > 2) {
	    			value = value - 1;
	    		} else {
	    			value = 1;
	    		}
	
		        $input.val(value);
		        $this.parent().next().text('');
		        $.ajax({
					url: '<%=request.getContextPath()%>/prodcart.do',
					type: "get",
					data: { 'action': 'changeCart', 'prod_qty': value , 'prod_id': $this.next().attr("class") },
					dataType: 'json',
					success: function(res){
						console.log(res);
						$('#amount').text(res.amount);
						$('#total').val(res.amount);
					},
					error: function(res){
						console.log(res.amount);
					}
					
				
				});
    	});

     	
    	$('.plus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());
    		
    		if(!pattern.test(value)){
    			value = 0;
    		}

    		if (value > 100) {
    			value = 100;
    		} else if(value < 1) {
    			value = 1;
    		} else {
	      		value = value + 1;
    		}

	    		$.ajax({
					url: '<%=request.getContextPath()%>/prodcart.do',
					type: "get",
					data: { 'action': 'changeCart', 'prod_qty': value , 'prod_id': $this.prev().attr("class") },
					dataType: 'json',
					success: function(res){
						console.log(res);
						console.log(res.success);
						console.log(res.prod_stock);
						if (res.success==0){
							console.log("==========");
							console.log('目前庫存量為 '+res.prod_stock);
							function timer4(){
								$input.val(res.prod_stock);
								$('#amount').text(res.amount); //顯示的總金額
								$('#total').val(res.amount); //隱藏欄位的總金額
								$input.parent().next().text('目前剩餘庫存量:'+res.prod_stock);
							}
							
							//setTimeout(myFunc,5000);
					    	setTimeout(timer4,500); 
							
						} else{
							$input.val(value);
							$('#amount').text(res.amount); //顯示的總金額
							$('#total').val(res.amount); //隱藏欄位的總金額
							
						}
					},
					error: function(res){
						console.log(res);
					}
				
				});
    		  
    	});

    	 
    	
      $('.like-btn').on('click', function() {
        $(this).toggleClass('is-active');
        console.log($(this).attr("class"));
        
//      透過ajax將更新內容儲存至redis資料庫
        if($(this).attr("class")=="like-btn"){
        	console.log("取消追蹤"+$(this).attr("id"));
        	$.ajax({
    			url: '<%=request.getContextPath()%>/prodtrack.do',
    			type: "get",
    			data: { 'action': 'cancelFav', 'prod_id': $(this).attr("id") },
    			dataType: 'json',
    			success: function(res){
    				console.log("success="+res);
    				console.log("22222");
    			},
    			error: function(res){
    				console.log("error="+res);
    			}
    		
    		});
        	
        } else{
        	console.log("加入追蹤"+$(this).attr("id"));
	        $.ajax({
				url: '<%=request.getContextPath()%>/prodtrack.do',
				type: "get",
				data: { 'action': 'addFav', 'prod_id': $(this).attr("id")},
				dataType: 'json',
				success: function(res){
					console.log("success="+res);
					console.log("11111");
				},
				error: function(res){
					console.log("error="+res);
				}
			
			});
        	
        }
      });
      
	   // 若使用者點擊移除按鈕，透過ajax操作redis資料庫，並將畫面中此筆資料移除
	   $('.delete-btn').on('click', function() {
	        console.log("購物車移除商品"+$(this).next().attr("id"));
		// 透過ajax將更新內容儲存至redis資料庫
	        $.ajax({
	    	url: '<%=request.getContextPath()%>/prodcart.do',
	    		type: "get",
	    		data: { 'action': 'remove', 'prod_id': $(this).next().attr("id")},
	    		dataType: 'json',
	    		success: function(res){
	    			console.log("success="+res);
	    			console.log("22222");
	    			$('#amount').text(res);
	    			$('#total').text(res);
	    			if(res==0){
	    				$('#show_total').css("display", "none");
	    				$('#no_prod_img').css("display", "");
	    				$('#no_prod_des').css("display", "");
	    				$('#next').css("background-color", "#D2B48C");
	    				$('#next').val("返回購物");
	    				console.log("$next=" + $('#next').val());
	    			}
	    		},
	    		error: function(res){
	    			console.log("error="+res);
	    		}
	    		
	    	});
	        $(this).parent().parent().remove();
	        	
	    });
	   
	   console.log("=====按下下一步=====");
       console.log("${amount}="+ '${amount}');
       console.log('$memBalance='+ '${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}');
       console.log('$memVO='+ '${memVO}');
       console.log("$('#amount').text()=" + $('#amount').text());
	   //按下一步時，除了filter檢查是否登入之外，再檢查愛心幣餘額是否足夠
	   $('#next').on('click', function() {
	        console.log("=====按下下一步=====");
	        console.log("${amount}"+ '${amount}');
	        
	        
			if($('#next').val()== "返回購物"){
				window.location.href="<%=request.getContextPath()%>/front-end/product/listAllProd.jsp";
				return false;
	   		}
	        
	        if ('${memVO}'!=""){ 
					console.log("@@@@@@@@@@");
					console.log($('#amount').text() > '${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}');
					console.log($('#amount').text() + '>' + '${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}');
					console.log($('#amount').text() - '${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}');
					console.log($('#amount').text() - '${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}' > 0 );
					console.log($('#amount').text()+"=====");
					console.log('${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}'+"=====");
				if ($('#amount').text() - '${memSvc.getOneMem(memVO.getMemb_id()).getMemb_balance()}' > 0){
					console.log("22222");
					swal("Oops.....", "愛心幣餘額不足...", "error").catch(swal.noop);
					return false;
				} 
			}
	        	
	    });
	   
	   
   
    </script>
    
    <!-- 神奇小按鈕 -->
	<script type="text/javascript">
				$(function(){
					$('#miracleBtn').click(function(){
						window.location.href = '<%=request.getContextPath()%>/front-end/donate/addMoneyDon.jsp';
					});
				});
	</script>
    


	
</body>
</html>