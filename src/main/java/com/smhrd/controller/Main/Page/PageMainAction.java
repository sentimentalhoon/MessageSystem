package com.smhrd.controller.Main.Page;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.client.MongoDatabase;
import com.smhrd.controller.Action;
import com.smhrd.database.mongdb.MongoDBManager;

public class PageMainAction implements Action {
  private static final String CHARSET = "utf-8";

  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    MongoDatabase db = MongoDBManager.getInstance().dbManager();
    
    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Main.jsp");
    rd.forward(request, response);
  }
}
