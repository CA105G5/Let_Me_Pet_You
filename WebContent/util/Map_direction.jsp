<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.rescue.model.*"%>
<%@ page import="com.prod.controller.*"%>
<%@ page import="util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>


<%
	RescueVO rescueVO  = (RescueVO) request.getAttribute("rescueVO");
	MemService memSvc = new MemService();
	MemVO memVO = memSvc.getOneMem("M000000001");
	session.setAttribute("memVO",memVO);
	
	
// 	String liveId = ListBroadcasts.getLiveId();
// 	System.out.println("liveId=="+liveId);
%>

<%
	ListBroadcasts.main(new String[] {});
	String liveId = ListBroadcasts.getLiveId();
	System.out.println("liveId==="+liveId);
// 	System.out.println("liveId=" + liveId);
// 	String title = ListBroadcasts.getTitle();
	
// 	MemVO account = (MemVO) request.getSession().getAttribute("memVO_login");
// 	String memId = account.getMemId();
// 	MemService memSvc = new MemService();
// 	MemVO memVO = memSvc.getOneMem(memId);
// 	pageContext.setAttribute("memVO", memVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>救援直播</title>


<style type="text/css">
p {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

div {
	font-family: Microsoft JhengHei, serif, sans-serif, cursive, fantasy,
		monospace;
}

body {
  margin: 0;
}

#map {
  height: 430px;
  position: relative;
  width: 1000px;
}

.maps-frame {
  height: 430px;
  width: 1000px;
}

.kd-tabbed-vert.header-links .kd-tabbutton a {
  color: #757575;
  display: inline-block;
  height: 100%;
  padding: 0 24px;
  width: 1000px;
}

.kd-tabbed-vert.header-links .kd-tabbutton {
  padding: 0;
}

.kd-tabbed-vert.header-links .kd-tabbutton.selected a {
  color: #03a9f4;
}

.kd-tabbed-vert.header-links .kd-tabbutton a:focus {
  text-decoration: none;
}

p.top-desc {
  padding: 1em 1em .1em 1em;
}

p.bottom-desc {
  padding: 0em 1em 1em 1em;
}

</style>
</head>
<body>


<body>
  
	<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    <div id="player"></div>
    
    <br>
    <iframe width="800" height="600" src="https://www.youtube.com/embed/live_stream?channel=dHoStYS-thLylffiv1D74wYL" frameborder="0" allowfullscreen></iframe>


<script>

<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->

  // 2. This code loads the IFrame Player API code asynchronously.
  var tag = document.createElement('script');

  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  // 3. This function creates an <iframe> (and YouTube player)
  //    after the API code downloads.
  var player;
  function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
      height: '600',
      width: '800',
      videoId: '<%=liveId%>',
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
  }

  // 4. The API will call this function when the video player is ready.
  function onPlayerReady(event) {
    event.target.playVideo();
  }

  // 5. The API calls this function when the player's state changes.
  //    The function indicates that when playing a video (state=1),
  //    the player should play for six seconds and then stop.
  var done = false;
  function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
//       setTimeout(stopVideo, 6000);
      done = true;
    }
  }
  function stopVideo() {
    player.stopVideo();
  }
// 以上為直播畫面設定 



</script>




</body>
</html>