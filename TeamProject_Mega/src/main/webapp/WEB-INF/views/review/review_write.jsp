<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>제목과 글 작성 및 별점 평가</title>

  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
    }

    form {
      width: 400px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      box-sizing: border-box;
    }

    label {
      font-weight: bold;
      margin-bottom: 8px;
      display: block;
    }

    input[type="text"],
    textarea {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      box-sizing: border-box;
    }

    .rating {
      font-size: 1.5em;
      margin-bottom: 16px;
    }

    .star {
      cursor: pointer;
      font-size: 2em;
      color: #ccc; /* 비활성화된 별의 색상 */
    }

    .star.active {
      color: #2478FF; /* 활성화된 별의 색상 */
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
  let currentRating = 0;

  function rate(stars) {
    currentRating = stars;
    highlightStars(stars);
    console.log('현재 별점:', currentRating);
  }

  function highlightStars(stars) {
    const starElements = document.getElementsByClassName('star');

    for (let i = 0; i < starElements.length; i++) {
      const starValue = i + 1;

      if (starValue <= stars) {
        starElements[i].style.color = '#2478FF'; // 활성화된 별의 색상
      } else {
        starElements[i].style.color = '#ccc'; // 비활성화된 별의 색상
      }
    }
  }
</script> 
</head>
<body>

  <form method="post">
    <input type="hidden" name="user_score">
	<input type="hidden" value="${param.game_name }" name ="game_name">
	<input type="hidden" value="${param.idx }" name = "game_idx">
    <label for="title">제목</label>
    <input type="text" name="review_title">

    <label for="content">리뷰</label>
    <textarea rows="10" name="user_review" style="resize:none;"></textarea>

    <div class="rating">
      <span class="star" onclick="rate(1)">&#9734;</span>
      <span class="star" onclick="rate(2)">&#9734;</span>
      <span class="star" onclick="rate(3)">&#9734;</span>
      <span class="star" onclick="rate(4)">&#9734;</span>
      <span class="star" onclick="rate(5)">&#9734;</span>
    </div>

    <div>
      <input type="button" value="글쓰기" onclick="send_check(this.form);">
      <input type="button" value="이전으로" onclick="location.href='gameView.do?idx=${param.idx}'">
    </div>
  </form>

  <script>
    function send_check(f) { 
      let review_title = f.review_title.value.trim();
      let user_review = f.user_review.value.trim();
      f.user_score.value = currentRating;
      let user_score = currentRating;

      if (review_title == '') {
        alert("제목을 입력하세요");
        return;
      }

      if (user_review == '') {
        alert("내용은 한글자 이상 입력하세요");
        return;
      }

      if (currentRating == '') {
        alert("평점을 1점 이상 선택해주세요");
        return;
      }

      f.action = "review_insert.do";
      f.submit();
    }
  </script>

</body>
</html>
