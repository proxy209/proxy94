<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Y군의 웹</title>
<link rel="stylesheet" href="style.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
	String userID = null;
	String error = (String) request.getAttribute("Error");
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	} 
	if(error!=null && error.equals("0")){
		System.out.println(error);
 	   PrintWriter script = response.getWriter();
 	   script.println("<script>");
 	   script.println("alert('비밀번호가 틀렸습니다.')");
 	   script.println("history.back()");
 	   script.println("</script>");
	} else if(error!=null && error.equals("-1")){
	 	   PrintWriter script = response.getWriter();
	 	   script.println("<script>");
	 	   script.println("alert('존재하지 않는 아이디 입니다.')");
	 	   script.println("history.back()");
	 	   script.println("</script>");
	}
	
	if(userID == null){
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
				<li><a href="comunity.jsp">커뮤니티</a></li>
				<li>ROSHOP</li>
				<li>자료실</li>
				<li>고객센터</li>
			</ul>
		</div>
		<div class="navImg"></div>
	</nav>
	<section>
		<div class="section s1">
			<div class="login">
				<form method="post" action="login.go">
					<input type="text" name="userID" placeholder="ID"> <input
						type="password" name="userPassword" placeholder="PASSWORD">
					<button class="btn" type="submit" value="LOGIN">LOGIN</button>
				</form>
				<button type="button" onclick="location.href='sign.jsp'">SIGN</button>
			</div>
			<div class="s1Main">
				<div class="s1MainNav"></div>
			</div>
		</div>

		<div class="section s2">
			<table class="news">
				<th>새소식</th>
				<tr>
					<td></td>
				</tr>
			</table>
			<table class="comu">
				<th>커뮤니티</th>
				<tr>
					<td></td>
				</tr>
			</table>
			<table class="info">
				<th>게임정보</th>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</section>

	<%
  } else {
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
				<li><a href="comunity.jsp">커뮤니티</a></li>
				<li>ROSHOP</li>
				<li>자료실</li>
				<li>고객센터</li>
			</ul>
		</div>
		<div class="navImg"></div>
	</nav>
	<section>
		<div class="section s1">
			<div class="login">
				<form class="logoutForm" method="post" action="logOut.go">
					<p><%=userID %>님 어서오세요.
					</p>
					<button class="logOutbtn" type="submit" value="LOGOUT">LOGOUT</button>
				</form>
			</div>
			<div class="s1Main">
				<div class="s1MainNav"></div>
			</div>
		</div>

		<div class="section s2">
			<table class="news">
				<th>새소식</th>
				<tr>
					<td></td>
				</tr>
			</table>
			<table class="comu">
				<th>커뮤니티</th>
				<tr>
					<td></td>
				</tr>
			</table>
			<table class="info">
				<th>게임정보</th>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</section>
	<%
  }
  %>
</body>
</html>