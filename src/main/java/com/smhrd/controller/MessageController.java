package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import com.smhrd.controller.Main.Page.PageMainAction;

/**
 * Servlet implementation class MessageController
 */
@WebServlet("/Message")
public class MessageController extends HttpServlet {
  private static final long serialVersionUID = 1L;


  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doProcess(request, response);
  }

  protected void doProcess(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String cmd = null;
    try {
      cmd = request.getParameter("type");
      Action action = router(cmd);
      action.execute(request, response);
    } catch (Exception e) {
      Action action = router(cmd);
      action.execute(request, response);
    }
  }

  public Action router(String cmd) {
    if(StringUtils.isEmpty(cmd)) {
      return new PageMainAction();
    } else {
      if (cmd.equals("send")) {
        return new PageMainAction();
      }      
      if (cmd.equals("delete")) {
        return new PageMainAction();
      }    
      if (cmd.equals("receive")) {
        return new PageMainAction();
      }    
    }
    return new PageMainAction();
  }
}
