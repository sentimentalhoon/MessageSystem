package com.smhrd.controller.board.Page;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Action;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.utils.Script;

@WebServlet("/Board/List")
public class BoardPageList extends HttpServlet {
  /**
  * 
  */
  private static final long serialVersionUID = 1L;
  private static final String CHARSET = "utf-8";

  public void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    String page = request.getParameter("page");

    BoardDAO dao = new BoardDAO();
    ArrayList<Board> boardList = null;

    try {
      boardList = dao.BoardListRead(page);
      request.setAttribute("boardList", boardList);
      RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/BoardMain.jsp");
      dis.forward(request, response);
    } catch (Exception e) {
      e.printStackTrace();
      RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/BoardMain.jsp");
      dis.forward(request, response);
    }
  }
}
