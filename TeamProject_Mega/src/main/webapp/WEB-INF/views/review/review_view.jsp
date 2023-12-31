<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>리뷰 상세 보기</title>
  <script src="/teamproject/resources/js/httpRequest.js"></script>
  <script>
	function del(f) {
		let idx = f.idx.value;
		let game_name = f.game_name.value;
		let url = "deleteReviewAD.do";
		let param = "idx=" + idx + "&game_name=" + game_name; 
		sendRequest(url, param, callback, "POST");
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = xhr.responseText;
			if (res == "del") {
				alert("삭제 성공");
				location.href = "gameView.do?idx=${param.game_idx}";
				return;
			}
			if(res == "searchSelect"){
				alert("select성공");
				
				return;
			}
			
		}
	}	
</script>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }

    .container {
      width: 80%;
      max-width: 800px;
      margin: 50px auto;
      background-color: #ffffff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #FFFFE4;
      color: #000000;
    }

    h2 {
      margin: 0;
      padding: 20px;
      background-color: #333333;
      color: #ffffff;
    }

    p {
      padding: 15px;
      margin: 0;
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
      margin: 20px;
      float: right;
    }

    input[type="button"]:hover {
      background-color: #2478FF;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>${vo.review_title }</h2>
  <table>
    <tr>
      <th>리뷰</th>
      <td>${vo.user_review }</td>
    </tr>
    <tr>
      <th>작성자</th>
      <td>${vo.user_nickname }</td>
    </tr>
    <tr>
      <th>사용자 평점</th>
      <td>${vo.user_score }/5</td>
    </tr>
  </table>
  
  <input type="button" value="목록으로" onclick="location.href='gameView.do?idx=${param.game_idx}'">
  <c:if test="${login.user_nickname == vo.user_nickname }">
  <form>
  <input type="hidden" name="game_name" value="${vo.game_name}">
  <input type="hidden" name="idx" value="${param.idx}">
  <input type="button" value="삭제" onclick="del(this.form)"> 
  </form>
  </c:if>
</div>

</body>
</html>