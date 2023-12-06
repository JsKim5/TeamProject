<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Game세상 게시판</title>
	
	<style>
	
		#box {
  width: 200px; /* Adjust the width as needed */
  background-color: #f1f1f1; /* Background color */
  padding: 10px;
  float:left;
}

.menu {
  list-style-type: none;
  padding: 0;
}

.menu li {
  margin-bottom: 8px;
}

.menu li a {
  text-decoration: none;
  color: #333;
  display: block;
}

.menu li a:hover {
  color: #ff0000; /* Change color on hover */
}

/* Styles for the table */
.styled-table {
  border-collapse: collapse;
  width: 750px;
  border: 1px solid #ddd; /* Border color */
  margin:0 auto;
}

.styled-table caption {
  font-weight: bold;
  margin-bottom: 10px;
}

.styled-table th,
.styled-table td {
  padding: 8px;
  text-align: left;
}

.styled-table th {
  background-color: #f1f1f1; /* Header background color */
}
		
		table {
  width: 750px;
  margin:10px auto;
  border-collapse: collapse;
  border-spacing: 0;
  font-family: Arial, sans-serif;
}

table caption {
  font-weight: bold;
  font-size: 1.2em;
  margin-bottom: 10px;
}

table th,
table td {
  border: 1px solid #dddddd;
  padding: 8px;
  text-align: center;
}

/* Header Styles */
table th {
  background-color: #f2f2f2;
  font-weight: bold;
}

/* Row Styles */
table tr:nth-child(even) {
  background-color: #f9f9f9;
}



.all{ overflow:hidden; }
.main_table{float:left;
            margin-left:10px;
            width:930px;}
            
.all_games_tr td{text-align:center;}
a{text-decoration:none;}

.write_singo td{text-align:left;
                border:0 solid black;}
	</style>

</head>
<body>

	
  
	<table class="styled-table" >
	<!-- <table width="690" border="1"> -->
		<caption>:::게임 평가 게시판:::</caption>
		
		<tr align="center" class="all_games_tr">
			<td>대표게임</td>
			<td><a href="list.do">종합게임 평가 커뮤니티</a></td>
			<td><a href="list.do?game_name=lol">리그오브레전드</a></td>
			<td><a href="list.do?game_name=battleground">배틀그라운드</a></td>
			<td><a href="list.do?game_name=overwatch">오버워치</a></td>
		</tr>
		<%-- <c:forEach var="vo" items="${list }">
		<c:forEach/> --%>
	</table>	
		
		<div class="all">
		
		
		<table>
			<tr class="write_singo">
				<td align="left">
					<input type="button" value="글쓰기" onclick="location.href='gameboard_write_form.do'"/>
					<input type="button" value="신고하기" onclick="#">
				</td>
			</tr>
		</table>
		
		
		 <div id="box">
    <ul class="menu">
      <li><a href="https://www.leagueoflegends.com/ko-kr/">LOL 홈페이지</a></li>
      <li><a href="https://pubg.com/ko/main">배틀그라운드 홈페이지</a></li>
      <li><a href="https://overwatch.blizzard.com/ko-kr/">오버워치 홈페이지</a></li>
    </ul>
  </div>
		
		<table border="1" class="main_table">
		<tr align="center">
			<td width ="50">번호</td>
			<td width ="300">제목</td>
			<td width ="100">아이디</td>
			<td width ="80">작성일</td>
			<td width ="50">조회수</td>
			<td width ="50">추천수</td>
		<tr/>
		<tr>
				
			</tr>
		<c:forEach var="vo" items="${list }">
		
			<tr>
				<td>${vo.gameboard_idx }</td>
				<td>
					<a href="detail.do?idx=${vo.gameboard_idx }">
						${vo.title }
					</a>
				</td>
				
					<!-- 아이디  -->
					<td>${vo.user_id }</td>
					
					<!-- 작성일 -->
					<td>${vo.regdate }</td>
					
					<!-- 조회수 -->
					<td>${vo.readhit }</td>
					
					<!-- 추천수  -->
					<td>${vo.user_goody}</td>

				
			</tr>
			
		
		</c:forEach>
		<tr>
			<td colspan="6" align="center">
				${pageMenu }		
			</td>		
		</tr>
		
		
	</table>
	</div>
</body>
</html>