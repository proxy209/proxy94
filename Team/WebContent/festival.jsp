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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.min.js'></script>
<link rel="stylesheet" href="css/festival.css">
<script src="js/slide.js"></script>
<script src="js/tab.js"></script>
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
	
	<!-- 슬라이드 -->
  <div class="slide">
    <div class="hidden">
      <div class="frame clearfix">
        <div class="slide-img img1 "><a href="#"></a></div>
        <div class="slide-img img2"><a href="#"></a></div>
        <div class="slide-img img3"><a href="#"></a></div>
      </div>
    </div>
  </div>
	<!-- 전체 컨텐츠 -->
	<div class="content">

		<!-- 탭 -->

		<div class="tab-wrap">
			<ul id="filters" class="tab clearfix">
				<li data-filter="*" class="tab1  ho on"><a href="#">전체</a></li>
				<li data-filter=".s" class="tab2 ho"><a href="#">서울</a></li>
				<li data-filter=".c" class="tab3 ho"><a href="#">춘천</a></li>
				<li data-filter=".j" class="tab4 ho"><a href="#">전주</a></li>
				<li data-filter=".y" class="tab5 ho"><a href="#">여수</a></li>
				<li data-filter=".b" class="tab6 ho"><a href="#">부산</a></li>
				<li data-filter=".ji" class="tab7 ho"><a href="#">제주도</a></li>
			</ul>
		</div>
		<div class="con-wrap">

			<div class="s con ho">
				<div class="con-img cm1">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">빛의 광장 IN DMC 2020</a>
				</p>
				<span><a href="#">2019.12.20~2020.01.19</a></span>
			</div>


			<div class="b con ho">
				<div class="con-img cm2">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">해운대 모래축제 2020</a>
				</p>
				<span><a href="#">2020.05.22~2020.06.07</a></span>
			</div>

			<div class="ji con ho">
				<div class="con-img cm3">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">상효원 튤립축제</a>
				</p>
				<span><a href="#">2020.02.29~2020.04.05</a></span>
			</div>

			<div class="s con ho">
				<div class="con-img cm4">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">연등회 2020</a>
				</p>
				<span><a href="#">2020.04.24~2020.04.26</a></span>
			</div>

			<div class="c con ho">
				<div class="con-img cm5">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">남이섬 겨울축제 </a>
				</p>
				<span><a href="#">2019.12.21~2020.02.09</a></span>
			</div>

			<div class="j con ho">
				<div class="con-img cm6">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">전주제야축제 2020</a>
				</p>
				<span><a href="#">2019.12.31~2020.01.01</a></span>
			</div>

			<div class="b con ho">
				<div class="con-img cm7">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">광안리어방축제 2020</a>
				</p>
				<span><a href="#">2020.04.24~ 2020.04.26</a></span>
			</div>

			<div class="y con ho">
				<div class="con-img cm8">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">여수밤바다 불꽃축제</a>
				</p>
				<span><a href="#">2020.10.26~2020.10.26</a></span>
			</div>
			<div class="ji con ho">
				<div class="con-img cm9">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">마노르블랑 동백꽃축제</a>
				</p>
				<span><a href="#">2019.12.01~2020.02.29</a></span>
			</div>

		</div>
	</div>


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
	
	<!-- 슬라이드 -->
  <div class="slide">
    <div class="hidden">
      <div class="frame clearfix">
        <div class="slide-img img1 "><a href="#"></a></div>
        <div class="slide-img img2"><a href="#"></a></div>
        <div class="slide-img img3"><a href="#"></a></div>
      </div>
    </div>
  </div>
	<!-- 전체 컨텐츠 -->
	<div class="content">

		<!-- 탭 -->

		<div class="tab-wrap">
			<ul id="filters" class="tab clearfix">
				<li data-filter="*" class="tab1  ho on"><a href="#">전체</a></li>
				<li data-filter=".s" class="tab2 ho"><a href="#">서울</a></li>
				<li data-filter=".c" class="tab3 ho"><a href="#">춘천</a></li>
				<li data-filter=".j" class="tab4 ho"><a href="#">전주</a></li>
				<li data-filter=".y" class="tab5 ho"><a href="#">여수</a></li>
				<li data-filter=".b" class="tab6 ho"><a href="#">부산</a></li>
				<li data-filter=".ji" class="tab7 ho"><a href="#">제주도</a></li>
			</ul>
		</div>
		<div class="con-wrap">

			<div class="s con ho">
				<div class="con-img cm1">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">빛의 광장 IN DMC 2020</a>
				</p>
				<span><a href="#">2019.12.20~2020.01.19</a></span>
			</div>


			<div class="b con ho">
				<div class="con-img cm2">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">해운대 모래축제 2020</a>
				</p>
				<span><a href="#">2020.05.22~2020.06.07</a></span>
			</div>

			<div class="ji con ho">
				<div class="con-img cm3">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">상효원 튤립축제</a>
				</p>
				<span><a href="#">2020.02.29~2020.04.05</a></span>
			</div>

			<div class="s con ho">
				<div class="con-img cm4">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">연등회 2020</a>
				</p>
				<span><a href="#">2020.04.24~2020.04.26</a></span>
			</div>

			<div class="c con ho">
				<div class="con-img cm5">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">남이섬 겨울축제 </a>
				</p>
				<span><a href="#">2019.12.21~2020.02.09</a></span>
			</div>

			<div class="j con ho">
				<div class="con-img cm6">
					<a href="#"></a>
					
				</div>
				<p>
					<a href="#">전주제야축제 2020</a>
				</p>
				<span><a href="#">2019.12.31~2020.01.01</a></span>
			</div>

			<div class="b con ho">
				<div class="con-img cm7">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">광안리어방축제 2020</a>
				</p>
				<span><a href="#">2020.04.24~ 2020.04.26</a></span>
			</div>

			<div class="y con ho">
				<div class="con-img cm8">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">여수밤바다 불꽃축제</a>
				</p>
				<span><a href="#">2020.10.26~2020.10.26</a></span>
			</div>
			<div class="ji con ho">
				<div class="con-img cm9">
					<a href="#"></a>
				</div>
				<p>
					<a href="#">마노르블랑 동백꽃축제</a>
				</p>
				<span><a href="#">2019.12.01~2020.02.29</a></span>
			</div>

		</div>
	</div>


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