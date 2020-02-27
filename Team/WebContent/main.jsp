<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e93c5c56ced2492f904fe8cfaad20ab5"></script>
<title>...</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="js/main.js"></script>
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
		<div class="slide">
			<img src="images/5%EC%9B%94-%EB%82%B4%EB%A5%99%EC%97%AC%ED%96%89.png">
			<img src="images/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpg"> <img
				src="images/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20(1).jpg">
		</div>

		<div class="board">
			<div class="best">
				<p>베스트</p>
				<a href="#">더 보기</a>
				<ul>
					<li>1.게시글</li>
					<li>2.게시글</li>
					<li>3.게시글</li>
					<li>4.게시글</li>
					<li>5.게시글</li>
				</ul>
			</div>
			<div class="new">
				<p>최신</p>
				<a href="#">더 보기</a>
				<ul>
					<li>1.게시글</li>
					<li>2.게시글</li>
					<li>3.게시글</li>
					<li>4.게시글</li>
					<li>5.게시글</li>
				</ul>
			</div>
			<div class="special">
				<p>특별혜택</p>
				<a href="#">더 보기</a>
				<ul>
					<li>1.게시글</li>
					<li>2.게시글</li>
					<li>3.게시글</li>
					<li>4.게시글</li>
					<li>5.게시글</li>
				</ul>
			</div>
		</div>
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
			center : new kakao.maps.LatLng(37.493160, 126.722691), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치입니다 
		var position = new kakao.maps.LatLng(37.493160, 126.722691);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : position,
			clickable : true
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
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
		<div class="slide">
			<img src="images/5%EC%9B%94-%EB%82%B4%EB%A5%99%EC%97%AC%ED%96%89.png">
			<img src="images/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpg"> <img
				src="images/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20(1).jpg">
		</div>

		<div class="board">
			<div class="best">
				<p>베스트</p>
				<a href="#">더 보기</a>
				<ul>
					<li>1.게시글</li>
					<li>2.게시글</li>
					<li>3.게시글</li>
					<li>4.게시글</li>
					<li>5.게시글</li>
				</ul>
			</div>
			<div class="new">
				<p>최신</p>
				<a href="#">더 보기</a>
				<ul>
					<li>1.게시글</li>
					<li>2.게시글</li>
					<li>3.게시글</li>
					<li>4.게시글</li>
					<li>5.게시글</li>
				</ul>
			</div>
			<div class="special">
				<p>특별혜택</p>
				<a href="#">더 보기</a>
				<ul>
					<li>1.게시글</li>
					<li>2.게시글</li>
					<li>3.게시글</li>
					<li>4.게시글</li>
					<li>5.게시글</li>
				</ul>
			</div>
		</div>
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
			center : new kakao.maps.LatLng(37.493160, 126.722691), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치입니다 
		var position = new kakao.maps.LatLng(37.493160, 126.722691);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : position,
			clickable : true
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
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