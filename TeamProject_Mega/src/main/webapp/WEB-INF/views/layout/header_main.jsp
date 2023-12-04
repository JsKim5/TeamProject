<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<div id="header">
		<div id="menu-container">
			<div class="menu-item">
				<span>게임</span>
				<div class="submenu">
					<a href="#">게임탐색</a>

				</div>
			</div>
			<div class="menu-item">
				<span>게시판</span>
				<div class="submenu">
					<a href="#">자유게시판</a> <a href="#">유저토론</a>
				</div>
			</div>
		</div>

		<div id="button-container">
		<c:if test="${login  == null}">
			<button id="register-btn" onclick="openPopup()">Register</button>
		</c:if>
		<c:if test="${login  != null}">
			<button id="mypage-btn" onclick="location.href='mypage.do'">Mypage</button>&nbsp ${login.user_nickname} &nbsp
			<img style="width: 40px; height: 40px; border-radius:50%; object-fit:cover;" src = "/teamproject/resources/user_img/${ login.user_image_path }">
		</c:if>
		
	</div>
</div>

	<!-- 로그인 팝업 창 -->
	<div id="register-popup" class="popup">
		<h2>로그인</h2>
		<form action="login.do" method="post" class="login-form">
			<table class="login-table">
				<tr>
					<td class="login-td"><label for="user_id">아이디</label></td>
					<td class="login-td"><input type="text" id="user_id"
						name="user_id" class="login-input" required></td>
				</tr>
				<tr>
					<td class="login-td"><label for="user_pwd">비밀번호</label></td>
					<td class="login-td"><input type="password" id="user_pwd"
						name="user_pwd" class="login-input" required></td>
				</tr>
				<tr>
					<td class="login-td" colspan="2"><input type="button"
						value="로그인" onclick="send(this.form);" class="login-button">
						<input type="button" value="홈으로" onclick="location.href='home.do'"
						class="login-button"></td>
				</tr>
				<tr>
					<td class="login-td" colspan="2"><input type="button"
						value="아이디찾기" onclick="location.href='searchid.do'"
						class="login-button"> <input type="button" value="비밀번호찾기"
						onclick="location.href='searchpw.do'" class="login-button">
						<input type="button" value="회원가입"
						onclick="location.href='join_form.do'" class="login-button">
					</td>
				</tr>
			</table>
			<p class="login-error">${loginfail}</p>
		</form>
		<button type="button" class="close-button" onclick="closePopup()">닫기</button>
	</div>