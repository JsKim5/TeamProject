<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game Search</title>
<link rel="stylesheet" href="/teamproject/resources/css/testCss.css">

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
</head>
<body>
    <form>
    	<div class="search-box">
        <!-- 조건검색(select) -->
		
        <select name="g_select">
        	<option selected> 검색 조건 </option>
            <option value="game_genre">장르</option>
            <option value="game_platforms">플렛폼</option>
            <option value="game_developer">제작사</option>
            <option value="game_publisher">배급사</option>
        </select>

        <div class="line-btn">
        <button class="btn btn-one" type="button" onclick="selectSearch(this.form)">선택</button>
        <button class="btn btn-one" type="button" onclick="location.href='gameTitleSearch.do'">검색초기화</button>
		</div>
        <!-- 게임이름 검색 -->
        <input type="text" name="title">
        <div class="line-btn">
        <button class="btn btn-one" type="button" onclick="titleSearch(this.form)">이름검색</button>
        </div>
        </div>
	
        <!-- 검색 조건 출력 -->
        <c:if test="${not empty selectOption}">
            <div>${selectOption}</div>
        </c:if>
        <c:if test="${not empty param.searchTitle}">
            <div>검색어: ${param.searchTitle}</div>
        </c:if>
		<br>
        <!-- 조건 버튼 출력 -->
        <div class="button-container">
        <c:if test="${not empty selectList}">
			<c:forEach items="${selectList}" var="s" varStatus="loop">	
				<c:forEach var="num" items="${indexNumber}">
					<c:if test="${loop.index == num}">
						<div class="line-btn">
						<span class="firstChar"><c:out value="${fn:toUpperCase(fn:substring(s, 0, 1))}" />
						</span>
					</c:if>
				</c:forEach>
				
				<button class="btn btn-one" type="button" onclick="location.href='gameList.do?selectCol=${selectCol}&search=${s}'">
    				${s}
				</button>
				<c:forEach var="num" items="${indexNumber}">
				<c:if test="${loop.index == num-1}">
					</div>
				</c:if>
				</c:forEach>
				
			</c:forEach>
		</c:if>
		</div>
    	</div>
    </form>

    <!-- 검색 결과 & 리스트 출력 -->
    <c:if test="${not empty list}">
    	<p>${pageMenu}</p>
    </c:if>
    
    <c:choose>
        <c:when test="${empty list}">
            <div class="no-results">검색 결과 없음</div>
        </c:when>
        <c:otherwise>
        <div class="game-info-container">
            <c:forEach var="l" items="${list}" varStatus="loop">
        <div class="game-info">
            <div>
                <c:choose>
                    <c:when test="${l.game_image_path == 'N/A' }">
                        <img src="/teamproject/resources/game_img/no_file.png" class="custom-image">
                    </c:when>
                    <c:otherwise>
                        <img src="${l.game_image_path}" class="custom-image">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="game-details">
                <a href="gameView.do?idx=${l.game_idx}">${l.game_name}</a>
                <div>Meta Score: ${l.game_meta_score}</div>
                <div>${l.game_publisher}</div>
                <div>Released On: ${l.game_release_date}</div>
            </div>
        </div>
    </c:forEach>
    </div>
            <c:if test="${not empty list}">
                <p>${pageMenu}</p>
            </c:if>
        </c:otherwise>
    </c:choose>
    
</body>
</html>
