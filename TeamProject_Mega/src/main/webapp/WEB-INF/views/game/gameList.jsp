<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/teamproject/resources/js/httpRequest.js"></script>
<script>
	function del(f) {
		let idx = f.idx.value;
		let url = "gameDelete.do";
		let param = "idx=" + idx;
		sendRequest(url, param, callback, "POST");
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			if (res == "del") {
				alert("삭제 성공");
				location.href = "gameList.do";
				return;
			}
		}
	}

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
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  table,
  th,
  td {
    border: 1px solid #ddd;
  }

  th,
  td {
    padding: 12px;
    text-align: left;
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
  @media (max-width: 600px) {
    table {
      font-size: 14px;
    }
  }
</style>


</head>
<body>
	<div>
		<a href="gameInsertForm.do">게임 등록 페이지</a>
	</div>
	<div>


		<form>
			<table border="1">
				<tr>
					<td><select name="g_select">
							<option value="game_genre">장르</option>
							<option value="game_platforms">플렛폼</option>
							<option value="game_developer">제작사</option>
							<option value="game_publisher">배급사</option>
					</select> <input type="button" value="조건 검색"
						onclick="selectSearch(this.form)"> <input type="button" value="검색초기화" onclick="location.href='gameTitleSearch.do'"></td>
					<td>게임이름</td>
					<td><input name="title"> <input type="button"
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
		<c:set var="i" value="0" />
		<c:set var="j" value="3" />
		<table border="1">
			<c:if test="${empty list}">
				<th>검색 결과 없음</th>
			</c:if>
			<c:forEach var="l" items="${list}">
				<c:if test="${i%j == 0 }">
					<tr>
				</c:if>
				<td><a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a></td>
				<td><input type="hidden" name="idx" value="${l.game_idx}"><input
					type="button" value="삭제" onclick="del(this.form)"></td>
				<c:if test="${i%j == j-1 }">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1 }" />
			</c:forEach>
			<tr>
				<c:if test="${not empty list}">
					<td colspan="9" align="center">${pageMenu}</td>
				</c:if>
			</tr>
		</table>
	</form>
</body>
</html>