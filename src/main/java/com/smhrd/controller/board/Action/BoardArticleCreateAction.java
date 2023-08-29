package com.smhrd.controller.board.Action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.smhrd.controller.user.Action;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.utils.Script;

public class BoardArticleCreateAction extends BoardDAO implements Action {
  private static final String CHARSET = "utf-8";
  private static final String ATTACHES_DIR = "\\main\\resources\\upload";
  private static final int LIMIT_SIZE_BYTES = 5 * 1024 * 1024;

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    File attachesDir = new File(ATTACHES_DIR);
    DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
    fileItemFactory.setRepository(attachesDir);
    fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
    ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

    Board board = new Board();
    try {
      List<FileItem> items = fileUpload.parseRequest(request);
      for (FileItem item : items) {
        if (item.isFormField()) {
          if (item.getFieldName().equals("title")) {
            board.setTitle(item.getString(CHARSET));
          } else if (item.getFieldName().equals("writer")) {
            board.setWriter(item.getString(CHARSET));
          } else if (item.getFieldName().equals("content")) {
            board.setContent(item.getString(CHARSET));
          }
          System.out.printf("파라미터 명 : %s, 파라미터 값 :  %s \n", item.getFieldName(), item.getString(CHARSET));
        } else {
          System.out.printf("파라미터 명 : %s, 파일 명 : %s,  파일 크기 : %s bytes \n", item.getFieldName(),
              item.getName(), item.getSize());
          if (item.getSize() > 0) {
            String separator = File.separator;
            int index = item.getName().lastIndexOf(separator);
            String fileName = item.getName().substring(index + 1);
            File uploadFile = new File(ATTACHES_DIR + separator + fileName);
            item.write(uploadFile);

            board.setFilename(fileName);
          }
        }
      }

      if (BoardArticleCreate(board) > 0) {        
        String url = "WEB-INF/BoardMain.jsp";     
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
      } else {
        Script.back("게시글 등록에 실패하였습니다.", response);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
