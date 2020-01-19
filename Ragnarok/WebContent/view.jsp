<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.BbsDTO"%>
<%@ page import="reple.RepleDAO"%>
<%@ page import="reple.RepleDTO"%>
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
		System.out.println("Error Code : "+error);
		
	
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		BbsDTO dto = new BbsDAO().getBbs(bbsID);
		
		if(error != null && error.equals("0") ){
			   PrintWriter script = response.getWriter();
		 	   script.println("<script>");
		 	   script.println("alert('로그인 후 이용이 가능합니다.')");
		 	   script.println("location.href='main.jsp'");
		 	   script.println("</script>");
		} else if(error != null && error.equals("1") ){
			 PrintWriter script = response.getWriter();
		 	   script.println("<script>");
		 	   script.println("alert('내용을 입력해주세요.')");
		 	   script.println("history.back()");
		 	   script.println("</script>");
		} else if(error != null && error.equals("2") ){
			 PrintWriter script = response.getWriter();
		 	   script.println("<script>");
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
		<div class="navImg"></div>
	</nav>
	<section>
		<h2>커뮤니티</h2>
		<table class="first">
			<tr>
				<td class="cTitle">제목</td>
				<td class="cTitleL"><%=dto.getBbsTitle() %></td>
			</tr>
			<table>
				<tr>
					<td class="cWriter">작성자</td>
					<td class="cWriterL"><%=dto.getUserID() %></td>
					<td class="cDate">등록일</td>
					<td class="cDate"><%=dto.getBbsDate() %></td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="cContent"><%=dto.getBbsContent() %></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<form method="post" action="reple.go" class="reple">
							<input type="text" name="repleContent"
								placeholder="로그인 후 이용 가능합니다." class="iC"> <input
								type="text" name="bbsID" value="<%=bbsID %>" class="none">
							<input type="text" name="userID" value="<%=userID %>"
								class="none">
							<button type="submit" value="등록" class="btn">등록</button>
						</form>
					</td>
				</tr>
			</table>
		</table>

		<table class="retable">
		<%
				RepleDAO repleDAO = new RepleDAO();
				ArrayList<RepleDTO> list = repleDAO.getList(pageNumber, bbsID);
				for (int i = 0; i < list.size(); i++) {
					%>
				
			<tr>
				<td class="reID"><%=list.get(i).getUserID() %></td>
				<td class="reDate"><%=list.get(i).getRepleDATE() %></td>
			</tr>
			<tr>
				<td><div class="reContent"><%=list.get(i).getRepleContent() %></div></td>
			<tr>
			<%
				}
			%>
		</table>
		<button class="listbtn" type="button" onclick="history.back()">목록</button>
	</section>
</body>
</html>