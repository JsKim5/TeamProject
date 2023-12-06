<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

<script>
	function send(f){
		alert("글 등록을 하시겠습니까?")
		f.action = "gameboard_write.do";
		f.submit();
	
	}
	
	
	/* function send(f){
		let title = f.title.value.trim();
		let user_id =f.user_id.trim();
		let content=f.content.value.trim();
		let pwd = f.value.trim();
		
		//경고창 및 유효성체크
		if(title == ''){
			alert("제목은 필수입니다");
			return;
		}
		f.submit(); 
		
	}*/
</script>
</head>
<body>
	<form method="POST" enctype="multipart/form-data">
	<input type="hidden" name="user_id" value="${login.user_id}">
	<table width="690" border="1">
		<caption>게시판 글쓰기</caption>
		
		
		<!-- 글쓴이 유저아이디 자동입력 -->
		<tr>
			<td>닉네임</td>
			<td>${login.user_nickname} (${login.user_id})</td>
		</tr>
		
		
		<tr>
			<td align="center">글 종류</td>
			<td>
			<select name="game_name" value="게임게시판종류">                   
				<option value="all">종합커뮤니티</option>
				<option value="lol">리그오브레전드</option>
				<option value="battleground">배틀그라운드</option>
				<option value="overwatch">오버워치</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<td>제목</td>
			<td><input name="title" size="10" maxlength="15"></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="10" cols="150"></textarea></td>
		</tr>
		
		<tr>
			<td>사진첨부</td>
			
			<td>사진<input type="file" name="photo"></td>
			
		</tr>
		
		
		<tr>
			<td colspan ="2"><input type="button" value="글 등록" onclick="send(this.form)">
			<!-- <a href="b.gameboard_list.jsp"></a> -->
			<input type="button" value="글 목록" onclick="location.href='list.do'" ></td>
		</tr>
		
		
		
	</table>
</form>


</body>
</html>