<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
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
		<!-- 아이디 확인 페이지 -->
		<table>
			<c:if test="${id == null }">
				<td>아이디가 존재하지 않습니다.</td>
			</c:if>
			<c:if test="${id != null }">
				<td>${name }님의 아이디는 ${id} 입니다.</td>
			</c:if>
			
			
			<tr >
				<td colspan="2"><input type="button" value="로그인 페이지" onclick="location.href='login_form.do'">
				<input type="button" value="비밀번호 찾기" onclick="location.href='selectpw_form.do'"></td>
			</tr>
			
		</table>

	</body>
</html>