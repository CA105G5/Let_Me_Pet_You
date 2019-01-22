<%@page import="com.mem.model.MemVO"%>
<%@page import="java.util.List"%>
<%@page import="com.prod.model.ProdService"%>
<%@page import="com.prod.model.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- //要串會員，動態取得會員編號 -->
<%
	String missing_case_id = (String) session.getAttribute("missing_case_id");
	String missing_name = (String) session.getAttribute("missing_name");
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	String session_id = session.getId();
	String memb_id = null;
	String memb_nick = null;
	if(memVO!=null){
		memb_id = memVO.getMemb_id();
		memb_nick = memVO.getMemb_nick();
	} else{
		memb_nick="visitor";
	}
%>

<jsp:useBean id="prodImgSvc" scope="page" class="com.prodimg.model.ProdImgService" />
<jsp:useBean id="rescueSvc" scope="page" class="com.rescue.model.RescueService" />
	
	
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>聊天室</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- w3 CSS tabs -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- w3 CSS tabs -->
	
	<!--聊天室css & script -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!--聊天室css & script -->
	
	<!--聊天室style -->
	<style>
	
		p {
			　 font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
				monospace;
		}
		
		div {
			font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
				monospace;
		}
		
		h3 {
			font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
				monospace;
		}
		
		* {
		  box-sizing: border-box;
		}
		
		body {
		  background-color: #edeff2;
		  font-family: "Calibri", "Roboto", sans-serif;
		}
		
		#preview {
		  position: absolute;
		  width: calc(100% - 20px);
		  max-width: 800px;
		  height: 150px;
		  border-radius: 10px;
		  background-color: #fff;
		  left: 50%;
		  top: 88%;
		  transform: translateX(-50%) translateY(-50%);
		  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
