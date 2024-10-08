<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<script src="/teamproject/resources/js/headerScript.js"></script>
    <link rel="stylesheet" href="/teamproject/resources/css/layout_main.css">
<style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }


        header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #ddd;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: white;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        
        a {
        	text-decoration: none;
        	color :black;
        	font-weight: bold;
        }
    </style>

</head>
<body>

	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>

	
	<table>	
		<tr> 
			<td><a href="list.do">종합게임 평가 커뮤니티</a></td>
			<td><a href="list.do?game_name=pc">PC게임</a></td>
			<td><a href="list.do?game_name=consol">콘솔게임</a></td>
			
		</tr>
	</table>

		
		<table border="1" class="main_table">

		<tr>
			<th width ="50">번호</th>
			<th width ="300">제목</th>
			<th width ="100">아이디</th>
			<th width ="80">작성일</th>
			<th width ="50">조회수</th>
			<th width ="50">추천수</th>
		</tr>
		
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

	
	<nav>
		<c:if test="${login != null }">
		<a href="gameboard_write_form.do">글쓰기</a>
		</c:if>
		<a href="home.do">홈페이지</a>
	</nav>
	
	<footer>
        <p>&copy; 2023 TeamProject</p>
    </footer>
</body>
</html>