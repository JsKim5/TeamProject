<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div id="header">
		<div id="menu-container">
			<div class="menu-item">
				<span>게임</span>
				<div class="submenu">
					<a onclick="location.href='gameList.do'">게임탐색</a>

				</div>
			</div>
			<div class="menu-item">
				<span>게시판</span>
				<div class="submenu">
					<a href="list.do">자유게시판</a> <a href="#">유저토론</a>
				</div>
			</div>
			<div class="menu-item">
		<c:if test="${login != null && login.user_nickname == 'admin' }">
			<span>관리자페이지</span>
			<div class="submenu">
			<a onclick="location.href='admin_page.do'">전체관리</a>
			</div>
		</c:if>
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

		<!-- 검색 팝업 창 -->
		<div id="search-popup" class="popup">
			<h2>검색</h2>
			<span id="close-popup" onclick="closeSearchPopup()">닫기</span>
			<input type="text" id="popup-search-input" placeholder="Search...">
			<button id="search-btn" onclick="search()">검색</button>
		</div>
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
					<td class="login-td" colspan="2">
						<input type="button" value="로그인" onclick="send(this.form);" class="login-button">
						<input type="button" value="홈으로" onclick="location.href='home.do'" class="login-button">
					</td>
				</tr>
				<tr>
					<c:if test="${login == null }">
						<td class="login-td" colspan="2"><input type="button" value="아이디찾기" onclick="location.href='selectid_form.do'" class="login-button">
						<input type="button" value="비밀번호찾기" onclick="location.href='searchpw_form.do'" class="login-button">
						<input type="button" value="비밀번호찾기" onclick="location.href='selectpw_form.do'" class="login-button">
						<input type="button" value="회원가입" onclick="location.href='join_form.do'" class="login-button">
						</td>
					</c:if>
				</tr>
			</table>
			<p class="login-error">${loginfail}</p>
		</form>
		<button type="button" class="close-button" onclick="closePopup()">닫기</button>
	</div>