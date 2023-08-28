<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MessageDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Member info = (Member) session.getAttribute("memberInfo");

if (info != null) {
	MessageDAO dao = new MessageDAO();
	ArrayList<Message> messageList = dao.getMessageList(info.getEmail());
	pageContext.setAttribute("info", info);
	pageContext.setAttribute("list", messageList);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/main.css" />
<style>
.warn_text {
	/* 텍스트 안보이게 설정 */
	visibility: hidden;
	/* 텍스트 크기, 굵기, 색 설정 */
	font-size: 12px;
	font-weight: 600;
	color: #EF4444;
	/* 텍스트 위, 아래에 여백 설정 */
	margin-top: 0.25rem;
	margin-bottom: 1rem;
}
</style>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt"> <a href="goMain"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>
		<c:choose>
			<c:when test="${!empty info}">
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
			<form action="Member?type=read" method="post" id="loginForm">
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
			<form action="Member?type=create" method="post" id="joinForm">
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
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major"> <c:choose>
				<c:when test="${!empty info}">
					<!-- Q4. 로그인 후 로그인한 사용자의 아이디로 바꾸기 -->
					<!-- ex) 00님 환영합니다.  -->
					<h1>${info.getEmail()}님반갑습니다.</h1>
				</c:when>
				<c:otherwise>
					<!-- Q4. 로그인 후 로그인한 사용자의 아이디로 바꾸기 -->
					<!-- ex) 00님 환영합니다.  -->
					<h1>로그인을 진행하여 주시기 바랍니다.</h1>
				</c:otherwise>
			</c:choose> </header>
			<div class="content">
				<p>
					게시판을 이용해보세요 ^^<br />
				</p>
				<ul class="actions">
					<li><a href="goBoard" class="button next scrolly">게시판 바로가기</a></li>
				</ul>
				<c:if test="${!empty info}">
					<p>
						회원 목록을 확인해 보세요!<br />
					</p>
					<ul class="actions">
						<li><a href="MemberList" class="button next scrolly">회원
								목록 바로가기</a></li>
					</ul>
				</c:if>
			</div>
		</div>
		</section>

		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one" class="tiles"> <article> <span
				class="image"> <img src="images/pic01.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">HTML</a>
			</h3>
			<p>홈페이지를 만드는 기초 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic02.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">CSS</a>
			</h3>
			<p>HTML을 디자인해주는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic03.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Servlet/JSP</a>
			</h3>
			<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic04.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">JavaScript</a>
			</h3>
			<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic05.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">MVC</a>
			</h3>
			<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic06.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Web Project</a>
			</h3>
			<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
			</header> </article> </section>

			<!-- Two -->
			<section id="two">
			<div class="inner">
				<c:choose>
					<c:when test="${!empty info}">
						<header class="major">
						<h2>${info.getEmail()}온메세지확인하기</h2>
						</header>
						<p></p>
						<ul class="actions">
							<!-- Q12. 로그인 이메일 출력! -->
							<!-- ex) 00님에게 온 메시지  -->

							<!-- Q14. 메시지 전체 삭제 기능 -->
							<li><a href="" class="button next scrolly">전체삭제하기</a></li>
						</ul>
						</header>
						<!-- Q13. table형태로 나한테 온 메시지만 가져와서 보여주기 -->
						<div class="container text-left">
							<div class="row">
								<c:forEach var="message" items="${list}" varStatus="status">
									<div class="card" style="width: 18rem;">
										<div class="card-body">
											<h5 class="card-title">${message.getSendEmail()}</h5>
											<h6 class="card-subtitle mb-2 text-body-secondary">${message.getReceiveEmail()}</h6>
											<p class="card-text">${message.getMessage()}</p>
										</div>
									</div>
								</c:forEach>
									<div class="card" style="width: 18rem;">
										<div class="card-body">
											<h5 class="card-title">aaa</h5>
											<h6 class="card-subtitle mb-2 text-body-secondary">bbb</h6>
											<p class="card-text">${stringMessage}</p>
										</div>
									</div>
							</div>
						</div>
						<!-- Q15. 메시지 개별 삭제 기능 -->
					</c:when>
					<c:otherwise>
						<header class="major">
						<h2>나에게 온 메세지 확인하기</h2>
						</header>
						<p></p>
						<ul class="actions">
							<!-- Q12. 로그인 이메일 출력! -->
							<!-- ex) 00님에게 온 메시지  -->

							<!-- Q14. 메시지 전체 삭제 기능 -->
							<li><a href="" class="button next scrolly">전체삭제하기</a></li>
						</ul>
						<!-- Q13. table형태로 나한테 온 메시지만 가져와서 보여주기 -->
						<!-- Q15. 메시지 개별 삭제 기능 -->
						</header>
					</c:otherwise>
				</c:choose>
			</div>
			</section>
		</div>

		<!-- Contact -->
		<section id="contact">
		<div class="inner">
			<section> <!-- Q11. 메시지 보내기 기능 --> <c:choose>
				<c:when test="${!empty info}">
					<form action="MessageService" method="POST">
						<div class="field half first">
							<label for="name">Name</label> <input type="text" id="name"
								name="sendEmail" placeholder="${info.getEmail()}"
								value="${info.getEmail()}" readonly />
						</div>
						<div class="field half">
							<label for="email">Email</label> <input type="text" id="email"
								name="receiveEmail" placeholder="받는 사람 이메일" />
						</div>

						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6"></textarea>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message"
								class="special" /></li>
							<li><input type="reset" value="Clear" /></li>
						</ul>
					</form>
				</c:when>
				<c:otherwise>
					<form action="#" method="POST">
						<div class="field half first">
							<label for="name">Name</label> <input type="text" id="name"
								name="sendEmail" placeholder="보내는 사람 이름" disabled="disabled" />
						</div>
						<div class="field half">
							<label for="email">Email</label> <input type="text" id="email"
								name="receiveEmail" placeholder="받는 사람 이메일" disabled="disabled" />
						</div>

						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" disabled="disabled"
								rows="6"></textarea>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message"
								class="special" disabled="disabled" /></li>
							<li><input type="reset" value="Clear" /></li>
						</ul>
					</form>
				</c:otherwise>
			</c:choose> </section>

			<section class="split"> <section>
			<div class="contact-method">
				<span class="icon alt fa-envelope"></span>
				<h3>Email</h3>
				<!-- Q5. 로그인 한 사용자의 이메일을 출력 -->
				<c:choose>
					<c:when test="${!empty info}">
						<span>${info.getEmail()}</span>
					</c:when>
					<c:otherwise>
						<a href="#"></a>
					</c:otherwise>
				</c:choose>
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-phone"></span>
				<h3>Phone</h3>
				<!-- Q5. 로그인 한 사용자의 전화번호를 출력 -->
				<c:choose>
					<c:when test="${!empty info}">
						<span>${info.getPhone()}</span>
					</c:when>
					<c:otherwise>
						<a href="#"></a>
					</c:otherwise>
				</c:choose>
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-home"></span>
				<h3>Address</h3>
				<!-- Q5. 로그인 한 사용자의 집주소를 출력 -->
				<c:choose>
					<c:when test="${!empty info}">
						<span>${info.getAddress()}</span>
					</c:when>
					<c:otherwise>
						<a href="#"></a>
					</c:otherwise>
				</c:choose>
			</div>
			</section> </section>
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		// 이메일 실시간 체크
		function printEmail() {
			// 이메일 입력창, 이메일 입력조건 불만족 시 하단에 표시되는 경고 텍스트 변수에 할당
			const email = document.getElementById('loginEmail');
			const email_check = document.getElementById('loginEmail_check');

			// 입력창의 값이 이메일 형태와 맞지 않게 입력된 경우
			if (!isEmail(email.value)) {
				// 이메일 입력창의 테두리 빨간색으로 변경
				//email.style.borderColor = '#EF4444';
				// 입력창 하단의 경고 텍스트 보이게
				email_check.style.visibility = 'visible';
			}
			// 이메일 형태에 적합하게 입력된 경우
			else {
				// 테두리 색 원래대로 변경
				//email.style.borderColor = '#9CA3AF';
				// 경고 텍스트 안보이게 처리
				email_check.style.visibility = 'hidden';

				// 로그인 버튼 활성화 여부를 체크하는 함수 선언
				btnCheck();
			}
		}

		//이메일 정규식 체크하는 함수
		function isEmail(asValue) {
			// 이메일 형식에 맞게 입력했는지 체크
			let regexEmail = new RegExp(
					"([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");

			return regexEmail.test(asValue); // 형식에 맞는 경우에만 true 리턴
		}

		// 이메일/비밀번호 입력값이 모두 유효할 때만 버튼 활성화
		function btnCheck() {
			// 이메일, 비밀번호, 로그인 버튼 변수 할당
			const email = document.getElementById('loginEmail').value;
			const pw = document.getElementById('loginPassword');
			const login_btn = document.getElementById('loginButton');

			// 이메일 입력조건과 비밀번호 입력조건중 하나라도 만족하지 못하는 경우 로그인 버튼 비활성화
			if (isEmail(email)) {
				login_btn.disabled = false;
			}
			// 모두 만족하는 경우 로그인 버튼 활성화
			else {
				login_btn.disabled = true;
			}
		}
		
		fetch("https://localhost:3000/user/post", {
			  method: "POST",
			  headers: {
			    "Content-Type": "application/json",
			  },
			  body: JSON.stringify({
			    id: "asd123",
			    description: "hello world",
			  }),
			}).then((response) => console.log(response));
	</script>
</body>
</html>
