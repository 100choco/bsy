package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BsyUserDAO;


@WebServlet("/userLoginController")

public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		BsyUserDAO dao = new BsyUserDAO();
		
		try {
			String idc = dao.loginId(id, password);
			System.out.println("=====================>>" + idc);
			
			if(idc.equals("success")) {
				session.setAttribute("id", id);
				
				RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
				
				
				rd.forward(request, response);
				
				
			}else if(idc.equals("pwfail")) {
				System.out.println("�������");
				PrintWriter out = response.getWriter();
				  out.println("<script>alert('�α��ν���');</script>");

				
			}else {
				System.out.println("����");
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}

}
