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
<link rel="stylesheet" href="sign.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
		String error = (String) request.getAttribute("Error");

	if (error != null && error.equals("1")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if (error != null && error.equals("0")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된사항이 있습니다.')");
		 	script.println("history.back()");
			script.println("</script>");
		} else if (error != null && error.equals("-1")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
		 	script.println("history.back()");
			script.println("</script>");
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
	</nav>
	<section>
		<div class="sign">
			<form method="post" action="sign.go">
				<input type="text" name="userID" placeholder="아이디"> <input
					type="password" name="userPassword" placeholder="비밀번호"> <input
					type="text" name="userName" placeholder="이름"> <input
					type="email" name="userEmail" placeholder="이메일">
				<button type="submit" value="Send">회원가입</button>
			</form>
		</div>
	</section>
</body>
</html>