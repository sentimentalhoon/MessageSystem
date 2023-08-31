<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.scrolly.min.js"></script>
<script src="/assets/js/jquery.scrollex.min.js"></script>
<script src="/assets/js/skel.min.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/js/main.js"></script>

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
</script>