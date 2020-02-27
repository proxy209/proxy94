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
<link rel="stylesheet" href="css/qna.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

</head>
<body>
	<%
		String userID = null;
		String error = (String) request.getAttribute("Error");
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		if (userID == null) {
	%>
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
		<h3 class="title1">찾아오는 길</h3>
		<div class="main">
			<div id="map1"></div>
			<h2>인천 부평구 부평대로 19-1 6층,9층, 10층</h2>
		</div>

		<form class="info">
			<ul class="intro">
				<li>오시는길</li>
				<li>영업시간</li>
				<li>사업자 정보</li>
			</ul>
			<div class="cantain">
				<ul class="content">
					<li>지하철 이용시 : 부평역 19번 출구, 25번 출구</li>
					<li>버스 이용시 : 일반(15, 59, 111, 121, 126번) 급행 1009번</li>
					<li>자차 이용시 : 인천 부평구 부평대로 19-1 6층,9층, 10층</li>
					<li>주차정보 : 건물 뒷편 운영(유료)</li>
				</ul>
				<ul class="content2">
					<li>매일 : 09:00 ~ 18:00</li>
					<li>방문 전 연락 부탁드립니다 ^^</li>
				</ul>
				<ul class="content">
					<li>상호명 : 그린컴퓨터 아카데미</li>
					<li>대표자 : 양 효 빈</li>
					<li>사업자번호 : 10155789995</li>
					<li>이메일 : greencom@gamil.com</li>
				</ul>
			</div>
		</form>
		<h3 class="title2">문의사항</h3>
		<form class="qna" method="post" action="mail.go">
			<ul>
				<li><input type="text" name="name" placeholder="이름을 적어주세요."
					style="width: 500px; height: 30px;"></li>
				<li><input type="email" name="email" placeholder="메일주소를 적어주세요."
					style="width: 500px; height: 30px;"></li>
				<li><input type="text" name="subject" placeholder="제목을 적어주세요."
					style="width: 500px; height: 30px;"></li>
				<li><textarea type="text" name="message"
						placeholder="내용을 적어주세요." style="width: 500px; height: 300px;"></textarea></li>
				<input type="hidden" name="to" value="3poom@naver.com">
				<input type="hidden" name="from" value="3poom@naver.com">
				<li><input class="send" type="submit" value="보내기"></li>
			</ul>
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

	<script>
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.493160, 126.722691), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
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
	<%
		} else {
	%>
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
				<p><%=userID%>님 환영합니다.
				</p>
			</div>
			<div class="join">
				<form class="logoutForm" method="post" action="logOut.go">
					<button class="logOutbtn" type="submit" value="LOGOUT">로그아웃</button>
				</form>
			</div>
		</div>
	</nav>
	<section>
		<h3 class="title1">찾아오는 길</h3>
		<div class="main">
			<div id="map1"></div>
			<h2>인천 부평구 부평대로 19-1 6층,9층, 10층</h2>
		</div>

		<form class="info">
			<ul class="intro">
				<li>오시는길</li>
				<li>영업시간</li>
				<li>사업자 정보</li>
			</ul>
			<div class="cantain">
				<ul class="content">
					<li>지하철 이용시 : 부평역 19번 출구, 25번 출구</li>
					<li>버스 이용시 : 일반(15, 59, 111, 121, 126번) 급행 1009번</li>
					<li>자차 이용시 : 인천 부평구 부평대로 19-1 6층,9층, 10층</li>
					<li>주차정보 : 건물 뒷편 운영(유료)</li>
				</ul>
				<ul class="content2">
					<li>매일 : 09:00 ~ 18:00</li>
					<li>방문 전 연락 부탁드립니다 ^^</li>
				</ul>
				<ul class="content">
					<li>상호명 : 그린컴퓨터 아카데미</li>
					<li>대표자 : 양 효 빈</li>
					<li>사업자번호 : 10155789995</li>
					<li>이메일 : greencom@gamil.com</li>
				</ul>
			</div>
		</form>
		<h3 class="title2">문의사항</h3>
		<form class="qna" method="post">
			<ul>
				<li><input type="text" name="name" placeholder="Your Name"
					style="width: 500px; height: 30px;"></li>
				<li><input type="email" name="email" placeholder="Your Email"
					style="width: 500px; height: 30px;"></li>
				<li><input type="text" name="subject" placeholder="Subject"
					style="width: 500px; height: 30px;"></li>
				<li><textarea type="text" name="message" placeholder="Message"
						style="width: 500px; height: 300px;"></textarea></li>
				<input type="hidden" name="to" value="3poom@naver.com">
				<input type="hidden" name="from" value="3poom@naver.com">
				<li><input class="send" type="submit" value="보내기"></li>
			</ul>
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

	<script>
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.493160, 126.722691), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
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
	<%		
		}
    %>
</body>
</html>