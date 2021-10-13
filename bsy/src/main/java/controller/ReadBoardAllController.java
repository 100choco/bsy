package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDTO;
import service.BoardDAO;

@WebServlet("/ReadBoardAllController")
public class ReadBoardAllController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionName = (String) session.getAttribute("id");
		BoardDAO dao = new BoardDAO();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		try {
			List<BoardDTO> list = dao.readBoardAll();
			
			request.setAttribute("list", list);
			
			
			
			PrintWriter out = response.getWriter();
			if(sessionName == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.println("<script>window.location.href='/bsy/main.jsp';</script>"); 
			}else {
				
				RequestDispatcher rd = request.getRequestDispatcher("/read/readBoard.jsp");
				
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}
