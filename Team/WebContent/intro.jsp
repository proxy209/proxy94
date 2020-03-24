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
<link rel="stylesheet" href="css/intro.css">
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
				<li><a href="festival.jsp">축제</a></li>
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
		<h3 class="title1">회사 소개</h3>
		<div class="intro">
			<table>
				<tr>
					<td style="font-weight: bold;">회사명</td>
					<td>(주)ㅇㅇㅇ</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">URL</td>
					<td>http://127.0.0.1:56295/intro.html</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">회사주소</td>
					<td>인천 부평구 부평대로 19-1 6층,9층, 10층</td>
				</tr>
			</table>

			<table>
				<tr>
					<td style="font-weight: bold;">공동대표</td>
					<td>양효빈, 이내경, 최성혁, 최치호</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">창립일</td>
					<td>2020년 ~</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">대표전화</td>
					<td>010-1234-5678</td>
				</tr>
			</table>
		</div>
		<div class="body">
			<h1>인사글</h1>
			<br>
			<div class="history">
				<h3>설립 계기</h3>
				Lorem ipsum dolor sit, amet consectetur adipisicing elit. Enim
				numquam voluptates, possimus corporis labore commodi vero laborum
				repellat, quisquam odio quidem pariatur soluta praesentium
				necessitatibus asperiores impedit, et nemo atque!
			</div>
			<div class="contents">
				<div class="mission">
					<h3>희망 목표</h3>
					Lorem ipsum dolor sit amet consectetur, adipisicing elit. A vel
					tempora, in tenetur possimus quo sunt aut quibusdam dignissimos
					pariatur temporibus vero libero, excepturi iusto tempore corrupti
					dolor perspiciatis commodi.
				</div>
				<div class="vision">
					<h3>사회적 목표</h3>
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo sed
					odio libero quisquam quidem. Tempore, vero! Tenetur provident
					dolores ad nisi ea ut, eaque dolor at? Animi ipsum illum labore.
				</div>
				<br>
				<!-- 사회적 추구 -->
				<div class="value">
					<h3>사회적 가치의 추구</h3>
					<ul>
						<li><strong>여행의 정의</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
						<li><strong>여행의 목표</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
						<li><strong>모험정신</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
						<li><strong>도전정신</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
					</ul>
				</div>
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
				<li><a href="festival.jsp">축제</a></li>
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
		<h3 class="title1">회사 소개</h3>
		<div class="intro">
			<table>
				<tr>
					<td style="font-weight: bold;">회사명</td>
					<td>(주)ㅇㅇㅇ</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">URL</td>
					<td>http://127.0.0.1:56295/intro.html</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">회사주소</td>
					<td>인천 부평구 부평대로 19-1 6층,9층, 10층</td>
				</tr>
			</table>

			<table>
				<tr>
					<td style="font-weight: bold;">공동대표</td>
					<td>양효빈, 이내경, 최성혁, 최치호</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">창립일</td>
					<td>2020년 ~</td>
				</tr>
				<tr>
					<td style="font-weight: bold;">대표전화</td>
					<td>010-1234-5678</td>
				</tr>
			</table>
		</div>
		<div class="body">
			<h1>인사글</h1>
			<br>
			<div class="history">
				<h3>설립 계기</h3>
				Lorem ipsum dolor sit, amet consectetur adipisicing elit. Enim
				numquam voluptates, possimus corporis labore commodi vero laborum
				repellat, quisquam odio quidem pariatur soluta praesentium
				necessitatibus asperiores impedit, et nemo atque!
			</div>
			<div class="contents">
				<div class="mission">
					<h3>희망 목표</h3>
					Lorem ipsum dolor sit amet consectetur, adipisicing elit. A vel
					tempora, in tenetur possimus quo sunt aut quibusdam dignissimos
					pariatur temporibus vero libero, excepturi iusto tempore corrupti
					dolor perspiciatis commodi.
				</div>
				<div class="vision">
					<h3>사회적 목표</h3>
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo sed
					odio libero quisquam quidem. Tempore, vero! Tenetur provident
					dolores ad nisi ea ut, eaque dolor at? Animi ipsum illum labore.
				</div>
				<br>
				<!-- 사회적 추구 -->
				<div class="value">
					<h3>사회적 가치의 추구</h3>
					<ul>
						<li><strong>여행의 정의</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
						<li><strong>여행의 목표</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
						<li><strong>모험정신</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
						<li><strong>도전정신</strong>
							<ul>
								<li>Lorem ipsum dolor sit amet consectetur, adipisicing
									elit. Soluta totam inventore optio labore enim aliquam saepe
									animi, rerum eligendi tenetur ipsam earum temporibus. Totam
									eveniet nam consequuntur. Officia, quis veritatis.</li>
							</ul></li>
					</ul>
				</div>
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