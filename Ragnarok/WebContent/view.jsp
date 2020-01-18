<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Y군의 웹</title>
<link rel="stylesheet" href="view.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
		String userID = null;
		String error = (String) request.getAttribute("Error");
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav>
		<div class="top">
			<div class="topLogo"></div>
			<ul>
				<li>라그나로크</li>
				<li>라그나로크 제로</li>
				<li>스마트폰 게임</li>
				<li>이벤트</li>
				<li>캐시충전</li>
				<li>고객센터</li>
			</ul>
		</div>
		<div class="mainNav">

			<ul>
				<div class="logo"></div>
				<li>새소식</li>
				<li>게임정보</li>
				<li>커뮤니티</li>
				<li>ROSHOP</li>
				<li>자료실</li>
				<li>고객센터</li>
			</ul>
		</div>
		<div class="navImg"></div>
	</nav>
	<section>
		<h2>커뮤니티</h2>
		<table class="first">
			<tr>
				<td class="cTitle">제목</td>
				<td class="cTitleL">여기에 제목 view</td>
			</tr>
			<table>
				<tr>
					<td class="cWriter">작성자</td>
					<td class="cWriterL">proxy94</td>
					<td class="cDate">등록일</td>
					<td class="cDate">2019-01-12</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="cContent">여기에 내용</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<form method="post" action="reple" class="reple">
							<input type="text" name="reple" placeholder="로그인 후 이용 가능합니다."
								class="iC">
							<button type="submit" value="등록" class="btn">등록</button>
						</form>
					</td>
				</tr>
			</table>
		</table>

		<table class="retable">
			<tr>
				<td class="reID">아이디</td>
				<td class="reDate">날짜</td>
			</tr>
			<td><div class="reContent">여기에 댓글 내용</div></td>
		</table>
	</section>
</body>
</html>