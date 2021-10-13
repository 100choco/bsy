package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BsyUserDAO;


@WebServlet("/signUp/signUpController")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		BsyUserDAO dao = new BsyUserDAO();
		
		try {
			dao.userInsert(id, password, phoneNumber, gender, email, birth);
			
			response.sendRedirect("/bsy/main.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
