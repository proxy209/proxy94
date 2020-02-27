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
<title>...</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script
	src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<link rel="stylesheet" href="css/tour.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e93c5c56ced2492f904fe8cfaad20ab5"></script>
<style>
.area {
	position: absolute;
	background: #fff;
	border: 1px solid #888;
	border-radius: 3px;
	font-size: 12px;
	top: -5px;
	left: 15px;
	padding: 2px;
}

.info {
	font-size: 12px;
	padding: 5px;
}

.info .title {
	font-weight: bold;
}
</style>
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
		<div id="map"></div>
		<div class="grid-gal clearfix">
			<div class="item suncheon">
				<h3>순천</h3>
				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C.jpg">
					<div class="sForm">
						<h4>순천만국가정원</h4>
						<p>
							<br>순천만국가정원으로 오십시오. 순천은 산, 바다, 호수가 어우러져 ‘소강남’으로 불릴 정도로 천혜의
							자연환경을 갖춘 곳입니다. <a href="http://garden.sc.go.kr/?r=home"><br>
								<br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C2.jpg">
					<div class="sForm">
						<h4>낙안읍성</h4>
						<p>
							<br>순천 낙안읍성은 조선시대 대표적인 지방계획도시로 대한민국 3대 읍성 중 하나로 사적 제302호로
							지정되어 있으며 연간 120만명의 관광객이 방문하는 주요 관광지로 현재 세계문화유산 잠정목록 등재 및
							CNN선정대한민국 대표 관광지 16위로 선정되었습니다. <a
								href="http://nagan.suncheon.go.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C3.jpg">
					<div class="sForm">
						<h4>선암사</h4>
						<p>
							<br>《선암사사적기(仙巖寺寺蹟記)》에 따르면 542년(진흥왕 3) 아도(阿道)가 비로암(毘盧庵)으로
							창건하였다고도 하고, 875년(헌강왕 5) 도선국사(道詵國師)가 창건하고 신선이 내린 바위라 하여 선암사라고도 한다.
							주요문화재로는 보물 제395호인 삼층석탑 2기가 있으며, 대웅전은 전라남도유형문화재 제41호로 지정되어 있다. <a
								href="http://www.seonamsa.net/"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C4.jpg">
					<div class="sForm">
						<h4>죽도봉공원</h4>
						<p>
							<br>죽도봉이라는 지명은 산죽(山竹)과 동백숲이 울창하고 봉우리 모양이 마치 바다에 떠 있는 섬과 같다는
							데서 유래하였다. 순천시가 1975년부터 공원 조성 작업을 시작하여, 1981년 김계선의 성금을 받아 전망대인
							강남정을 세웠다. 봄에 피는 벚꽃이 장관이며, 죽도봉(101.8m) 정상에 오르면 순천시내가 한눈에 들어온다. <a
								href="#"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>
			</div>

			<div class="item seoul">
				<h3>서울</h3>
				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B8.jpg">
					<div class="sForm">
						<h4>전쟁기념관</h4>
						<p>
							<br>호국 자료의 수집·보존·전시, 전쟁의 교훈과 호국정신 배양, 선열들의 호국 위훈 추모를 목적으로
							1990년 9월 착공해 1993년 12월 완공하고, 1994년 6월 10일 개관한 기념관이다. 연건평 2만 5천 평에
							지하 2층, 지상 4층 규모이며, 호국추모실·전쟁역사실·한국전쟁실·해외파병실·국군발전실·대형장비실 등 6개 전시실로
							구분되어 있다. <a href="http://www.warmemo.or.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B82.jpg">
					<div class="sForm">
						<h4>경복궁</h4>
						<p>
							<br>서울은 외사산(外四山)인 북한산(북) 관악산(남) 아차산(동) 덕양산(서)이 넓게 감싸고, 내사산으로
							주산(主山)인 북쪽의 백악(白岳) 안산(案山)인 남쪽의 목멱(木覓, 남산) 동쪽의 타락(酡酪, 낙산) 서쪽의
							인왕(仁王)이 감싸안은 곳, 그 너른 품의 넉넉한 평지에 자리잡고 있다. 조선 왕조의 법궁(法宮)인 경복궁(景福宮)은
							이곳, 서울의 중심인 백악산 남쪽에서 서쪽으로 조금 치우친 곳에 있다. <a
								href="http://www.royalpalace.go.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B83.jpg">
					<div class="sForm">
						<h4>동대문(흥인지문)</h4>
						<p>
							<br>서울 도성에 딸린 8문 중의 하나로서 서울 도성 정동(正東)쪽에 있으며 원래의 이름은
							흥인지문(興仁之門)이다. 하지만 일반적으로 동대문이라고 부른다. 1396년(태조 5)에 건립되고 1453년(단종
							1)에 중수되었으며, 1869년(고종 6)에 이르러 이를 전적으로 개축하여 현재의 모습을 갖추었다. <a
								href="#"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B84.jpg">
					<div class="sForm">
						<h4>북촌한옥마을</h4>
						<p>
							<br>북촌 한옥마을은 서울의 대표적인 한옥마을로, 창덕궁과 경복궁사이에 위치하여 조선시대 고위관리나
							왕족들이 살았던 한양의 고급주거지이다. 옛날 으리으리했던 집들을 기대하고 간다면 실망할 수도 있겠다. 일제 때 이
							지역의 땅들이 분할되면서 큰 집들이 작게 나뉘게 되는데, 그 과정에서 실제 주거를 목적으로 새로 집들을 지으면서
							서로서로 지붕을 맞대는, 작지만 생활하기에 효율적인 집들이 만들어졌다. <a
								href="http://hanok.seoul.go.kr/"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>
			</div>

			<div class="item incheon">
				<h3>인천</h3>
				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C.jpg">
					<div class="sForm">
						<h4>순천만국가정원</h4>
						<p>
							<br>순천만국가정원으로 오십시오. 순천은 산, 바다, 호수가 어우러져 ‘소강남’으로 불릴 정도로 천혜의
							자연환경을 갖춘 곳입니다. <a href="http://garden.sc.go.kr/?r=home"><br>
								<br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C2.jpg">
					<div class="sForm">
						<h4>낙안읍성</h4>
						<p>
							<br>순천 낙안읍성은 조선시대 대표적인 지방계획도시로 대한민국 3대 읍성 중 하나로 사적 제302호로
							지정되어 있으며 연간 120만명의 관광객이 방문하는 주요 관광지로 현재 세계문화유산 잠정목록 등재 및
							CNN선정대한민국 대표 관광지 16위로 선정되었습니다. <a
								href="http://nagan.suncheon.go.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C3.jpg">
					<div class="sForm">
						<h4>선암사</h4>
						<p>
							<br>《선암사사적기(仙巖寺寺蹟記)》에 따르면 542년(진흥왕 3) 아도(阿道)가 비로암(毘盧庵)으로
							창건하였다고도 하고, 875년(헌강왕 5) 도선국사(道詵國師)가 창건하고 신선이 내린 바위라 하여 선암사라고도 한다.
							주요문화재로는 보물 제395호인 삼층석탑 2기가 있으며, 대웅전은 전라남도유형문화재 제41호로 지정되어 있다. <a
								href="http://www.seonamsa.net/"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C4.jpg">
					<div class="sForm">
						<h4>죽도봉공원</h4>
						<p>
							<br>죽도봉이라는 지명은 산죽(山竹)과 동백숲이 울창하고 봉우리 모양이 마치 바다에 떠 있는 섬과 같다는
							데서 유래하였다. 순천시가 1975년부터 공원 조성 작업을 시작하여, 1981년 김계선의 성금을 받아 전망대인
							강남정을 세웠다. 봄에 피는 벚꽃이 장관이며, 죽도봉(101.8m) 정상에 오르면 순천시내가 한눈에 들어온다. <a
								href="#"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</section>

	<footer>
		<div class="foot">
			<p>그린컴퓨터 아카데미</p>
			<P>공동대표 양효빈, 이내경, 최성혁, 최치호</P>
			<p>인천 부평구 부평대로 19-1 6층,9층, 10층</p>
		</div>
		<div id="map1"></div>
	</footer>
	<script>
		var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
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
	<script>
		// 지도에 폴리곤으로 표시할 영역데이터 배열입니다 
		var areas = [
				{
					name : '서울',
					path : [ new kakao.maps.LatLng(37.640563, 126.912320),
							new kakao.maps.LatLng(37.648937, 127.092891),
							new kakao.maps.LatLng(37.559745, 127.175621),
							new kakao.maps.LatLng(37.454407, 127.091664),
							new kakao.maps.LatLng(37.485429, 126.831280),
							new kakao.maps.LatLng(37.621522, 126.904882) ]

				},
				{
					name : '순천',
					path : [ new kakao.maps.LatLng(35.184139, 127.412220),
							new kakao.maps.LatLng(35.130343, 127.207496),
							new kakao.maps.LatLng(34.904243, 127.226319),
							new kakao.maps.LatLng(34.840618, 127.410479),
							new kakao.maps.LatLng(34.842347, 127.481757),
							new kakao.maps.LatLng(34.885201, 127.570285) ]
				},
				{
					name : '인천',
					path : [ new kakao.maps.LatLng(37.637862, 126.655597),
							new kakao.maps.LatLng(37.823754, 126.431962),
							new kakao.maps.LatLng(37.678816, 126.163779),
							new kakao.maps.LatLng(37.367642, 126.408405),
							new kakao.maps.LatLng(37.392842, 126.694834),
							new kakao.maps.LatLng(37.585020, 126.781331) ]
				} ];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
				{}), infowindow = new kakao.maps.InfoWindow({
			removable : true
		});

		// 지도에 영역데이터를 폴리곤으로 표시합니다 
		for (var i = 0, len = areas.length; i < len; i++) {
			displayArea(areas[i]);
		}

		// 다각형을 생상하고 이벤트를 등록하는 함수입니다
		function displayArea(area) {

			// 다각형을 생성합니다 
			var polygon = new kakao.maps.Polygon({
				map : map, // 다각형을 표시할 지도 객체
				path : area.path,
				strokeWeight : 2,
				strokeColor : '#004c80',
				strokeOpacity : 0.8,
				fillColor : '#fff',
				fillOpacity : 0.7
			});

			// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
			// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
			kakao.maps.event.addListener(polygon, 'mouseover', function(
					mouseEvent) {
				polygon.setOptions({
					fillColor : '#09f'
				});
				customOverlay.setContent('<div class="area">' + area.name
						+ '</div>');
				customOverlay.setPosition(mouseEvent.latLng);
				customOverlay.setMap(map);
			});

			kakao.maps.event.addListener(polygon, 'click',
					function(mouseEvent) {
						polygon.setOptions({
							fillColor : 'red'
						});
						customOverlay.setContent('<div class="area">'
								+ area.name + '</div>');
						customOverlay.setPosition(mouseEvent.latLng);
						customOverlay.setMap(map);
						for (var i = 0, len = areas.length; i < len; i++) {
							console.log("all" + areas[i].name);
							if (areas[i].name == area.name) {
								if (area.name == "순천") {
									$('.suncheon').fadeIn(1000);
									$('.seoul').hide();
									$('.incheon').hide();
								} else if (area.name == "서울") {
									$('.seoul').fadeIn(1000);
									$('.incheon').hide();
									$('.suncheon').hide();
								} else if (area.name == "인천") {
									$('.incheon').fadeIn(1000);
									$('.seoul').hide();
									$('.suncheon').hide();
								}
							}
						}
					});

			// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
			kakao.maps.event.addListener(polygon, 'mousemove', function(
					mouseEvent) {

				customOverlay.setPosition(mouseEvent.latLng);
			});

			// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
			// 커스텀 오버레이를 지도에서 제거합니다 

			kakao.maps.event.addListener(polygon, 'mouseout', function(
					mouseEvent) {
				polygon.setOptions({
					fillColor : '#fff'
				});
				customOverlay.setMap(null);
			});

			// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		}
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
		<div id="map"></div>
		<div class="grid-gal clearfix">
			<div class="item suncheon">
				<h3>순천</h3>
				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C.jpg">
					<div class="sForm">
						<h4>순천만국가정원</h4>
						<p>
							<br>순천만국가정원으로 오십시오. 순천은 산, 바다, 호수가 어우러져 ‘소강남’으로 불릴 정도로 천혜의
							자연환경을 갖춘 곳입니다. <a href="http://garden.sc.go.kr/?r=home"><br>
								<br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C2.jpg">
					<div class="sForm">
						<h4>낙안읍성</h4>
						<p>
							<br>순천 낙안읍성은 조선시대 대표적인 지방계획도시로 대한민국 3대 읍성 중 하나로 사적 제302호로
							지정되어 있으며 연간 120만명의 관광객이 방문하는 주요 관광지로 현재 세계문화유산 잠정목록 등재 및
							CNN선정대한민국 대표 관광지 16위로 선정되었습니다. <a
								href="http://nagan.suncheon.go.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C3.jpg">
					<div class="sForm">
						<h4>선암사</h4>
						<p>
							<br>《선암사사적기(仙巖寺寺蹟記)》에 따르면 542년(진흥왕 3) 아도(阿道)가 비로암(毘盧庵)으로
							창건하였다고도 하고, 875년(헌강왕 5) 도선국사(道詵國師)가 창건하고 신선이 내린 바위라 하여 선암사라고도 한다.
							주요문화재로는 보물 제395호인 삼층석탑 2기가 있으며, 대웅전은 전라남도유형문화재 제41호로 지정되어 있다. <a
								href="http://www.seonamsa.net/"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C4.jpg">
					<div class="sForm">
						<h4>죽도봉공원</h4>
						<p>
							<br>죽도봉이라는 지명은 산죽(山竹)과 동백숲이 울창하고 봉우리 모양이 마치 바다에 떠 있는 섬과 같다는
							데서 유래하였다. 순천시가 1975년부터 공원 조성 작업을 시작하여, 1981년 김계선의 성금을 받아 전망대인
							강남정을 세웠다. 봄에 피는 벚꽃이 장관이며, 죽도봉(101.8m) 정상에 오르면 순천시내가 한눈에 들어온다. <a
								href="#"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>
			</div>

			<div class="item seoul">
				<h3>서울</h3>
				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B8.jpg">
					<div class="sForm">
						<h4>전쟁기념관</h4>
						<p>
							<br>호국 자료의 수집·보존·전시, 전쟁의 교훈과 호국정신 배양, 선열들의 호국 위훈 추모를 목적으로
							1990년 9월 착공해 1993년 12월 완공하고, 1994년 6월 10일 개관한 기념관이다. 연건평 2만 5천 평에
							지하 2층, 지상 4층 규모이며, 호국추모실·전쟁역사실·한국전쟁실·해외파병실·국군발전실·대형장비실 등 6개 전시실로
							구분되어 있다. <a href="http://www.warmemo.or.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B82.jpg">
					<div class="sForm">
						<h4>경복궁</h4>
						<p>
							<br>서울은 외사산(外四山)인 북한산(북) 관악산(남) 아차산(동) 덕양산(서)이 넓게 감싸고, 내사산으로
							주산(主山)인 북쪽의 백악(白岳) 안산(案山)인 남쪽의 목멱(木覓, 남산) 동쪽의 타락(酡酪, 낙산) 서쪽의
							인왕(仁王)이 감싸안은 곳, 그 너른 품의 넉넉한 평지에 자리잡고 있다. 조선 왕조의 법궁(法宮)인 경복궁(景福宮)은
							이곳, 서울의 중심인 백악산 남쪽에서 서쪽으로 조금 치우친 곳에 있다. <a
								href="http://www.royalpalace.go.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B83.jpg">
					<div class="sForm">
						<h4>동대문(흥인지문)</h4>
						<p>
							<br>서울 도성에 딸린 8문 중의 하나로서 서울 도성 정동(正東)쪽에 있으며 원래의 이름은
							흥인지문(興仁之門)이다. 하지만 일반적으로 동대문이라고 부른다. 1396년(태조 5)에 건립되고 1453년(단종
							1)에 중수되었으며, 1869년(고종 6)에 이르러 이를 전적으로 개축하여 현재의 모습을 갖추었다. <a
								href="#"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%84%9C%EC%9A%B84.jpg">
					<div class="sForm">
						<h4>북촌한옥마을</h4>
						<p>
							<br>북촌 한옥마을은 서울의 대표적인 한옥마을로, 창덕궁과 경복궁사이에 위치하여 조선시대 고위관리나
							왕족들이 살았던 한양의 고급주거지이다. 옛날 으리으리했던 집들을 기대하고 간다면 실망할 수도 있겠다. 일제 때 이
							지역의 땅들이 분할되면서 큰 집들이 작게 나뉘게 되는데, 그 과정에서 실제 주거를 목적으로 새로 집들을 지으면서
							서로서로 지붕을 맞대는, 작지만 생활하기에 효율적인 집들이 만들어졌다. <a
								href="http://hanok.seoul.go.kr/"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>
			</div>

			<div class="item incheon">
				<h3>인천</h3>
				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C.jpg">
					<div class="sForm">
						<h4>순천만국가정원</h4>
						<p>
							<br>순천만국가정원으로 오십시오. 순천은 산, 바다, 호수가 어우러져 ‘소강남’으로 불릴 정도로 천혜의
							자연환경을 갖춘 곳입니다. <a href="http://garden.sc.go.kr/?r=home"><br>
								<br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C2.jpg">
					<div class="sForm">
						<h4>낙안읍성</h4>
						<p>
							<br>순천 낙안읍성은 조선시대 대표적인 지방계획도시로 대한민국 3대 읍성 중 하나로 사적 제302호로
							지정되어 있으며 연간 120만명의 관광객이 방문하는 주요 관광지로 현재 세계문화유산 잠정목록 등재 및
							CNN선정대한민국 대표 관광지 16위로 선정되었습니다. <a
								href="http://nagan.suncheon.go.kr/"><br> <br>홈페이지로
								이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C3.jpg">
					<div class="sForm">
						<h4>선암사</h4>
						<p>
							<br>《선암사사적기(仙巖寺寺蹟記)》에 따르면 542년(진흥왕 3) 아도(阿道)가 비로암(毘盧庵)으로
							창건하였다고도 하고, 875년(헌강왕 5) 도선국사(道詵國師)가 창건하고 신선이 내린 바위라 하여 선암사라고도 한다.
							주요문화재로는 보물 제395호인 삼층석탑 2기가 있으며, 대웅전은 전라남도유형문화재 제41호로 지정되어 있다. <a
								href="http://www.seonamsa.net/"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>

				<form class="content">
					<img src="images/%EC%88%9C%EC%B2%9C4.jpg">
					<div class="sForm">
						<h4>죽도봉공원</h4>
						<p>
							<br>죽도봉이라는 지명은 산죽(山竹)과 동백숲이 울창하고 봉우리 모양이 마치 바다에 떠 있는 섬과 같다는
							데서 유래하였다. 순천시가 1975년부터 공원 조성 작업을 시작하여, 1981년 김계선의 성금을 받아 전망대인
							강남정을 세웠다. 봄에 피는 벚꽃이 장관이며, 죽도봉(101.8m) 정상에 오르면 순천시내가 한눈에 들어온다. <a
								href="#"><br> <br>홈페이지로 이동</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</section>

	<footer>
		<div class="foot">
			<p>그린컴퓨터 아카데미</p>
			<P>공동대표 양효빈, 이내경, 최성혁, 최치호</P>
			<p>인천 부평구 부평대로 19-1 6층,9층, 10층</p>
		</div>
		<div id="map1"></div>
	</footer>
	<script>
		var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
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
	<script>
		// 지도에 폴리곤으로 표시할 영역데이터 배열입니다 
		var areas = [
				{
					name : '서울',
					path : [ new kakao.maps.LatLng(37.640563, 126.912320),
							new kakao.maps.LatLng(37.648937, 127.092891),
							new kakao.maps.LatLng(37.559745, 127.175621),
							new kakao.maps.LatLng(37.454407, 127.091664),
							new kakao.maps.LatLng(37.485429, 126.831280),
							new kakao.maps.LatLng(37.621522, 126.904882) ]

				},
				{
					name : '순천',
					path : [ new kakao.maps.LatLng(35.184139, 127.412220),
							new kakao.maps.LatLng(35.130343, 127.207496),
							new kakao.maps.LatLng(34.904243, 127.226319),
							new kakao.maps.LatLng(34.840618, 127.410479),
							new kakao.maps.LatLng(34.842347, 127.481757),
							new kakao.maps.LatLng(34.885201, 127.570285) ]
				},
				{
					name : '인천',
					path : [ new kakao.maps.LatLng(37.637862, 126.655597),
							new kakao.maps.LatLng(37.823754, 126.431962),
							new kakao.maps.LatLng(37.678816, 126.163779),
							new kakao.maps.LatLng(37.367642, 126.408405),
							new kakao.maps.LatLng(37.392842, 126.694834),
							new kakao.maps.LatLng(37.585020, 126.781331) ]
				} ];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
				{}), infowindow = new kakao.maps.InfoWindow({
			removable : true
		});

		// 지도에 영역데이터를 폴리곤으로 표시합니다 
		for (var i = 0, len = areas.length; i < len; i++) {
			displayArea(areas[i]);
		}

		// 다각형을 생상하고 이벤트를 등록하는 함수입니다
		function displayArea(area) {

			// 다각형을 생성합니다 
			var polygon = new kakao.maps.Polygon({
				map : map, // 다각형을 표시할 지도 객체
				path : area.path,
				strokeWeight : 2,
				strokeColor : '#004c80',
				strokeOpacity : 0.8,
				fillColor : '#fff',
				fillOpacity : 0.7
			});

			// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
			// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
			kakao.maps.event.addListener(polygon, 'mouseover', function(
					mouseEvent) {
				polygon.setOptions({
					fillColor : '#09f'
				});
				customOverlay.setContent('<div class="area">' + area.name
						+ '</div>');
				customOverlay.setPosition(mouseEvent.latLng);
				customOverlay.setMap(map);
			});

			kakao.maps.event.addListener(polygon, 'click',
					function(mouseEvent) {
						polygon.setOptions({
							fillColor : 'red'
						});
						customOverlay.setContent('<div class="area">'
								+ area.name + '</div>');
						customOverlay.setPosition(mouseEvent.latLng);
						customOverlay.setMap(map);
						for (var i = 0, len = areas.length; i < len; i++) {
							console.log("all" + areas[i].name);
							if (areas[i].name == area.name) {
								if (area.name == "순천") {
									$('.suncheon').fadeIn(1000);
									$('.seoul').hide();
									$('.incheon').hide();
								} else if (area.name == "서울") {
									$('.seoul').fadeIn(1000);
									$('.incheon').hide();
									$('.suncheon').hide();
								} else if (area.name == "인천") {
									$('.incheon').fadeIn(1000);
									$('.seoul').hide();
									$('.suncheon').hide();
								}
							}
						}
					});

			// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
			kakao.maps.event.addListener(polygon, 'mousemove', function(
					mouseEvent) {

				customOverlay.setPosition(mouseEvent.latLng);
			});

			// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
			// 커스텀 오버레이를 지도에서 제거합니다 

			kakao.maps.event.addListener(polygon, 'mouseout', function(
					mouseEvent) {
				polygon.setOptions({
					fillColor : '#fff'
				});
				customOverlay.setMap(null);
			});

			// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		}
	</script>
	<%
		}
	%>
</body>
</html>