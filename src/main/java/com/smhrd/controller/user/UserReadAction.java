package com.smhrd.controller.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.model.Member;
import com.smhrd.utils.Script;

public class UserReadAction extends UserDataBase implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Member member = new Member(email, password, null, null);
    Member readMember = login(member);
        
    if (readMember == null) {
      Script.back("login failed", response);
    } else {
      HttpSession session = request.getSession();
      session.setAttribute("memberInfo", readMember);
      RequestDispatcher dis = request.getRequestDispatcher("goMain");
      dis.forward(request, response);
    }
  }
}
