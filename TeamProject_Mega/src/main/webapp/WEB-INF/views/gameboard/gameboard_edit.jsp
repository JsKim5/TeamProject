<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>

<script>
	function edit(f){
		f.action = "edit.do";
		f.submit();
	}
	
	function del(f){
		
		f.action = "del.do";
		f.submit();
	} 
</script>

</head>
<body>

	<form>
	<input type="hidden" name="gameboard_idx" value="${vo.gameboard_idx }">
	
	<h2>글 수정하기</h2>
	
	<table border="1">
	<!--  아이디 -->
		<tr>
			<td>아이디</td>
			<td>${vo.user_id }</td>
		</tr>
		
		<!-- 게임종류 -->
		<tr>
			<td>게임종류</td>
			<td>${vo.game_name }</td>
			
		</tr>
		
		<tr>
			<td>제목</td>
			<td><input type=text name=title value= "${vo.title }"></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td><textarea name=content>${vo.content }</textarea></td>
		
		</tr>
				
		
		<tr>
			<td colspan ="2"><input type="button" value="수정" onclick="edit(this.form)">
			
			<input type="button" value="삭제" onclick="del(this.form)">
			</td>
		</tr>
	</table>
</form>

	
</body>
</html>