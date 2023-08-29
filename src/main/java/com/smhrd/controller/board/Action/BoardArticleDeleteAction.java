package com.smhrd.controller.board.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.user.Action;
import com.smhrd.model.BoardDAO;

public class BoardArticleDeleteAction  extends BoardDAO implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      }
}
