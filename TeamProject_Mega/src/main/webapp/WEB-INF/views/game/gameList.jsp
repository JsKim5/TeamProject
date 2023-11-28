<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/teamproject/resources/css/styles_layout.css">
<link rel="stylesheet"
	href="/teamproject/resources/css/styles_table.css">
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

table {
    width: 100%;
}

table td {
    text-align: left;
    width: 20%;
}

a {
	text-decoration: none;
	color : black;
}
/* 버튼 */
button,
input[type="button"] {
    padding: 5px 5px;
    border: none;
    border-radius: 5px;
    background-color: #f0f0f0;
    color: black;
    font-size: 15px;
    font-weight : bold;
    cursor: pointer;
}

/* 호버 효과 */
button:hover,
input[type="button"]:hover {
    background-color: #464A52;
}

/* 클릭 효과 */
button:active,
input[type="button"]:active {
    background-color: #3e8e41;
}
.custom-image {
	width: 88px;
	height: 132px;
	border-radius: 10px;
	border: 2px solid #000;
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

.searchText {
	font-size: 24px;
	font-weight: bold;
	padding: 0px; /* 패딩을 10px로 지정 */
	margin: 0px; /* 마진을 5px로 지정 */
}

td.selectRes {
	text-align: left;
}
td.gameView{
	border-radius: 15px;
	background-color: #f0f0f0;
	font-weight: bold;
}
td.pageMenu{
	font-weight: bold;
	text-align: center;
}

</style>



</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- 헤더 부분 include -->
	<%@ include file="/WEB-INF/views/layout/sidebar.jsp"%>
	<!-- 사이드(좌측) 부분 include -->
	<div>


		<form>
			<table>
				<tr>
					<td><select name="g_select"
						style="width: 150px; height: 30px; font-size: 15px;">
							<option value="game_genre">장르</option>
							<option value="game_platforms">플렛폼</option>
							<option value="game_developer">제작사</option>
							<option value="game_publisher">배급사</option>
					</select> <input type="button" value="조건 검색"
						onclick="selectSearch(this.form)"> <input type="button"
						value="검색초기화" onclick="location.href='gameTitleSearch.do'"></td>
					<td>게임이름 <input name="title"
						style="width: 150px; height: 15px; font-size: 14px;"> <input
						type="button" value="검색" onclick="titleSearch(this.form)"></td>
				</tr>
				<tr>
					<c:if test="${not empty selectOption}">
						<th align="left" colspan="4">&nbsp;&nbsp;${selectOption}</th>
					</c:if>
					<c:if test="${not empty param.searchTitle}">
						<th align="left" colspan="4">검색어 : ${param.searchTitle}</th>
					</c:if>
				</tr>
				<tr>
					<td colspan="2" class="selectRes"><c:if
							test="${not empty selectList}">
							<c:forEach items="${selectList}" var="s" varStatus="loop">
								<c:forEach var="num" items="${indexNumber}">
									<c:if test="${loop.index == num}">
										<br>
										<span class="searchText"><c:out
												value="${fn:toUpperCase(fn:substring(s, 0, 1))}" /></span><br>
									</c:if>
								</c:forEach>
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
				<td class="gameView"><c:if
						test="${l.game_image_path == 'N/A' }">
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
					<td class = "pageMenu" colspan="5">${pageMenu}</td>
				</c:if>
			</tr>
		</table>
	</form>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- 푸터 부분 include -->
</body>
</html>