package com.smhrd.controller.board.Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.controller.Action;
import com.smhrd.model.BoardDAO;
import com.smhrd.utils.Script;

public class BoardNullPageAction implements Action{

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Script.href("없는 페이지입니다.", "/Main?type=main", response);
  }
}
