<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			.user_img {
				width: 200px;
				height: 200px;
			}
		</style>
		
		<style>
		  body {
		    font-family: 'Arial', sans-serif;
		    background-color: #f2f2f2;
		    margin: 0;
		    padding: 0;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		  }
		
		  form {
		    background-color: #ffffff;
		    border-radius: 10px;
		    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		    padding: 20px;
		    width: 500px;
		  }
		
		  table {
		    width: 100%;
		  }
		
		  th, td {
		    padding: 10px;
		    border-bottom: 1px solid #ddd;
		    text-align: left;
		  }
		
		  caption {
		    font-size: 1.2em;
		    font-weight: bold;
		    margin-bottom: 10px;
		  }
		
		  img.user_img {
		    max-width: 100%;
		    border-radius: 50%;
		    object-fit: cover; /* 이미지가 원의 영역을 채우도록 설정 */
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
			 background-color: #45a049;
			}
		  
		  input[type="button"]:last-child {
		    margin-right: 0;
		    margin-left: 5px;
		  }
		  
		</style>
	</head>
	
	<body>
		<form method="post" >
			<table>
				<caption>마이페이지</caption>
				
				<tr>
					<td align="center">이름</td>
					<td>${ login.user_name }</td>
				</tr>
				
				<tr>
					<td align="center">가입날짜</td>
					<td>${ login.user_regdate }</td>
				</tr>
				
				<tr>
					<td align="center" >닉네임</td>
					<td>${ login.user_nickname }</td>
				</tr>
				
				<tr>
					<td align="center">이메일</td>
					<td>${ login.user_email }@${ login.user_email2 }</td>
				</tr>
				
				<tr>
					<td align="center">프로필 사진</td>
					<c:if test="${login.user_image_path != null }">
						<td><img class ="user_img" src = "/teamproject/resources/user_img/${ login.user_image_path }"></td>
					</c:if>
					<c:if test="${login.user_image_path == null }">
						<td><img class = "user_img" src="/teamproject/resources/user_img/no_file"></td>
					</c:if>
				</tr>
		</table>
		<table>	
				<tr>
					<td><input type="button" value="홈으로" onclick="location.href='home.do'"></td>
					<td><input type="button" value="정보 수정" onclick="location.href='modify_form.do'"></td>
					<td><input type="button" value="로그아웃" onclick="location.href='logout.do'"></td>
					<td><input type="button" value="회원탈퇴" onclick="location.href='delete_form.do'"></td>
				</tr>
		</table>		
		</form>

	</body>
</html>