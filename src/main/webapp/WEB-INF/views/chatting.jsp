<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
	</style>
</head>

<script src="resources/sockjs.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

let ws = "";


	function wsOpen(){
		ws = new SockJS("/chatting");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		
		ws.onmessage = function(data) {
			var msg    	  = data.data;
			var scroll 	  = document.querySelector('#chating').scrollTop;
			var scrollChk = $('#chating')[0].scrollHeight;
			var _str      = "";
			
			
			scrollChk = scrollChk - 500;
			
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<p>" + msg + "</p>");
				if(scroll == scrollChk){
					$('#chating').stop().animate({scrollTop: $('#chating')[0].scrollHeight}, 1000);				
				} else {
					_str = ""
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			setTimeout(function (){
				ws.send(userName+"님이 접속하셨습니다.");
			}, 1000)
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chating').stop().animate({scrollTop: $('#chating')[0].scrollHeight}, 1000);
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		<div id="chating" class="chating" style="overflow-y: scroll; ">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>