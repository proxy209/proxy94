<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="info.army"%>
<%@ page import="info.armyinfo"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="style.css">
<title>Y군의 웹</title>
</head>
<body>
	<h2>나는 몇급 전사?</h2>
	<form method="post" action="">
		<select name="kind">
			<option value="">종목선택</option>
			<option value="팔굽혀펴기(2분)">팔굽혀펴기(2분)</option>
			<option value="윗몸일으키기(2분)">윗몸일으키기(2분)</option>
			<option value="3Km달리기">3Km달리기</option>
			<option value="4">모든 종목</option>
		</select> <select name="sex">
			<option value="">성별</option>
			<option value="1">남성</option>
		</select> <select name="age">
			<option value="">나이</option>
			<option value="0세 ~ 25세">0세 ~ 25세</option>
			<option value="26세 ~ 30세">26세 ~ 30세</option>
			<option value="31세 ~ 35세">31세 ~ 35세</option>
			<option value="36세 ~ 40세">36세 ~ 40세</option>
			<option value="41세 ~ 43세">41세 ~ 43세</option>
			<option value="44세 ~ 46세">44세 ~ 46세</option>
			<option value="47세 ~ 49세">47세 ~ 49세</option>
			<option value="50세 ~ 51세">50세 ~ 51세</option>
			<option value="52세 ~ 53세">52세 ~ 53세</option>
			<option value="54세 ~ 55세">54세 ~ 55세</option>
			<option value="56세 ~ 57세">56세 ~ 57세</option>
			<option value="58세 ~ 59세">58세 ~ 59세</option>
			<option value="60세 ~ 99세">60세 ~ 99세</option>
		</select>
		<button type="submit" value="btn">확인</button>
	</form>

	<%
		armyinfo info = new armyinfo();
		String k = request.getParameter("kind");
		String a = request.getParameter("age");
		System.out.println(">>>>>>" + k);
		System.out.println(">>>>>>" + a);
		army am = new army();
		ArrayList<armyinfo> list = am.list();
		if (k != "" && a != "") {
	%>
	<table>
		<tr class="title">
			<th>종목</th>
			<th>성별</th>
			<th>나이</th>
		</tr>
	</table>
	<%
		for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getKind().equals(k) == true && list.get(i).getAge_lwlmtprcdc().equals(a) == true) {
					/* System.out.println(list.get(i).getKind());
					System.out.println(list.get(i).getSex());
					System.out.println(list.get(i).getAge_lwlmtprcdc());
					System.out.println(list.get(i).getStd_lwlmtprcdc());
					System.out.println(list.get(i).getStd_uprlmtprcdc());
					System.out.println(list.get(i).getGrd());
					System.out.println(); */
	%>
	<table>
		<tr>
			<td><%=list.get(i).getKind()%></td>
			<td><%=list.get(i).getSex()%></td>
			<td><%=list.get(i).getAge_lwlmtprcdc()%></td>
			<td><%=list.get(i).getStd_lwlmtprcdc()%></td>
			<td><%=list.get(i).getStd_uprlmtprcdc()%></td>
			<td><%=list.get(i).getGrd()%></td>
		</tr>
	</table>

	<%
		}
			}
		}
	%>

</body>
</html>