package com.smhrd.controller.board.Page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Board/Write")
public class BoardPageWrite extends HttpServlet   {
    /**
   * 
   */
  private static final long serialVersionUID = 1L;
    private static final String CHARSET = "utf-8";

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/BoardWrite.jsp");
        rd.forward(request, response);
    }
}
