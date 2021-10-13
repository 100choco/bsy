package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDTO;
import service.BoardDAO;

@WebServlet("/contentReadController")
public class ContentReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("num");
		int views = Integer.parseInt(request.getParameter("views"));
		int newViews = views + 1;
		
		
		try {
			
			BoardDAO dao = new BoardDAO();
			
			List<BoardDTO> list = dao.ContentRead(num, newViews);
			
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("/content/boardContent.jsp");
			
			rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}
	

}
