package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.board.Action.BoardArticleCreateAction;
import com.smhrd.controller.board.Action.BoardArticleDeleteAction;
import com.smhrd.controller.board.Action.BoardArticleReadAction;
import com.smhrd.controller.board.Action.BoardArticleUpdateAction;
import com.smhrd.controller.board.Action.BoardListReadAction;
import com.smhrd.controller.board.Action.BoardNullPageAction;

@WebServlet("/Board")
public class BoardController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doProcess(request, response);
  }

  protected void doProcess(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String cmd = request.getParameter("action");
    Action action = router(cmd, response);
    action.execute(request, response);
  }

  public Action router(String cmd, HttpServletResponse response) {
    if (cmd.equals("create")) {
      return new BoardArticleCreateAction();
    }
    if (cmd.equals("read")) {
      return new BoardArticleReadAction();
    }
    if (cmd.equals("readList")) {
      return new BoardListReadAction();
    }
    if (cmd.equals("update")) {
      return new BoardArticleUpdateAction();
    }
    if (cmd.equals("delete")) {
      return new BoardArticleDeleteAction();
    }
    return new BoardNullPageAction();
  }
}
