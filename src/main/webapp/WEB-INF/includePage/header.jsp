<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.smhrd.model.Member"%>

<!-- Header -->
		<header id="header" class="alt"> <a href="goMain"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>
		
		<c:choose>
			<c:when test="${!empty memberInfo}">
				<a href="Member?type=logout">로그아웃</a>
				<a href="Member?type=logout">회원 정보 수정</a>
			</c:when>
			<c:otherwise>
				<!-- Q6. 로그인을 한 상태에서는 로그인탭 대신 로그아웃탭과 개인정보수정탭을 출력 -->
				<a href="#menu">로그인</a>
			</c:otherwise>
		</c:choose> </nav> </header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<!-- Q3. 로그인 기능 만들기 -->
			<li><h5>로그인</h5></li>
			<form action="/Member?type=read" method="post" id="loginForm">
				<li><input type="text" onkeyup="printEmail()"
					placeholder="Email을 입력하세요" name="email" required id="loginEmail" />
				</li>
				<li><span id="loginEmail_check" class="warn_text"> 유효한
						이메일 주소를 입력하세요.</span></li>
				<li><input type="password" placeholder="PW를 입력하세요"
					name="password" required id="loginPassword" /></li>
				<li><input type="submit" value="LogIn" class="button fit"
					disabled id="loginButton" /></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<!-- Q1. 회원가입 기능 만들기 -->
			<li><h5>회원가입</h5></li>
			<form action="/Member?type=create" method="post" id="joinForm">
				<li><input type="text" onkeyup="printEmail()"
					placeholder="Email을 입력하세요" name="email" required id="joinEmail" />
				</li>
				<li><input type="password" placeholder="PW를 입력하세요"
					name="password" required id="joinPassword" /></li>
				<li><input type="text" placeholder="전화번호를 입력하세요" name="phone"
					required id="joinPhone" /></li>
				<li><input type="text" placeholder="집주소를 입력하세요" name="address"
					required id="joinAddress" /></li>
				<li><input type="submit" value="JoinUs" class="button fit" /></li>
			</form>
		</ul>
		</nav>