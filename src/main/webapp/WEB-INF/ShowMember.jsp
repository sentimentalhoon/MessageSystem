<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Object obj = request.getAttribute("memberList");
if (obj != null) {
	ArrayList<Member> memberList = new ArrayList<Member>();
	if (obj instanceof ArrayList<?>) {
		ArrayList<?> al = (ArrayList<?>) obj;
		if (al.size() > 0) {
	for (int i = 0; i < al.size(); i++) {
		Object o = al.get(i);
		if (o instanceof Member) {
			memberList.add((Member) o);
		}
	}
		}
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style></style>
<body style="text-align: center">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
		<table>
			<caption>
				<h2>회원관리페이지</h2>
			</caption>
			<tr>
				<td>Email</td>
				<td>Tel</td>
				<td>Address</td>
			</tr>
			<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
			<c:forEach var="member" items="${memberList}" varStatus="status">
				<tr>
					<td><span>${member.email}</span></td>
					<td><span>${member.phone}</span></td>
					<td><span>${member.address}</span></td>
				</tr>
			</c:forEach>
		</table>
		</nav>
		<button id="more">불러오기</button>
		<a href="goMain" class="button next scrolly">되돌아가기</a>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8
          ]><script src="assets/js/ie/respond.min.js"></script
        ><![endif]-->
	<script src="assets/js/main.js"></script>

	<script>
          document
            .querySelector(".more")
            .addEventListener("click", function () {
              fetch("/more")
                .then((r) => r.json())
                .then((result) => {
                  console.log(result);
                });
            });
        </script>
</body>
</html>
