package com.smhrd.controller.message;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.model.Member;
import com.smhrd.model.MessageDAO;

/**
 * Servlet implementation class deleteMessage
 */
@WebServlet("/Message/Delete")
public class deleteMessage extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    String num = request.getParameter("num");
    HttpSession session = request.getSession();
    Object o = session.getAttribute("memberInfo");
    
    response.setCharacterEncoding("UTF-8");
    response.setContentType("application/json;charset=UTF-8");

    try (PrintWriter out = response.getWriter()) {
      if (o != null && o instanceof Member) {
        Member member = (Member) o;
        if (member.getEmail() != null) {
          MessageDAO dao = new MessageDAO();
          dao.deleteMessage(num);
        }
      }
    }
  }
}
