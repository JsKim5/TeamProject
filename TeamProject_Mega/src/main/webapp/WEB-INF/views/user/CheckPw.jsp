<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>회원 정보 확인</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e6e6e6;
            margin: 20px;
        }
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            color: #333;
        }
        .message {
            font-size: 18px;
            color: #d9534f;
            text-align: center;
            margin-top: 20px;
        }
        input[type="button"] {
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
	</head>
	
	<body>
		<!-- 비밀번호 확인 페이지 -->
		<table>
			<!-- 일치하는 비밀번호가 없을때 표시 -->
			<c:if test="${pw == null }">
				<td>등록된 계정이 존재하지 않습니다</td>
			</c:if>
			<c:if test="${pw != null }">
				<td>비밀번호는 ${pw }입니다<br>로그인 후 비밀번호를 변경해주세요<td>
			</c:if>
			
			<tr>
				<td><input type="button" value="로그인 페이지" onclick="location.href='login_form.do'">
				<input type="button" value="홈으로" onclick="location.href='home.do'"></td>
			</tr>
			
		</table>
	</body>
</html>