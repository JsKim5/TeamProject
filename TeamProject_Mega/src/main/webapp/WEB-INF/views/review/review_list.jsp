<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

	<style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f2f2f2;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }

    table {
      width: 80%;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-collapse: collapse;
    }

    th, td {
      padding: 15px;
      text-align: center;
    }

    th {
      background-color: #f5f5f5;
      border-top: 1px solid #ddd;
      border-bottom: 1px solid #ddd;
    }

    tr:nth-child(1) th {
      border-top: none;
    }

    tr:nth-child(odd) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: #f0f0f0;
    }

    caption {
      font-size: 24px;
      margin: 10px 0;
    }

    .aa {
      border-right: 1px solid #ddd;
    }

    a {
      text-decoration: none;
      color: #333;
      font-weight: bold;
    }

    input[type="button"] {
      background-color: #FFFFE4;
      color: #000000;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 1em;
      transition: background-color 0.3s;
    }

    input[type="button"]:hover {
      background-color: #2478FF;
    }
    
    
  </style> 
	
</head>
<body>		

		<table>
		<caption>리뷰 목록</caption>
		
		<tr align = "center">
			<td class = "aa" width = "100">작성자</td>
			<td class = "aa" width = "300">제목</td>
			<td class = "aa" width = "100">평점</td>
			<td width = "200">작성일</td>
			<td class = "aa" width = "100">리뷰갯수</td>
		<tr>
		
		<c:forEach var = "vo" items = "${review_list }">
			<tr align = "center">
				<td></td>
				<td>
				<a href ="review_view.do?idx=${vo.review_idx }">
				${vo.review_title }
				</a>
				</td>
				<td>${vo.user_score }/5</td>
				<td>${vo.date_created }</td>
				<td>${vo.review_count }</td>
			</tr>
		</c:forEach>
		
		<tr> 
			<td colspan = "5" align = "right">
				<input type = "button" value = "리뷰작성" onclick = "location.href = 'review_write.do'">
			</td>
		</tr>
		</table>
		
		<script>
		let ${vo.review_count} = ${review_list.size()};
		</script>


</body>
</html>