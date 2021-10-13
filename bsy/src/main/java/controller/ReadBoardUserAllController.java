package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReadBoardUserAllController
 */
@WebServlet("/readBoardUserAllController")
public class ReadBoardUserAllController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionName = (String) session.getAttribute("id");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		PrintWriter out = response.getWriter();
		if(sessionName == null) {
		out.println("<script>alert('�α������ּ���.');</script>");
		out.println("<script>window.location.href='/bsy/main.jsp';</script>"); 
		}else {
			
		}
	}



}