/* 		  background-color: #f8f8f8; */
		  overflow: hidden;
		}
		
		.chat_window {
		  position: absolute;
		  width: calc(100% - 20px);
		  max-width: 800px;
		  height: 600px;
		  border-radius: 10px;
		  background-color: #fff;
		  left: 50%;
		  top: 42%;
		  transform: translateX(-50%) translateY(-50%);
		  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
		  background-color: #f8f8f8;
		  overflow: hidden;
		}
		
		.top_menu {
		  background-color: #fff;
		  width: 100%;
		  padding: 20px 0 15px;
		  box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
		}
		.top_menu .buttons {
		  margin: 3px 0 0 20px;
		  position: absolute;
		}
		.top_menu .buttons .button {
		  width: 16px;
		  height: 16px;
		  border-radius: 50%;
		  display: inline-block;
		  margin-right: 10px;
		  position: relative;
		}
		.top_menu .buttons .button.close {
		  background-color: #f5886e;
		}
		.top_menu .buttons .button.minimize {
		  background-color: #fdbf68;
		}
		.top_menu .buttons .button.maximize {
		  background-color: #a3d063;
		}
		.top_menu .title {
		  text-align: center;
		  color: #bcbdc0;
		  font-size: 20px;
		}
		
		.messages {
		  position: relative;
		  list-style: none;
		  padding: 20px 10px 0 10px;
		  margin: 0;
		  height: 437px;
		  overflow: scroll;
		}
		.messages .message {
		  clear: both;
		  overflow: hidden;
		  margin-bottom: 20px;
		  transition: all 0.5s linear;
		  opacity: 0;
		}
		.messages .message.left .avatar {
		  background-color: #f5886e;
		  float: left;
		}
		
		.messages .message.left .time {
/* 		  padding-left: 80px; */
		  float: left;
		}
		
		.messages .message.left .text_wrapper {
		  background-color: #ffe6cb;
		  margin-left: 20px;
		}
		.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before {
		  right: 100%;
		  border-right-color: #ffe6cb;
		}
		.messages .message.left .text {
		  color: #c48843;
		}
		.messages .message.right .avatar {
		  background-color: #fdbf68;
		  float: right;
		}
		
		.messages .message.right .time {
/* 		  padding-right: 80px; */
		  float: right;
		}
		
		.messages .message.right .text_wrapper {
		  background-color: #c7eafc;
		  margin-right: 20px;
		  float: right;
		}
		.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before {
		  left: 100%;
		  border-left-color: #c7eafc;
		}
		.messages .message.right .text {
		  color: #45829b;
		}
		.messages .message.appeared {
		  opacity: 1;
		}
		.messages .message .avatar {
		  width: 60px;
		  height: 60px;
		  border-radius: 50%;
		  display: inline-block;
		}
		.messages .message .text_wrapper {
		  display: inline-block;
		  padding: 20px;
		  border-radius: 6px;
		  width: calc(100% - 85px);
		  min-width: 100px;
		  position: relative;
		}
		.messages .message .text_wrapper::after, .messages .message .text_wrapper:before {
		  top: 18px;
		  border: solid transparent;
		  content: " ";
		  height: 0;
		  width: 0;
		  position: absolute;
		  pointer-events: none;
		}
		.messages .message .text_wrapper::after {
		  border-width: 13px;
		  margin-top: 0px;
		}
		.messages .message .text_wrapper::before {
		  border-width: 15px;
		  margin-top: -2px;
		}
		.messages .message .text_wrapper .text {
		  font-size: 18px;
		  font-weight: 300;
		}
		
		.bottom_wrapper {
		  position: relative;
		  width: 100%;
		  background-color: #fff;
		  padding: 20px 20px;
		  position: absolute;
		  bottom: 0;
		}
		.bottom_wrapper .message_input_wrapper {
		  display: inline-block;
		  height: 50px;
		  border-radius: 25px;
		  border: 1px solid #bcbdc0;
		  width: calc(100% - 200px);
		  position: relative;
		  padding: 0 20px;
		}
		.bottom_wrapper .message_input_wrapper .message_input {
		  border: none;
		  height: 100%;
		  box-sizing: border-box;
		  width: calc(100% - 40px);
		  position: absolute;
		  outline-width: 0;
		  color: gray;
		}
		.bottom_wrapper .send_message {
		  width: 140px;
		  height: 50px;
		  display: inline-block;
		  border-radius: 50px;
		  background-color: #a3d063;
		  border: 2px solid #a3d063;
		  color: #fff;
		  cursor: pointer;
		  transition: all 0.2s linear;
		  text-align: center;
		  float: right;
		}
		
		.bottom_wrapper .file_upload {
		  width: 50px;
		  height: 50px;
		  display: block;
		  border-radius: 50px;
		  background-color: #f5886e;
		  border: 2px solid #f5886e;
		  color: #fff;
		  cursor: pointer;
		  transition: all 0.2s linear;
		  text-align: center;
		  float: right;
		}
		.bottom_wrapper .send_message:hover {
		  color: #a3d063;
		  background-color: #fff;
		}
		.bottom_wrapper .file_upload:hover {
		  color: #f5886e;
		  background-color: #fff;
		}
		.bottom_wrapper .send_message .text {
		  font-size: 18px;
		  font-weight: 300;
		  display: inline-block;
		  line-height: 48px;
		}
		
		.message_template {
		  display: none;
		}
		
		.image_upload > input{
		    display: none;
		}
	</style>
	<!--聊天室style -->
	

</head>
<body onload="connect();" onunload="disconnect();">
<!--         <h1> Chat Room </h1> -->
<!-- 	    <h3 id="statusOutput" class="statusOutput"></h3> -->
	    
<!--聊天室模板 -->
	    <div class="chat_window">
	    	<div class="top_menu">
	    		<div class="buttons">
	    			<div class="button close">
	    			</div>
	    			<div class="button minimize">
	    			</div>
	    			<div class="button maximize">
	    			</div>
	    		</div>
	    		<div class="title">聊天室-失蹤案例　${missing_name}</div>
	    	</div>
	    	<ul class="messages">
	    		<div class="">
<%-- 	    		<span style="color:	#00CED1"><b><%=memb_nick==null? "visitor":memb_nick%></b></span>　成功連線至聊天室 --%>
<!-- 	    		<span style="color:	#00CED1" id="online_name"><b></b></span>　成功連線至聊天室 -->
	    		</div>
	    		<br>
	    	</ul>
	    	<div class="bottom_wrapper clearfix">
	    		<div class="message_input_wrapper">
	    			<input class="message_input" placeholder="Type your message here..." />
	    		</div>
