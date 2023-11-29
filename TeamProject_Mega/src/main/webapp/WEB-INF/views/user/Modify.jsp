<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
		<script src="/teamproject/resources/js/httpRequest.js"></script>
	
		<script>
			function send(f) {
				
				let idx = f.user_idx.value;
				let nickname = f.user_nickname.value;
				let email = f.user_email.value;
				let pwd = f.user_pwd.value;
				let pwd_chk = f.user_pwd_chk.value;
				
				if( pwd != pwd_chk) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				let url= "modify.do";
				let param = "user_idx="+idx+"&user_nickname="+nickname+"&user_email="+email+"&user_pwd="+pwd;
				
				sendRequest(url, param, resultFn, "post");
				
			}
			
			function resultFn() {
				if(xhr.readyState == 4 & xhr.status == 200) {
					
					let data = xhr.responseText;
					
					if(data == 'no') {
						alert("수정 실패");
						return;
					}
					
					alert("수정 완료!");
					location.href="logout.do";
				}
			}
		</script>
		
	</head>
	
	<body>
		<!-- 비밀변호 변경시 중복될때 이미 사용중인 비밀번호 입니다 띄우기 -->
		
		<form>
		<input type="hidden" name="user_idx" value="${login.user_idx }">
		
			<table>
				<caption>수정페이지</caption>
				
				<tr>
					<td>이름</td>
					<td>${ login.user_name }</td>
					<td>
				</tr>
				
				<tr>
					<td>가입날짜</td>
					<td>${ login.user_regdate }</td>
				</tr>
				
				<tr>
					<td>닉네임</td>
					<td><input name="user_nickname" value="${login.user_nickname }"></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td><input name="user_email" value="${login.user_email }"></td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="user_pwd" <%-- value="${login.user_pwd }" --%>></td>
				<tr>
				
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="user_pwd_chk"></td>
				</tr>
				
				<tr>
					<td><input type="button" value="홈으로" onclick="location.href='home.do'"></td>
					<td><input type="button" value="수정하기" onclick="send(this.form);"></td>
					<td><input type="button" value="뒤로가기" onclick="history.go(-1);"></td>
				</tr>
			</table>
			
			
		</form>
		
		<form method="POST" enctype="multipart/form-data" action="modify_image.do">
			<input type="hidden" name="user_idx" value="${ login.user_idx }">
			<input type="hidden" name="user_id" value="${login.user_id }">
			<input type="hidden" name="user_pwd" value="${login.user_pwd }">
				<table>
					<tr>
						<td>프로필 사진</td>
						<td><input type="file" name="user_image"></td>
						<td><input type="button" value="변경하기" onclick="submit()"></td>
					</tr>
			
				</table>
			</form>
	</body>
</html>