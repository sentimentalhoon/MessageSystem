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

@WebServlet("/Message/Load")
public class loadMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		HttpSession session = request.getSession();
		Object o = session.getAttribute("memberInfo");

		try (PrintWriter out = response.getWriter()) {
			String returnString = null;
			if (o != null && o instanceof Member) {
				Member member = (Member) o;
				if (member.getEmail() != null) {
					MessageDAO dao = new MessageDAO();
					returnString = dao.getMessageListToJson(member.getEmail());
					out.write(returnString);
				} else {
				  out.write("{}");
				}
			}
		}
	}
}