<!-- 	    		<button class="file_upload"> -->
<!-- 	    			<i class="glyphicon glyphicon-paperclip"></i> -->
<!-- 	    		</button> -->
	    		
	    		<div class="send_message">
	    			<div class="icon">
	    			</div>
	    			<div class="text">Send</div>
	    		</div>
	    		<span id="image_upload">
					<label for="file-input">
						<span class="file_upload">
				    		<i class="glyphicon glyphicon-paperclip" style="padding-top:15px"></i>
				    	</span>
					</label>
					
					<input id="file-input" type="file" style="display:none" multiple>
				</span>
	    	</div>
	    </div>
	    
	    <div id="preview" style="display:none">
	    
		</div>
		<br>
		<br>
	    
	    <div class="message_template">
	    	<li class="message">
	    		<div class="avatar" >
	    		</div>
	    		<div class="text_wrapper">
	    			<div class="text"></div>
	    		</div>
	    		<div class="time" style="color:gray; font-size:12px">
	    		</div>
	    	</li>
	    </div>
	    <div class="online">
	    	<div class="">
	    		<b><span style="color:	#00CED1;" id="online_name"></span></b>　成功連線至聊天室　
	    		<span id="online_time" style="color:gray; font-size:12px"></span>
	    	</div>
	    	<br>
	    </div>
	    <div class="offline">
	    	<div class="">
	    		<b><span style="color:	#00CED1;" id="offline_name"></span></b>　已離線　
	    		<span id="offline_time" style="color:gray; font-size:12px"></span>
	    	</div>
	    	<br>
	    </div>
<!--聊天室模板 -->	    
	    
	   
<!-- 推播Echo Server -->
<script>
    
</script>
<!-- 推播Echo Server -->


<!-- 聊天室js   -->
<script>

(function () {
//     var Message;
//     Message = function (arg) {
//         this.text = arg.text, this.message_side = arg.message_side;
//         this.draw = function (_this) {
//             return function () {
//                 var $message;
//                 $message = $($('.message_template').clone().html());
//                 $message.addClass(_this.message_side).find('.text').html(_this.text);
//                 $('.messages').append($message);
//                 return setTimeout(function () {
//                     return $message.addClass('appeared');
//                 }, 0);
//             };
//         }(this);
//         return this;
//     };
    $(function () {
        var getMessageText, message_side, sendMessage;
        getMessageText = function () {
            var $message_input;
            $message_input = $('.message_input');
            
            var $pic_input;
            $pic_input = $('#preview');
            return "<br>"+$message_input.val()+$pic_input.html();
        };
        sendMessage = function (text) {
            var $messages, message;
            if (text.trim() === '') {
                return;
            }
            console.log("text==="+text);
            $('.message_input').val('');
            $('#preview').html('');
            $("#preview").css("display","none");
            $messages = $('.messages');
            
            
//             推播
    	    var jsonObj = {"userName" : "<%=memb_nick%>", "message" : text, "memb_id": "<%=memb_id%>", "session_id":"<%=session_id%>", "missing_case_id":'${missing_case_id}'};
    	    webSocket.send(JSON.stringify(jsonObj));
    	    $('.message_input').focus();
//             推播
    	}
        
        
        $('.send_message').click(function (e) {
            return sendMessage(getMessageText());
        });
        
        
        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
                return sendMessage(getMessageText());
            }
        });
    });
}.call(this));








	var MyPoint = "/ChatEchoServer/"+"<%=missing_case_id%>"+"/"+"<%=memb_nick%>";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "wss://" + window.location.host + webCtx + MyPoint;
	
