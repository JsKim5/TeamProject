<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title with=200>${vo.title }</title>
<link rel="stylesheet" href="/teamproject/resources/css/gameBoardStyle.css">
<script>

		function del(f){
			f.action = "del.do";
			
			let c_pwd = document.getElementById("c_pwd").value;
			if(!confirm("삭제 하시겠습니까?")){
				return;
			}
			if(c_pwd != ${vo.pwd}){
				alert("비밀번호가 다릅니다")
				return;
			}
			f.submit();
		} 
	</script>


</head>
<body>
<!--  -->
	
	<h1></h1>
	<table width="400" border="1">
		<tr>
			<td align="center" width="150">제목</td>
			<td>${vo.title}</td>
		</tr>
dsk
		<tr>
			<td align="center" width="150">닉네임</td>
			<td>${vo.user_id }</td>
		</tr>

		<tr>
			<td align="center" width="150">등록일</td>
			<td>${vo.regdate }</td>
		</tr>

		<tr>
			<td align="center" width="150">내용</td>
			<td>${vo.content }
				<c:if test="${vo.filename_image != 'no_file'}">
				<img src="resources/upload/${vo.filename_image }" width="300">
				</c:if></td>
			
			<%-- <td><img src="resources/upload/${vo.filename_image }" width="300"></td> --%>
			
		</tr>

		<tr>
			<td>조회수</td>
			<td>${vo.readhit }</td>

		</tr>



		<tr>
			<td align="center" colspan="2">
				<c:if test="${login.user_id != null }">
					<input type="button" value="댓글쓰기"
						onclick="location.href='reply_form.do?idx=${vo.gameboard_idx}'">
				</c:if>
				<c:if test="${vo.user_id == login.user_id}">
				<input type="button" value="수정"
				onclick="location.href='edit_form.do?idx=${vo.gameboard_idx}'" /> <input
				type="button" value="삭제"
				onclick="location.href='del.do?gameboard_idx=${vo.gameboard_idx}'" />
				</c:if>
				<input type="button" value="목록" onclick="location.href='list.do'" />

			</td>
		</tr>

	</table>

	<table width="400" border="1">

		<caption>댓글</caption>





		<c:forEach var="r" items="${list}">
			
				
					<tr>
						<!-- 아이디  -->
						<td>${r.user_id }</td>
						<!-- 댓글 -->
						<td with 800>${r.content}</td>
						<!-- 작성일 -->
						<td>${r.regdate }</td>
						<!-- 조회수  -->
						<td>${r.readhit }</td>
					</tr>
				
			
		</c:forEach>


	</table>



</body>
</html>