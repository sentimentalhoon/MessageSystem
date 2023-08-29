<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Forty by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="assetsBoard/css/main.css" />
    <link rel="stylesheet" href="assetsBoard/css/board.css" />
  </head>
  <body>
    <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) -->
    <div id="board">
      <form
        method="post"
        action="multiPartServlet"
        enctype="multipart/form-data"
      >
        <table id="list">
          <tr>
            <td>제목</td>
            <td><input type="text" /></td>
          </tr>
          <tr>
            <td>작성자</td>
            <td><input type="text" /></td>
          </tr>
          <tr>
            <td colspan="2">내용</td>
          </tr>
          <tr>
            <td colspan="2">
              <input type="file" style="float: right" />
              <textarea
                name="content"
                rows="10"
                style="resize: none"
              ></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              Choose a file: <input type="file" name="multiPartServlet" />
              <input type="submit" value="Upload" />
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <input type="reset" value="초기화" />
              <input type="submit" value="작성하기" />
            </td>
          </tr>
        </table>
      </form>
    </div>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>
