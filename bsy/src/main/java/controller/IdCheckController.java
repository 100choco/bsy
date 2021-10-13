package controller;


  
  import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException; import
  javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
  import javax.servlet.http.HttpServletRequest; import
  javax.servlet.http.HttpServletResponse;

import service.BsyUserDAO;
  
  
  @WebServlet("/idCheckController") //aJaxTest있는 url이 이걸 타고 들어옴. 포스트방식이라니까 밑에꺼를 쓴느거임
  public class IdCheckController extends HttpServlet { private static final
  long serialVersionUID = 1L;
  
  
  
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
  String id = request.getParameter("id"); //파라미터값과 디비값을 비교하고싶어. //디비짠건 DAO에 있다.
  
  BsyUserDAO dao = new BsyUserDAO(); //훔쳐쓰기. 끌어와쓰기 int result =


	int result = 0;
	try {
		result = dao.idCheck(id);
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  
  response.getWriter().print(result); }
  
  }
 