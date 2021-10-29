package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDTO;
import service.BoardDAO;

/**
 * Servlet implementation class SearchListController
 */
@WebServlet("/searchListController")
public class SearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String searchKey = request.getParameter("searchKey");
		
		if(search.equals("tiCo")) {
			search = " title or boardwriter ";
		}
		
		BoardDAO dao = new BoardDAO();
		try {
		List<BoardDTO> list =dao.searchList(search, searchKey);
		
		request.setAttribute("list", list);
		System.out.println("   ===============>>   " + list);
		System.out.println("   ===============>>   " + search);
		System.out.println("   ===============>>   " + searchKey);
		
		RequestDispatcher rd = request.getRequestDispatcher("/read/readBoard.jsp");
		
		rd.forward(request, response);
		
		
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
