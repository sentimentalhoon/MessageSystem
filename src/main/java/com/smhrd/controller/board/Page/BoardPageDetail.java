package com.smhrd.controller.board.Page;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.utils.Script;

@WebServlet("/Board/Read")
public class BoardPageDetail extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String CHARSET = "utf-8";

  public void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    BoardDAO dao = new BoardDAO();
    String num = request.getParameter("num");
    Board board = dao.BoardArticleRead(num);
    if (board != null) {
      request.setAttribute("board", board);
      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/BoardDetail.jsp");
      rd.forward(request, response);
    } else {
      Script.back("글을 읽어오는데 실패하였습니다.", response);
    }
  }
}
