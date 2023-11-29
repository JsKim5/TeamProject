<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
		
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
		      background-color: #45a049;
		    }
		</style>
		
		<script>
		function send(f) {
			let name = f.s_name.value.trim();
			let id = f.s_id.value.trin();
			
			if( name == '') {
				alert("이름을 입력하세요");
				return;
			}
			
			if( id == '' ) {
				alert("아이디를 입력하세요");
				return;
			}
		}
		
		</script>
	</head>
		
	<body>
		<!-- 비밀번호 찾기 페이지 -->
			<form action = "/TeamProject/WEB-INF/user/checkpw.jsp" method="post" name="checkpw">
					<table border="1">
						<caption>비밀번호 찾기</caption>
						
						<tr>
							<td>이름</td>
							<td><input name="s_name"></td><!-- user_name으로 해야하는지 확인 -->
						</tr>
						
						<tr>
							<td>아이디</td>
							<td><input name="s_id"></td>
						</tr>
						
						<tr>
							<td>주민번호</td>
							<td><input name="s_rrn1" maxlength="6"></td>
							<td><input name="s_rrn2" maxlength="7" type="password"></td> <!-- 뒷자리 암호화 방법 주민번호or이메일or본인인증--> 
						</tr>
						
						<tr>
							<td colspan="1" align="right">
							<input type="button" value="비밀번호 찾기" onclick="send(this.form)">
							</td>
					</table>
			</form>
	</body>
</html>