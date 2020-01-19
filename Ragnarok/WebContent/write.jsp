<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Y군의 웹</title>
<link rel="stylesheet" href="write.css">
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
	
	if(userID == null){
	 	   PrintWriter script = response.getWriter();
	 	   script.println("<script>");
	 	   script.println("alert('로그인 후 이용해주세요.')");
	 	   script.println("location.href='main.jsp'");
	 	   script.println("</script>");
	}
	if(error!=null && error.equals("0")){
		PrintWriter script = response.getWriter();
	 	   script.println("<script>");
	 	   script.println("alert('입력되지 않은 사항이 있습니다.')");
	 	   script.println("history.back()");
	 	   script.println("</script>");
	} else if(error!=null && error.equals("1")) {
		PrintWriter script = response.getWriter();
	 	   script.println("<script>");
	 	   script.println("location.href='comunity.jsp'");
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
		<div class="navImg"></div>
	</nav>
	<section>
		<h2>커뮤니티</h2>
		<form method="post" action="write.go">
			<table class="first">
				<tr>
					<td class="cTitle">제목</td>
					<td><input type="text" value=<%=userID %> class="userID"
						name="userID">
					<td><input type="text" name="bbsTitle"
						placeholder="제목을 입력하세요." class="cTitleL"></td>
				</tr>

				<table>
					<tr>
						<td class="cContent"><input type="text" name="bbsContent"
							placeholder="내용을 입력하세요" class="cWrite"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<button type="submit" value="등록" class="btn">등록</button>

						</td>
					</tr>
				</table>
			</table>
		</form>
	</section>
</body>
</html>