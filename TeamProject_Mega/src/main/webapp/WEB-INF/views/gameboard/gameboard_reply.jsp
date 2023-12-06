<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글쓰기</title>

<script>

	function send(f){
		
		let title = f.title.value.trim();
		let content=f.content.value.trim();
		//let pwd = f.pwd.value.trim();
		
		
		//경고창 및 유효성체크
		if(title == ''){
			alert("제목은 필수입니다");
			return;
		}
		f.action = "reply.do";
		f.submit();
		
	}
</script>
</head>
<body>
	<form method="get">
	
	<input type="hidden" name="idx" value="${param.idx }">
	<input type="hidden" name="user_id" value="test">
	<input type="hidden" name="game_name" value="test">
	
	<table width="530" border="1">
		<caption>:::댓글쓰기:::</caption>
		
		
		<!-- 글쓴이 유저아이디 자동입력 -->
		<tr>
			<td>유저ID</td>
			<td> 수정</td>
		</tr>
		
		
		
		<tr>
			<td>제목</td>
			<td><input name="title" size="10" maxlength="15"></td>
		</tr>
		
		<tr>
			<td>댓글</td>
			<td><textarea name="content" rows="10" cols="150"></textarea></td>
		</tr>
		
		<tr>
			<td colspan ="2"><input type="button" value="댓글쓰기" onclick="send(this.form)">
			<!-- <a href="b.gameboard_list.jsp"></a> -->
			<input type="button" value="이전으로" onclick="location.href='list.do'" ></td>
		</tr>
		
		
		
	</table>
</form>


</body>
</html>