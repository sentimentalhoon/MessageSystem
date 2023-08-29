package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.controller.board.BoardArticleCreateAction;
import com.smhrd.controller.board.BoardArticleDeleteAction;
import com.smhrd.controller.board.BoardArticleReadAction;
import com.smhrd.controller.board.BoardArticleUpdateAction;
import com.smhrd.controller.board.BoardListReadAction;
import com.smhrd.controller.user.Action;

@WebServlet("/goBoard")
public class GoBoardController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doProcess(request, response);
  }

  protected void doProcess(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String cmd = request.getParameter("type");
    Action action = router(cmd);
    action.execute(request, response);
  }

  public Action router(String cmd) {
    if (cmd.equals("createArticle")) {
      return new BoardArticleCreateAction();
    }
    if (cmd.equals("readArticle")) {
      return new BoardArticleReadAction();
    }
    if (cmd.equals("readBoardList")) {
      return new BoardListReadAction();
    }
    if (cmd.equals("updateArticle")) {
      return new BoardArticleUpdateAction();
    }
    if (cmd.equals("deleteArticle")) {
      return new BoardArticleDeleteAction();
    }
    return null;
  }
}
