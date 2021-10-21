package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.CommentDTO;
import service.CommentDAO;


@WebServlet("/commemtViewController")
public class CommemtViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      response.setContentType("application/json");
	       request.setCharacterEncoding("UTF-8");
	       response.setCharacterEncoding("UTF-8");
	       
	       String num = request.getParameter("num");
	      
	      int boardNum = Integer.parseInt(num);
	      
	     
	     
	      CommentDAO dao = new CommentDAO();
	      
	      

	      List<CommentDTO> commentList = dao.CommentList(boardNum);
	      String commentListt = new Gson().toJson(commentList);
	      response.getWriter().println(commentListt);
	      
	}

}
