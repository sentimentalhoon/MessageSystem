package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.Message;
import com.smhrd.model.MessageDAO;
import com.smhrd.utils.Script;

/**
 * Servlet implementation class MessageService
 */
@WebServlet("/MessageService")
public class MessageService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  // 1) 인코딩
	  request.setCharacterEncoding("utf-8");
	  // 2) 데이터 수집 (메세지 작성시 사용된 데이터 찾아오기)
	  String sendEmail = request.getParameter("sendEmail");
	  String receiveEmail = request.getParameter("receiveEmail");
	  String sendmessage = request.getParameter("message");
	  // 3) 기능처리
	  Message message = new Message();
	  message.setSendEmail(sendEmail);
	  message.setReceiveEmail(receiveEmail);
	  message.setMessage(sendmessage);
	  
	  MessageDAO messageDAO = new MessageDAO();
	  int result = messageDAO.sendMessage(message);
	  
	  if (result > 0) {
	    Script.back("메세지 전송에 성공하였습니다.", response);	    
	  } else {
	    Script.back("메세지 전송에 실패하였습니다.", response);      
	  }
	  
	  // 4) view 처리
	  
	}
}
