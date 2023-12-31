<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.smhrd.model.Board"%>
    <%
	Board board = (Board)request.getAttribute("board");
    pageContext.setAttribute("board", board);
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
			<!-- Q19. 게시글 세부내용 조회 기능 -->
			<div id = "board">
				<table id="list">
					<tr>
						<td>${board.getTitle()}</td>
					</tr>
					<tr>
						<td>${board.getWriter()}</td>
					</tr>
					<tr>
						<td>다운로드</td>
						<td><a href = "" download>다운로드</a></td>
					</tr>
					<tr>
						<td colspan="2">${board.getContent()}</td>
					</tr>
					<tr>
						<td colspan="2">
							<img src = "file/" /> <br>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="/Board/List"><button>뒤로가기</button></a></td>
					</tr>
				</table>
			</div>
			<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
</body>
</html>