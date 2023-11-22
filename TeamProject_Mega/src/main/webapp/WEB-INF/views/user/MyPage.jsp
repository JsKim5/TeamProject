<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form action="mypage.do" method="post">
			<table>
				<caption>마이페이지</caption>
				
				<tr>
					<td>이름</td>
					<td>${ login.user_name }</td>
				</tr>
				
				<tr>
					<td>가입날짜</td>
					<td>${ login.user_regdate }</td>
				</tr>
				
				<tr>
					<td>닉네임</td>
					<td>${ login.user_nickname }</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>${ login.user_email }</td>
				</tr>
				
				<tr>
					<td>프로필 사진</td>
					<td>${ login.user_image_path }</td>
				</tr>
				
				<tr>
					<td><input type="button" value="홈으로" onclick="location.href='home.do'"></td>
					<td><input type="button" value="정보 수정" onclick="location.href='modify_form.do'"></td>
					<td><input type="button" value="로그아웃" onclick="location.href='logout.do'"></td>
				</tr>
			</table>
		</form>

	</body>
</html>