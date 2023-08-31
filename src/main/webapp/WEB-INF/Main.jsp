<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MessageDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
session.getAttribute("memberInfo");
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
<link rel="stylesheet" href="./assets/css/main.css" />
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
		<%@ include file="/WEB-INF/includePage/header.jsp"%>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major"> <c:choose>
				<c:when test="${!empty memberInfo}">
					<!-- Q4. 로그인 후 로그인한 사용자의 아이디로 바꾸기 -->
					<!-- ex) 00님 환영합니다.  -->
					<h1>${memberInfo.getEmail()}님반갑습니다.</h1>
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
					<li><a href="Board/List" class="button next scrolly">게시판
							바로가기</a></li>
				</ul>
				<c:if test="${!empty member}">
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
					<c:when test="${!empty memberInfo}">
						<header class="major">
						<h2>${memberInfo.getEmail()} 온메세지확인하기</h2>
						</header>
						<p></p>
						<ul class="actions">
							<!-- Q12. 로그인 이메일 출력! -->
							<!-- ex) 00님에게 온 메시지  -->

							<!-- Q14. 메시지 전체 삭제 기능 -->
							<li><a href="" class="button next scrolly">전체삭제하기</a></li>
						</ul>
						<div data-bs-spy="scroll" data-bs-root-margin="0px 0px -40%"
							data-bs-smooth-scroll="true"
							class="scrollspy-example bg-body-tertiary p-3 rounded-2"
							tabindex="0">
							<div id="messageArea" class="d-flex flex-column mb-3"></div>
						</div>
						</header>
						<!-- Q13. table형태로 나한테 온 메시지만 가져와서 보여주기 -->
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
				<c:when test="${!empty memberInfo}">
					<form action="MessageService" method="POST">
						<div class="field half first">
							<label for="name">Name</label> <input type="text" id="name"
								name="sendEmail" placeholder="${memberInfo.getEmail()}"
								value="${memberInfo.getEmail()}" readonly />
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
					<c:when test="${!empty memberInfo}">
						<span>${memberInfo.getEmail()}</span>
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
					<c:when test="${!empty memberInfo}">
						<span>${memberInfo.getPhone()}</span>
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
					<c:when test="${!empty memberInfo}">
						<span>${memberInfo.getAddress()}</span>
					</c:when>
					<c:otherwise>
						<a href="#"></a>
					</c:otherwise>
				</c:choose>
			</div>
			</section> </section>
		</div>
		</section>

		<%@ include file="/WEB-INF/includePage/footer.jsp"%>



		<script>
			
		let loadMessage = () => fetch("Message/Load", {
			  method: "GET",
			  headers: {
			    "Content-Type": "application/json",
			  }
			})
			.then((response) => response.json())
			.then((json) => {
				let msgArea = document.getElementById('messageArea')
				let html = ''
				json.forEach(element => {
html += '<div class="d-inline-flex p-2">'
					html += '<div class="card" style="width: 100%;">'
  					html += 	'<div class="card-body">'  	    			
    				html += 		'<h5 class="card-title" style="display:inline">' + element.sendEmail + '</h5>'
   html += '<p class="card-text">' + element.message + '</p>'
   html += '<p class="card-text"><small class="text-body-secondary">' + element.m_date + '</small></p>'
		html +=   '<button type="button" class="btn btn-dark" id="btn' + element.num + '"value="'+ element.num +'" onclick="deleteValue(this)">DELETE</button>'
 html +=  '</div>'
 html +=  '</div>'
html += '</div>'
				})
				msgArea.innerHTML = html
			});		

		loadMessage()

		let deleteValue = async function (btn){
			await deleteMessage(btn.value)
			loadMessage()
		}

		async function deleteMessage(num){
			await fetch("Message/Delete?num=" + num, {
				method: "GET"
			  })
			  .then((response) => {
				alert('삭제 완료하였습니다.')
			});
		}

	</script>
</body>
</html>