// 	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	console.log("endPointURL==="+endPointURL);
	
	function connect() {
		console.log("endPointURL==="+endPointURL);
		
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
// 			updateStatus("成功連線至聊天室");
		};
	
		webSocket.onmessage = function(event) {
			console.log("chat.jsp===onmessage===");
// 			var messagesArea = document.getElementById("messagesArea");
	        var jsonObj = JSON.parse(event.data);
	        var $online_name = jsonObj.online;
	        var $offline_name = jsonObj.offline;
	        var $missing_case_id = jsonObj.missing_case_id;
	        
			console.log("jsonObj==="+jsonObj);
			console.log("online_name==="+$online_name);
			console.log("offline_name==="+$offline_name);
			console.log("missing_case_id==="+$missing_case_id);
			
			if ($missing_case_id=='${missing_case_id}'){
			    console.log("失蹤案例編號為"+$missing_case_id);
			    if (jsonObj.online==null && jsonObj.offline==null){
			    	console.log("這是在做訊息推播");
			        if (jsonObj.session_id=="<%=session_id%>"){
				        var $message_text = jsonObj.userName + ": " + jsonObj.message + "\r\n";
				        var $message;
			            $message = $($('.message_template').clone().html());
			            $message.addClass("right").find('.text').html($message_text);
			            var $myDate = new Date().toLocaleString();        //获取日期与时间
				        $message.find('.time').html($myDate);
			            if (<%=memb_id==null%>){
				        	$message.find('.avatar').html("<img src='visitor2.png' style='width: 60px; height: 60px; border-radius: 50%;'>");
			            } else{
				            $message.find('.avatar').html("<img src='<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=<%=memb_id%>' style=' width: 60px; height: 60px; border-radius: 50%;'>");
			            }
			            $('.messages').append($message);
			            $message.addClass('appeared');
				        
				    } else{
				    	var $message_text = jsonObj.userName + ": " + jsonObj.message + "\r\n";
					    var $memb_id = jsonObj.memb_id;
					    console.log("memb_id==="+$memb_id);
					    var $message;
				        $message = $($('.message_template').clone().html());
				        $message.addClass("left").find('.text').html($message_text);
				        var $myDate = new Date().toLocaleString();        //获取日期与时间
				        $message.find('.time').html($myDate);
				        if ($memb_id=="null"){
					    	$message.find('.avatar').html("<img src='visitor2.png' style='width: 60px; height: 60px; border-radius: 50%;'>");
				        } else{
					    	$message.find('.avatar').html("<img src='<%=request.getContextPath()%>/front-end/members/memImg.do?memb_id=" + $memb_id + "' style=' width: 60px; height: 60px; border-radius: 50%;'>");
				        }
				        $('.messages').append($message);
				        $message.addClass('appeared');
					}
			        
					$('.messages').animate({ scrollTop: $('.messages').prop('scrollHeight') }, 300);
				} else if(jsonObj.online!=null){
					console.log("這是在做上線推播");
					var $online;
					var $myDate = new Date().toLocaleString();        //获取日期与时间
			        $online = $($('.online').clone().html());
			        $online.find('#online_name').html($online_name);
			        $online.find('#online_time').html($myDate);
			        $('.messages').append($online);
			        
			        $('.messages').animate({ scrollTop: $('.messages').prop('scrollHeight') }, 300);
					
				} else if(jsonObj.offline!=null) {
					console.log("這是在做離線推播");
					var $offline;
					var $myDate = new Date().toLocaleString();        //获取日期与时间
			        $offline = $($('.offline').clone().html());
			        $offline.find('#offline_name').html($offline_name);
			        $offline.find('#offline_time').html($myDate);
			        $('.messages').append($offline);
			        
			        $('.messages').animate({ scrollTop: $('.messages').prop('scrollHeight') }, 300);
				}
			}
// 	        messagesArea.scrollTop = messagesArea.scrollHeight;
	        
	        
		};
	
		webSocket.onclose = function(event) {
// 			updateStatus("已從聊天室離線");
		};
	}
	
	
	
	function disconnect () {
		webSocket.close();
	}
	
	
// 	function updateStatus(newStatus) {
// 		statusOutput.innerHTML = newStatus;
// 	}

	
	//預覽照片
	var i;
	var files = $("#form :file");
	$("#file-input").change(function() {
		$("#preview").html("");
		console.log("this="+this);
		console.log("=========="+"#preview");
		readURL(this);
	});
	
	function readURL(input) {
		if (input.files && input.files.length>= 0) {
			$("#preview").css("display","none");
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(input.files[i]);
				reader.onload = function(e) {
				var img = $("<img height='120' style='padding-left:30px; padding-top:10px'>").attr('src', e.target.result);
					console.log("img==="+img);
					$("#preview").append(img);
				}
				$("#preview").css("display","");
			}
		}
		
	}
	//預覽照片
	
	
	
// 	預覽照片
// 	$('#uploadfile').bind('change', function(e){
// 	    var data = e.originalEvent.target.files[0];
// 	    readThenSendFile(data);      
// 	});

// 	function readThenSendFile(data){

// 	    var reader = new FileReader();
// 	    reader.onload = function(evt){
// 	        var msg ={};
// 	        msg.username = username;
// 	        msg.file = evt.target.result;
// 	        msg.fileName = data.name;
// 	        socket.emit('base64 file', msg);
// 	    };
// 	    reader.readAsDataURL(data);
// 	}
// 	預覽照片



</script>
<!-- 聊天室js   -->


	    
	    
</body>
</html>