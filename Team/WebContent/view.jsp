<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="bbs.bbsDAO"%>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="reple.repleDAO"%>
<%@ page import="reple.repleDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e93c5c56ced2492f904fe8cfaad20ab5"></script>
<title>...</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/view.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="main.js"></script>

</head>
<body>
	<%
		String userID = null;
		int count = 0;
		String error = (String) request.getAttribute("Error");
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 

		System.out.println("Error Code : " + error);

		int bID = 0;
		if (request.getParameter("bID") != null) {
			bID = Integer.parseInt(request.getParameter("bID"));
		}

		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

		bbsDTO dto = new bbsDAO().getBbs(bID);

		if (error != null && error.equals("0")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용이 가능합니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		} else if (error != null && error.equals("1")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (error != null && error.equals("2")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("history.back()");
			script.println("</script>");
		}
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
		<h3 class="title1">여행일지</h3>
		<div class="container">

			<h4><%=dto.getbTitle()%></h4>
			<div class="info">
				<p><%=dto.getUserID()%></p>
			</div>

			<div class="content">
				<p><%=dto.getbContent()%></p>
			</div>
			<form class="like" method="post" action="like.go">
				<button type="submit">좋아요</button>
			</form>
			<%
				repleDAO rDAO = new repleDAO();
				ArrayList<repleDTO> list = rDAO.getList(pageNumber, bID);
				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="reple">
				<p><%=list.get(i).getUserID()%></p>
				<p><%=list.get(i).getrDate()%></p>
			</div>
			<div class="rContent">
				<p><%=list.get(i).getrContent()%></p>
			</div>
		</div>
		<%
			}
		%>
		<form method="post" action="reple.go">
			<input type="hidden" name="userID" value="<%=userID%>"> <input
				type="hidden" name="bID" value="<%=bID%>">
			<div class="wReple">
				<textarea name="rContent" style="width: 694px; height: 150px"
					placeholder="댓글을 입력해주세요."></textarea>
				<button class="rbtn" type="submit"
					style="width: 100px; height: 70px;">댓글등록</button>
				<button class="listbtn" type="button" onclick="history.back()">목록</button>
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

</body>
</html>