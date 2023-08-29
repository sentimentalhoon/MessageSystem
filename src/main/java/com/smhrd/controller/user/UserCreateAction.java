package com.smhrd.controller.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.utils.Script;

public class UserCreateAction extends MemberDAO implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    if (existId(email) > 0) {
      Script.back("이미 존재하는 이메일 주소입니다. email is exist", response);
    } else {
      String password = request.getParameter("password");
      String phone = request.getParameter("phone");
      String address = request.getParameter("address");

      Member member = new Member();
      member.setEmail(email);
      member.setPassword(password);
      member.setPhone(phone);
      member.setAddress(address);

      if (join(member) > 0) {        
        String url = "WEB-INF/JoinSuccess.jsp?email=" + email;     
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
      } else {
        Script.back("회원 가입에 실패하였습니다.", response);
      }
    }
  }
}