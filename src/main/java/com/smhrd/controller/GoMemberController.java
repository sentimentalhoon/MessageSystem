package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.controller.user.Action;
import com.smhrd.controller.user.UserCreateAction;
import com.smhrd.controller.user.UserDeleteAction;
import com.smhrd.controller.user.UserLogoutAction;
import com.smhrd.controller.user.UserReadAction;
import com.smhrd.controller.user.UserUpdateAction;

/**
 * Servlet implementation class GoMemberController
 */
@WebServlet("/Member")
public class GoMemberController extends HttpServlet {
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
    if (cmd.equals("create")) {
      return new UserCreateAction();
    }
    if (cmd.equals("read")) {
      return new UserReadAction();
    }
    if (cmd.equals("logout")) {
      return new UserLogoutAction();
    }
    if (cmd.equals("update")) {
      return new UserUpdateAction();
    }
    if (cmd.equals("delete")) {
      return new UserDeleteAction();
    }
    if (cmd.equals("logout")) {
      return new UserLogoutAction();
    }
    return null;
  }
}
