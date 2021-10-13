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
import model.BsyUserDTO;
import service.BsyUserDAO;

@WebServlet("/userUpdateFormController")
public class UserUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNum = request.getParameter("userNum");

		BsyUserDAO dao = new BsyUserDAO();
		
		try {
			dao.userUpdateForm(userNum);
			
			List<BsyUserDTO> list = dao.userUpdateForm(userNum);
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("user/userUpdateForm.jsp");
			
			rd.forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}



}
