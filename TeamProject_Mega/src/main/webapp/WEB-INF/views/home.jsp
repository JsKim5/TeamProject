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

<body>
  <a href="gameList.do">게임 리스트</a>
  <a href="gameInsertForm.do">게임 등록</a><br>

  <a href="review_AL.do">리뷰목록</a>

  <a href="join_form.do">회원가입 페이지</a>
  <a href="login_form.do">로그인 페이지</a>
  <a href="mypage.do">마이페이지</a>
</body>

</head>
</body>
</html>