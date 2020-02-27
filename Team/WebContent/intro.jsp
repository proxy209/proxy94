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

		<h3 class="title2">연혁</h3>
		<div class="intro2">
			<p>Miuccia inherited the company in 1978 by which time sales were
				up to U.S. $450,000. With Bertelli alongside her as business
				manager, Miuccia was allowed time to implement her creativity in the
				company's designs.[4] She would go on to incorporate her ideas into
				the house of Prada that would change it.[4] She released her first
				set of backpacks and totes in 1979. They were made out of a tough
				military spec black nylon that her grandfather had used as coverings
				for steamer trunks. Initial success was not instant, as they were
				hard to sell due to the lack of advertising and high prices, but the
				lines would go on to become her first commercial hit. Next, Miuccia
				and Bertelli sought out wholesale accounts for the bags in upscale
				department stores and boutiques worldwide. In 1983, Prada opened a
				second boutique in the centre of the Galleria Vittorio Emanuele in
				Milan's shopping heart, on the site of the previous historic "London
				House" emporium run by Felice Bellini from 1870 to the 1960s,
				reminiscent of the original shop, but with a sleek and modern
				contrast to it. The next big release was a nylon tote. That same
				year, the house of Prada began expansion across continental Europe
				and the United States by opening locations in prominent shopping
				districts within Florence, Paris, Madrid, and New York City. A shoe
				line was also released in 1984. In 1985 Miuccia released the
				"classic Prada handbag" that became an overnight sensation. Although
				practical and sturdy, its sleek lines and craftsmanship had a luxury
				that has become the Prada signature. In 1987 Miuccia and Bertelli
				married. Prada launched its women's ready-to-wear collection in
				1989, and the designs came to be known for their dropped waistlines
				and narrow belts. Prada's popularity increased when the fashion
				world took notice of its clean lines, opulent fabrics, and basic
				colors. The logo for the label was not as obvious a design element
				as those on bags from other prominent luxury brands such as Louis
				Vuitton. It tried to market its lack of prestigious appeal,
				including of its apparel, by projecting an image of "anti-status" or
				"inverse snobbery".</p>

			<p></p>
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

		<h3 class="title2">연혁</h3>
		<div class="intro2">
			<p>Miuccia inherited the company in 1978 by which time sales were
				up to U.S. $450,000. With Bertelli alongside her as business
				manager, Miuccia was allowed time to implement her creativity in the
				company's designs.[4] She would go on to incorporate her ideas into
				the house of Prada that would change it.[4] She released her first
				set of backpacks and totes in 1979. They were made out of a tough
				military spec black nylon that her grandfather had used as coverings
				for steamer trunks. Initial success was not instant, as they were
				hard to sell due to the lack of advertising and high prices, but the
				lines would go on to become her first commercial hit. Next, Miuccia
				and Bertelli sought out wholesale accounts for the bags in upscale
				department stores and boutiques worldwide. In 1983, Prada opened a
				second boutique in the centre of the Galleria Vittorio Emanuele in
				Milan's shopping heart, on the site of the previous historic "London
				House" emporium run by Felice Bellini from 1870 to the 1960s,
				reminiscent of the original shop, but with a sleek and modern
				contrast to it. The next big release was a nylon tote. That same
				year, the house of Prada began expansion across continental Europe
				and the United States by opening locations in prominent shopping
				districts within Florence, Paris, Madrid, and New York City. A shoe
				line was also released in 1984. In 1985 Miuccia released the
				"classic Prada handbag" that became an overnight sensation. Although
				practical and sturdy, its sleek lines and craftsmanship had a luxury
				that has become the Prada signature. In 1987 Miuccia and Bertelli
				married. Prada launched its women's ready-to-wear collection in
				1989, and the designs came to be known for their dropped waistlines
				and narrow belts. Prada's popularity increased when the fashion
				world took notice of its clean lines, opulent fabrics, and basic
				colors. The logo for the label was not as obvious a design element
				as those on bags from other prominent luxury brands such as Louis
				Vuitton. It tried to market its lack of prestigious appeal,
				including of its apparel, by projecting an image of "anti-status" or
				"inverse snobbery".</p>

			<p></p>
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