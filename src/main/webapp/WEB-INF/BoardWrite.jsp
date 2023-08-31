<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
Member member = (Member) session.getAttribute("memberInfo");
if (member != null) {
	pageContext.setAttribute("member", member);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Forty by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../assetsBoard/css/main.css" />
    <link rel="stylesheet" href="../assetsBoard/css/board.css" />
  </head>
  <body>
    <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) -->
    <div id="board">
      <form
        method="post"
        action="/Board?action=create"
        enctype="multipart/form-data"
      >
        <table id="list">
          <tr>
            <td>제목</td>
            <td><input type="text" name="title"/></td>
          </tr>
          <tr>
            <td>작성자</td>
            <td><input type="text" name="writer" value="${member.getEmail()}" readonly/></td>
          </tr>
          <tr>
            <td colspan="2">내용</td>
          </tr>
          <tr>
            <td colspan="2">
              <input type="file" style="float: right" name="file1" />
              <textarea
                name="content"
                rows="10"
                style="resize: none"
              ></textarea>
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
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.scrolly.min.js"></script>
    <script src="../assets/js/jquery.scrollex.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <script src="../assets/js/main.js"></script>
  </body>
</html>
