<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 관리</title>

<link rel="stylesheet"
	href="/teamproject/resources/css/layout_main.css">
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script src="/teamproject/resources/js/headerScript.js"></script>
<script>
	function del(f) {
		let idx = f.game_idx.value;
		let url = "gameDelete.do";
		let param = "idx=" + idx;
		sendRequest(url, param, callback, "POST");
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			if (res == "del") {
				location.href = "gameAdminPage.do?page=${param.page}";
				return;
			} else {
				document.getElementById('errorMessage').innerText = "삭제 실패";
			}
		}
	}

	function registration(f) {
		f.action = "youtubeUrlUpdate.do";
		f.submit();
	}

	function search(f) {
		let searchTitle = f.searchTitle.value;
		location.href = "gameAdminPage.do?searchTitle=" + searchTitle;
	}
	
</script>
<style>
body {
            font-family: Arial, sans-serif;
            margin: 10px;
        }
        a {
            text-decoration: none;
            color: black;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        table {
            border-collapse: collapse;
            width: 70%;
            margin-bottom: 10px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 5px;
            text-align: left;
        }
        caption {
            font-weight: bold;
            margin-bottom: 5px;
        }
        form {
            margin-bottom: 5px;
        }
        input[type="text"], input[type="button"] {
            padding: 3px;
            margin-right: 3px;
        }
        .message {
            font-style: italic;
            color: red;
            margin-bottom: 5px;
        }
        input[type="hidden"] {
            display: none;
        }
        .main-page-form input[type="button"] {
            margin-top: 5px;
        }
        .main-list-table {
            margin-top: 10px;
        }
        .main-list-table td {
            padding: 7px;
            text-align: center;
        }
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	<!-- 헤더 부분 include -->


	<div style="text-decoration: none; font-weight: bold; ">
		<a href="gameList.do" style="text-decoration: none; color:black;">[게임 리스트로 이동]</a> &nbsp;
		<a href="gameInsertForm.do" style="text-decoration: none; color:black;">[게임 등록 페이지]</a> &nbsp;
		<a href="testPage.do" style="text-decoration: none; color:black;">[Test Page로 이동]</a> &nbsp;
		<a href="signUpMacro.do" style="text-decoration: none; color:black;">[회원가입 메크로]</a> &nbsp;
		<a href="reviewMacro.do" style="text-decoration: none; color:black;">[리뷰 메크로]</a> &nbsp;
		<a href="userScoreAllUpdate.do" style="text-decoration: none; color:black;">[userScoreAllUpdate]</a> &nbsp;
		
	</div>
	
	<hr><br><br>
	
	<form>
		<input type="text" name="searchTitle" placeholder="게임 제목 검색">
		<input type="button" value="검색" onclick="search(this.form)">
	</form>
	<div class="message" id="errorMessage"></div>
	<table border="1">
		<caption>게임 관리 페이지</caption>
		<tr>
			<th>idx</th>
			<th>name</th>
			<th>release date</th>
			<th>delete</th>
			<th>youtube url update</th>
		</tr>
		<c:forEach var="l" items="${list}">
			<form>
				<input type="hidden" name="game_idx" value="${l.game_idx}">
				<input type="hidden" name="game_name" value="${l.game_name}">
				<input type="hidden" name="page" value="${param.page}">
				<tr>
					<td>${l.game_idx}</td>
					<td>${l.game_name}</td>
					<td>${l.game_release_date}</td>
					<td><input type="button" value="삭제" onclick="del(this.form)"></td>
					<td><input name="game_youtube_url"> <input
						type="button" value="등록" onclick="registration(this.form)">
						<c:if test="${l.game_youtube_url == 'N/A'}">*URL등록 필요*</c:if></td>
				</tr>
			</form>
		</c:forEach>
		<tr>
			<td align="center" colspan="5">${pageMenu}</td>
		</tr>
	</table>
	<P><a href="youtubeAll.do">[youtubeAll]</a></P>
	<table>
		<tr>
			<th>총 게임수</th>
			<td>${total}</td>
		</tr>
	</table>

		<hr><br><br>

	<form action="mainGameInsert.do" method="POST" enctype="multipart/form-data">
	<table border="1">
	<caption>MainPage 게임 등록</caption>
		<tr>
			<td>이름</td>
			<td><input name="game_name"></td>
		</tr>
		<tr>
			<td>idx</td>
			<td><input name="game_idx"></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input name="game_image_path"></td>
		</tr>

		<tr>
			<td>행</td>
			<td><input name="main_row_idx"></td>
		</tr>
		<tr>
			<td>type</td>
			<td><input name="main_type"></td>
		</tr>
		<tr><td colspan="3"><input type="button" value="등록" onclick="submit()"></td></tr>
	</table>
	</form>

	<hr><br><br>
	
	
	<table border="1">
	<caption>MainList</caption>
		<tr><td></td><td colspan="5">게임 이름</td></tr>
		<tr><td>1행</td>
			<c:forEach var="mv" items="${mainList}">
			<c:if test="${mv.main_row_idx == 1 }">
				<td>${mv.game_name}</td>
			</c:if>
			</c:forEach>
		</tr>
		<tr><td>2행</td>
			<c:forEach var="mv" items="${mainList}">
			<c:if test="${mv.main_row_idx == 2 }">
				<td>${mv.game_name}</td>
			</c:if>
			</c:forEach>
		</tr>
		<tr><td>3행</td>
			<c:forEach var="mv" items="${mainList}">
			<c:if test="${mv.main_row_idx == 3 }">
				<td>${mv.game_name}</td>
			</c:if>
			</c:forEach>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- 푸터 부분 include -->
</body>
</html>
