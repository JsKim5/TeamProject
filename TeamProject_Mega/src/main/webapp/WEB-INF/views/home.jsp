<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f7f7f7;
  }

  a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    margin-right: 10px;
  }

  a:hover {
    color: #0056b3;
  }

  /* Additional styles for specific links */
  a[href="gameList.do"] {
    margin-bottom: 10px; /* Add spacing between specific links */
  }

  /* For responsive design - media query for smaller screens */
  @media (max-width: 600px) {
    a {
      display: block; /* Show links in a block for smaller screens */
      margin-bottom: 10px; /* Add spacing between links */
    }
  }
</style>
<link rel="stylesheet" href="/teamproject/resources/css/styles_header_footer.css"> <!-- styles.css 파일 링크 -->
<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- 헤더 부분 include -->
  <a href="gameList.do">게임 리스트</a>
  <a href="gameAdminPage.do">게임 관리 페이지</a><br>

  <a href="review_AL.do">리뷰목록</a>
  <a href="review_list.do">리뷰목록</a><br>

  <a href="join_form.do">회원가입 페이지</a>
  <a href="login_form.do">로그인 페이지</a>
  <a href="mypage.do">마이페이지</a>
  	<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- 푸터 부분 include -->
</body>

</head>
</body>
</html>