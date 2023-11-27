<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/teamproject/resources/css/styles_header_footer.css"> <!-- styles.css 파일 링크 -->
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script>
	function selectSearch(f) {
		let select = f.g_select.value;
		let url = "gameSelectSearch.do";
		let param = "select=" + select;
		sendRequest(url, param, callback2, "POST");
	}

	function callback2() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			location.href = "gameList.do";
		}
	}

	function titleSearch(f) {
		if (f.title.value.trim() == "") {
			alert("게임 이름을 입력하세요");
			return;
		}
		f.action = "gameTitleSearch.do";
		f.submit();
	}
</script>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
}

/* Container styles */
.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Header styles */
header {
	text-align: center;
	margin-bottom: 20px;
}

header h1 {
	font-size: 32px;
	color: #333;
	margin: 10px 0;
}

/* Form styles */
form {
	margin-bottom: 20px;
}

table {
	
	width: 100%; /* 테이블 전체 너비 */
	max-width: 80%; /* 최대 너비 설정 */
	border-collapse: collapse;
	margin-bottom: 20px;
	overflow-x: auto; /* 가로 스크롤이 필요한 경우에만 스크롤 표시 */
}

table, th, td {
	border: 1px solid #ddd;
	width: 1500px;
}

th, td {
	padding: 12px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

/* Links */
a {
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
}

a:hover {
	color: #0056b3;
}

/* Buttons */
input[type="button"] {
	padding: 8px 16px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
	margin-right: 10px; /* Add spacing between buttons */
	margin-bottom: 10px; /* Add spacing below buttons */
	transition: background-color 0.3s ease;
}

input[type="button"]:hover {
	background-color: #0056b3;
}

/* Responsive styles */
@media ( max-width : 600px) {
	table {
		font-size: 14px;
	}
}

.custom-image {
	width: 88px;
	height: 132px;
	border-radius: 10px;
}
/* 게임 메타 스코어 스타일 */
.game-meta-score {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: bold;
}

/* 높은 점수일 때의 스타일 */
.high-score {
	background-color: #4CAF50; /* 녹색 배경색 */
	color: white; /* 흰색 폰트 */
}

/* 낮은 점수일 때의 스타일 */
.low-score {
	background-color: #f44336; /* 빨간색 배경색 */
	color: white; /* 흰색 폰트 */
}
td.gameView{
	border-radius: 15px; /* 둥근 테두리 크기 조절 */
  	background-color: #f0f0f0; /* 배경색 지정 */
}
</style>


</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- 헤더 부분 include -->
	<div>


		<form>
			<table>
				<tr>
					<td><select name="g_select" style="width: 150px; height: 30px; font-size: 14px;">
							<option value="game_genre">장르</option>
							<option value="game_platforms">플렛폼</option>
							<option value="game_developer">제작사</option>
							<option value="game_publisher">배급사</option>
					</select> <input type="button" value="조건 검색"
						onclick="selectSearch(this.form)"> <input type="button"
						value="검색초기화" onclick="location.href='gameTitleSearch.do'"></td>
					<td>게임이름
					<input name="title" style="width: 150px; height: 30px; font-size: 14px;"> <input type="button"
						value="검색" onclick="titleSearch(this.form)"></td>
				</tr>
				<tr>
					<c:if test="${not empty selectOption}">
						<th align="left" colspan="4">${selectOption}</th>
					</c:if>
					<c:if test="${not empty param.searchTitle}">
						<th align="left" colspan="4">검색어 : ${param.searchTitle}</th>
					</c:if>
				</tr>
				<tr>
					<td colspan="4"><c:if test="${not empty selectList}">
							<c:forEach items="${selectList}" var="s">
								<input type="button"
									onclick="location.href='gameList.do?selectCol=${selectCol}&search=${s}'"
									value="${s}">
							</c:forEach>
						</c:if></td>
				</tr>
			</table>
		</form>


	</div>
	<form>
		<table border="1">
			<c:if test="${empty list}">
				<th>검색 결과 없음</th>
			</c:if>
			<c:forEach var="l" items="${list}" varStatus="loop">
				<c:if test="${loop.index % 5 == 0}">
					<tr>
				</c:if>
				<td class="gameView"><c:if test="${l.game_image_path == 'N/A' }">
						<img src="/teamproject/resources/game_img/no_file.png"
							class="custom-image">
					</c:if> <c:if test="${l.game_image_path != 'N/A' }">
						<img src="${l.game_image_path}" class="custom-image">
					</c:if> <br> <a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a><br>
					<span
					class="game-meta-score 
          <c:choose>
            <c:when test="${l.game_meta_score >= 70}">
              high-score
            </c:when>
            <c:otherwise>
              low-score
            </c:otherwise>
          </c:choose>
        ">
						${l.game_meta_score} </span><br> ${l.game_publisher}</td>
				<c:if test="${loop.index % 5 == 4 || loop.last}">
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<c:if test="${not empty list}">
					<td colspan="9" align="center">${pageMenu}</td>
				</c:if>
			</tr>
		</table>
	</form>
	  <%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- 푸터 부분 include -->
</body>
</html>