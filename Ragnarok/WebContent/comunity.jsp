<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.BbsDTO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Y군의 웹</title>
<link rel="stylesheet" href="comunity.css">
<link rel="shortcut icon" href="#">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		BbsDAO bbsDAO = new BbsDAO();
		BbsDTO bbsDTO = new BbsDTO();
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
		<table>
			<tr>
				<td class="cNum">번호</td>
				<td class="cTitle">제목</td>
				<td class="cWriter">작성자</td>
				<td class="cDate">등록일</td>
			</tr>
			<%
				BbsDAO dao = new BbsDAO();
				ArrayList<BbsDTO> list = dao.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td class="cNumL"><%=list.get(i).getBbsID()%></td>
				<td class="cTitleL"><%=list.get(i).getBbsTitle()%></td>
				<td class="cWriterL"><%=list.get(i).getUserID()%></td>
				<td class="cDateL"><%=list.get(i).getBbsDate()%></td>
			</tr>
			<%
				}
			%>



		</table>
		<button onclick="location.href='write.jsp'" class="wbtn">글쓰기</button>


		<%
			int a = 0;
			int count = dao.count()+1;
			int de = (int) Math.ceil((double) count / 10);
			System.out.println(">>>>>>>count = " + count);
			System.out.println(">>>>>>>de = " + de);
			for (int j = 0; j < de; j++) {
		%>
		<a href="comunity.jsp?pageNumber=<%=j + 1%>" class="pageCount"><%=j + 1%></a>

		<%
			}
		%>


	</section>
</body>
</html>