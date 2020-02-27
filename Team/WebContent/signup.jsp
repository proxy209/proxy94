<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e93c5c56ced2492f904fe8cfaad20ab5"></script>
<title>...</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/sign.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
	<%
	String error = (String) request.getAttribute("Error");

	if (error != null && error.equals("1")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if (error != null && error.equals("0")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된사항이 있습니다.')");
		 	script.println("history.back()");
			script.println("</script>");
		} else if (error != null && error.equals("-1")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
		 	script.println("history.back()");
			script.println("</script>");
		}

	%>
	<script>
$(function(){
	//비밀번호 확인
		$('#pw2').blur(function(){
		   if($('#pw').val() != $('#pw2').val()){
		    	if($('#pw2').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#pw2').val('');
		          $('#pw2').focus();
		       } 
		    }
		})  	   
	});
</script>
	<nav>
		<div class="navigation">
			<div class="logo">
				<a href="main.jsp"><img src="images/easy.png"></a>
			</div>
			<ul>
				<li><a href="intro.jsp">소개</a></li>
				<li><a href="tour.jsp">관광정보</a></li>
				<li><a href="board.jsp">여행일기</a></li>
				<li><a href="#">특별혜택</a></li>
				<li><a href="qna.jsp">문의</a></li>
			</ul>
			<div class="login">
				<a href="login.jsp">로그인</a>
			</div>
			<div class="join">
				<a href="signup.jsp">회원가입</a>
			</div>
		</div>
	</nav>
	<section>
		<h3 class="title1">회원가입</h3>
		<form method="post" action="sign.go">
			<table class="signup">
				<tr>
					<td>아이디</td>
					<td><input id="userID" type="text" name="userID"
						placeholder="아이디를 입력하세요." style="width: 300px; height: 30px;"></td>
					<td><div class="check_font" id="id_check"></div></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="pw" type="password" name="userPW"
						placeholder="비밀번호를 입력하세요." style="width: 300px; height: 30px;"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input id="pw2" type="password" name="userPW2"
						placeholder="비밀번호를 입력하세요." style="width: 300px; height: 30px;"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName"
						placeholder="이름을 입력하세요." style="width: 300px; height: 30px;"></td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td><input type="email" name="userEmail"
						placeholder="이메일을 입력하세요." style="width: 300px; height: 30px;"></td>
				</tr>
			</table>
			<div class="writeBtn">
				<button type="submit" value="회원가입">회원가입</button>
			</div>
		</form>
	</section>

	<footer>
		<div class="foot">
			<p>그린컴퓨터 아카데미</p>
			<P>공동대표 양효빈, 이내경, 최성혁, 최치호</P>
			<p>인천 부평구 부평대로 19-1 6층,9층, 10층</p>
		</div>
		<div id="map"></div>
	</footer>



	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.493160, 126.722691), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
// 마커를 표시할 위치입니다 
var position =  new kakao.maps.LatLng(37.493160, 126.722691);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: position,
  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
});

// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
// marker.setClickable(true);

// 마커를 지도에 표시합니다.
marker.setMap(map);

// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다

// 인포윈도우를 생성합니다
    

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
      // 마커 위에 인포윈도우를 표시합니다
      infowindow.open(map, marker);  
});
</script>

</body>
</html>