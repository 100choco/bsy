package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BsyUserDAO;

@WebServlet("/userDeleteController")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNum = request.getParameter("userNum");
		
		BsyUserDAO dao = new BsyUserDAO();
		
		try {
			dao.userDelete(userNum);
			
			response.sendRedirect("/bsy/readUserListAllController");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
