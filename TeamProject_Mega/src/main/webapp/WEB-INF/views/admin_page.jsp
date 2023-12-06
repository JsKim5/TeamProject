<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD

=======
>>>>>>> refs/heads/JoonSung
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
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

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/teamproject/resources/js/headerScript.js"></script>
<link rel="stylesheet" href="/teamproject/resources/css/layout_main.css">
<!-- styles_layout.css 파일 링크 -->

</head>
<body>


    <header>
        <h1>관리자 페이지</h1>
    </header>


	
	
	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>


    <nav>
        <a href="home.do">홈페이지가기</a>
    </nav>

    <table>
        <tr>
            <th colspan="3">게임관리</th>
        </tr>
        <tr>
            <td><a href="gameList.do">게임 리스트</a></td>
            <td><a href="gameInsertForm.do">게임 등록</a></td>
            <td><a href="gameAdminPage.do">게임 관리 페이지</a></td>
        </tr>
        <tr>
            <th colspan="3">리뷰관리</th>
        </tr>
        <tr>
            <td colspan="3"><a href="review_AL.do">전체리뷰</a></td>
        </tr>
    </table>


    <footer>
        <p>&copy; 2023 TeamProject</p>
    </footer>

</body>
</html>