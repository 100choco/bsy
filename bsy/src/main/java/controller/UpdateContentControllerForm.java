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


@WebServlet("/updateContentControllerForm")
public class UpdateContentControllerForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		BoardDAO dao = new BoardDAO();
		
		try {
			
			dao.boardUpdateForm(num);
			
			List<BoardDTO> list = dao.boardUpdateForm(num);
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("/update/contentUpdateForm.jsp");
			
			rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
