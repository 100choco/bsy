package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentDAO;


@WebServlet("/commemtInsertController")
public class CommemtInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String commentInsert = request.getParameter("commentInsert");
		String commentWriter = request.getParameter("commentWriter");
		String num = request.getParameter("num");
					
		
		System.out.println(commentInsert);
		System.out.println(commentWriter);
		
		CommentDAO dao = new CommentDAO();
		try {
			dao.commentInsert(commentInsert, commentWriter, num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}
