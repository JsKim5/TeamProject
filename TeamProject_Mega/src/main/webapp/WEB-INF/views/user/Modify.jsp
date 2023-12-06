<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		  }
		  
		  form + form {
			margin-left: 20px; /* 좌측 여백 추가 */
 			
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
		  
		  form:last-child {
		    margin-top: 266px; /* 마지막 폼(프로필 사진 변경 폼)과 이전 요소 간의 간격 조절 */
		  }
		</style>
		
		
		
		
		<script src="/teamproject/resources/js/httpRequest.js"></script>
	 
		<script>
			function send(f) {
				
				let idx = f.user_idx.value;
				let nickname = f.user_nickname.value;
				let pwd = f.user_pwd.value;
				let pwd_chk = f.user_pwd_chk.value;
				
				if( pwd != pwd_chk) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				let url= "modify.do";
				let param = "user_idx="+idx+"&user_nickname="+nickname+"&user_pwd="+pwd;
				
				sendRequest(url, param, resultFn, "post");
				
			}
			
			function resultFn() {
				if(xhr.readyState == 4 & xhr.status == 200) {
					
					let data = xhr.responseText;
					
					if(data == 'no') {
						alert("수정 실패");
						return;
					}
					
					alert("수정 완료!\n다시 로그인 해주세요");
					location.href="logout.do";
				}
			}
		</script>
		
	</head>
	
	<body>
		
		<form>
		<input type="hidden" name="user_idx" value="${login.user_idx }">
		
			<table>
				<caption>수정페이지</caption>
				
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
					<td><input name="user_nickname" value="${login.user_nickname }"></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>${login.user_email }@${login.user_email2 }</td>
				</tr>
				
				
				<tr>
					<td>비밀번호 변경</td>
					<td><input type="password" value="${login.user_pwd }" name="user_pwd"></td>
				<tr>
				
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" value="${login.user_pwd }" name="user_pwd_chk"></td>
				</tr>
				
				<tr>
					<td><input type="button" value="홈으로" onclick="location.href='home.do'"></td>
					<td><input type="button" value="수정하기" onclick="send(this.form);"></td>
					<td><input type="button" value="뒤로가기" onclick="history.go(-1);"></td>
				</tr>
			</table>
			
			
		</form>
		
		
		<form method="POST" enctype="multipart/form-data" action="modify_image.do">
			<input type="hidden" name="user_idx" value="${login.user_idx }">
			<input type="hidden" name="user_id" value="${login.user_id }">
			<input type="hidden" name="user_pwd" value="${login.user_pwd }">
				<table>
					<caption>프로필 사진 변경</caption>
					<tr>
						<td>프로필 사진</td>
						<td><input type="file" name="user_image"></td>
						<td><input type="button" value="변경하기" onclick="submit()"></td>
					</tr>
			
				</table>
			</form>
	</body>
</html>