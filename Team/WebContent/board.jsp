<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="bbs.bbsDAO"%>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="like.likeDAO"%>
<%@ page import="like.likeDTO"%>
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
<link rel="stylesheet" href="css/board.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

</head>
<body>
	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

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
		<h3 class="title1">여행일지</h3>
		<table class="board">
			<tr>
				<td style="width: 80px;">번호</td>
				<td style="width: 800px;">제목</td>
				<td style="width: 100px;">글쓴이</td>
				<td style="width: 100px;">날짜</td>
				<td style="width: 80px;">추천</td>
			</tr>
		</table>
		<%
			int like = 0;
				bbsDAO dao = new bbsDAO();
				bbsDTO dto = new bbsDTO();
				likeDAO Ldao = new likeDAO();
				likeDTO Ldto = new likeDTO();
				int array[][];
				ArrayList<likeDTO> likeList = Ldao.getbLike();
				ArrayList<bbsDTO> list = dao.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
		%>
		<table class="bContents">
			<tr>
				<td style="width: 80px;"><%=list.get(i).getbID()%></td>
				<td style="width: 800px;"><a
					href="view.jsp?bID=<%=list.get(i).getbID()%>"><%=list.get(i).getbTitle()%></a></td>
				<td style="width: 100px;"><%=list.get(i).getUserID()%></td>
				<td style="width: 100px;"><%=list.get(i).getbDate()%></td>
				<%
					System.out.println(list.get(i).getbID());
							for (int j = 0; j < likeList.size(); j++) {
								if (list.get(i).getbID() == likeList.get(j).getbID()) {
									like += likeList.get(j).getbLike();
									System.out.println(">>>>>>" + like);
				%>

				<%
					}

							}
				%>
				<td style="width: 80px;"><%=like%></td>
				<%
					like = 0;
				%>
			</tr>
		</table>
		<%
			}
		%>

		<div class="writeBtn">
			<button onclick="location.href='write.jsp'" value="글쓰기">글쓰기</button>
		</div>

		<div class="pageCount">
			<%
				int a = 0;
					int count = dao.count() + 1;
					int de = (int) Math.ceil((double) count / 10);
					System.out.println(">>>>>>>count = " + count);
					System.out.println(">>>>>>>de = " + de);
					for (int j = 0; j < de; j++) {
			%>

			<a href="board.jsp?pageNumber=<%=j + 1%>"><%=j + 1%></a>

			<%
				}
			%>
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
		<h3 class="title1">여행일지</h3>
		<table class="board">
			<tr>
				<td style="width: 80px;">번호</td>
				<td style="width: 800px;">제목</td>
				<td style="width: 100px;">글쓴이</td>
				<td style="width: 100px;">날짜</td>
				<td style="width: 80px;">조회</td>
				<td style="width: 80px;">추천</td>
			</tr>
		</table>

		<%
			int like = 0;
				bbsDAO dao = new bbsDAO();
				bbsDTO dto = new bbsDTO();
				likeDAO Ldao = new likeDAO();
				likeDTO Ldto = new likeDTO();
				int array[][];
				ArrayList<likeDTO> likeList = Ldao.getbLike();
				ArrayList<bbsDTO> list = dao.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
		%>
		<table class="bContents">
			<tr>
				<td style="width: 80px;"><%=list.get(i).getbID()%></td>
				<td style="width: 800px;"><a
					href="view.jsp?bID=<%=list.get(i).getbID()%>"><%=list.get(i).getbTitle()%></a></td>
				<td style="width: 100px;"><%=list.get(i).getUserID()%></td>
				<td style="width: 100px;"><%=list.get(i).getbDate()%></td>
				<%
					System.out.println(list.get(i).getbID());
							for (int j = 0; j < likeList.size(); j++) {
								if (list.get(i).getbID() == likeList.get(j).getbID()) {
									like += likeList.get(j).getbLike();
									System.out.println(">>>>>>" + like);
				%>

				<%
					}

							}
				%>
				<td style="width: 80px;"><%=like%></td>
				<%
					like = 0;
				%>
			</tr>
		</table>
		<%
			}
		%>
		<div class="writeBtn">
			<button onclick="location.href='write.jsp'" value="글쓰기">글쓰기</button>
		</div>
		<div class="pageCount">
			<%
				int a = 0;
					int count = dao.count() + 1;
					int de = (int) Math.ceil((double) count / 10);
					System.out.println(">>>>>>>count = " + count);
					System.out.println(">>>>>>>de = " + de);
					for (int j = 0; j < de; j++) {
			%>

			<a href="board.jsp?pageNumber=<%=j + 1%>"><%=j + 1%></a>

			<%
				}
			%>
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