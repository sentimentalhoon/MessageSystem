<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.Board"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");

pageContext.setAttribute("boardList", boardList);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="../assetsBoard/css/main.css" />
		<link rel="stylesheet" href="../assetsBoard/css/board.css" />
		
</head>
<body>		
	<!-- Wrapper -->
	<div id="wrapper">
	<%@ include file="/WEB-INF/includePage/header.jsp" %>
			<!-- Q17. 게시글 목록 조회 기능 -->
			<!-- Q18. 게시글 목록 세부페이지 기능(제목을 클릭하면 세부페이지 BoardDetail.jsp로 이동)-->
			<div id="board">
				<table id = "list">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>시간</td>
					</tr>
					<c:forEach var="item" items="${boardList}">
					<tr>
						<td><a href="/Board/Read?num=${item.num}">${item.num}</a></td>
						<td><a href="/Board/Read?num=${item.num}">${item.title}</a></td>
						<td><a href="/Board/Read?num=${item.num}">${item.writer}</a></td>
						<td><a href="/Board/Read?num=${item.num}">${item.b_date}</a></td>
					</tr>
					</c:forEach>
				</table>
				<a href="goMain"><button id="writer">홈으로가기</button></a>
				<a href="Write"><button id="writer">작성하러가기</button></a>
			</div>
			<%@ include file="/WEB-INF/includePage/footer.jsp" %>			

			<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			</div>
</body>
</html>