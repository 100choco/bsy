package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BsyUserDAO;

@WebServlet("/userUpdateController")
public class UserUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNum = request.getParameter("userNum");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		
		
		BsyUserDAO dao = new BsyUserDAO();
		
		try {
			dao.userUpdate(userNum, password, phoneNumber, gender, email, birth);
			
			response.sendRedirect("/bsy/readUserListAllController");
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}



}
