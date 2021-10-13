package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardDAO;

@WebServlet("/insertBoardController")
public class InsertBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");	
		String content = request.getParameter("content");
		String boardWriter = request.getParameter("boardWriter");
		String boardWriterPassword = request.getParameter("boardWriterPassword");

		
		
		
		
		try {
			BoardDAO dao = new BoardDAO();
			
			dao.InsertBoard(title, content, boardWriter, boardWriterPassword);
			
			response.sendRedirect("/bsy/main.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
		
	}


	

}
