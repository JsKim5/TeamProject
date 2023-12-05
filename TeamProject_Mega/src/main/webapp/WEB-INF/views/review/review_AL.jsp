<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review List</title>
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
            text-align: left;
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
	<header>
        <h1>전체리뷰관리</h1>
    </header>
    
    <nav>
        <a href="MainPage.do">홈페이지</a>
        <a href="admin_page.do">관리자페이지</a>
   </nav>

    <div class="table-container">
        <table>
            <tr align="center">
                <th class="aa" width="50">리뷰번호</th>
                <th class="aa" width="100">게임명</th>
                <th class="aa" width="50">작성자</th>
                <th class="aa" width="300">제목</th>
                <th class="aa" width="100">별점</th>
                <th width="200">작성일</th>
            </tr>
            <c:forEach var="review_vo" items="${list}">
                <tr align="center">
                    <td>${review_vo.review_idx }</td>
                    <td>${review_vo.game_name }</td>
                    <td>${review_vo.user_nickname }</td>
                    <td><a href="review_ALview.do?idx=${review_vo.review_idx}">
                            ${review_vo.review_title} </a></td>
                    <td>${review_vo.user_score}/5</td>
                    <td>${review_vo.date_created}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="6" align="center">
                    ${pageMenu }
                </td>
            </tr>
        </table>
    </div>
    
    <footer>
        <p>&copy; 2023 TeamProject</p>
    </footer>

</body>
</html>