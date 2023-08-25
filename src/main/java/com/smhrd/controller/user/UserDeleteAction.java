package com.smhrd.controller.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDeleteAction  implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RequestDispatcher dis=request.getRequestDispatcher("user/join.jsp");
      dis.forward(request, response);
      
  }
}