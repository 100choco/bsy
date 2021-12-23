package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentDAO;


@WebServlet("/commentDeleteController")
public class CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String commentNum = request.getParameter("commentNum");
		System.out.println("컨트롤러 진입");
		CommentDAO dao = new CommentDAO();
		
		try {
			
			dao.commentDelete(commentNum);
			System.out.println("DAO탈출");
			response.sendRedirect("/bsy/main.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	

}
