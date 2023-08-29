package com.smhrd.controller.board.Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.user.Action;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.utils.Script;

public class BoardArticleReadAction  extends BoardDAO implements Action {
  private static final String CHARSET = "utf-8";
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        String num = request.getParameter("num");
        Board board = BoardArticleRead(num);
        if (board != null){
          request.setAttribute("board", board);
          RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/BoardDetail.jsp");
          dis.forward(request, response);
        } else {
          Script.back("글을 읽어오는데 실패하였습니다.", response);
        }
      }
}
