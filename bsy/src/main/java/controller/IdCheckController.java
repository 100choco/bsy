package controller;


  
  import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException; import
  javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
  import javax.servlet.http.HttpServletRequest; import
  javax.servlet.http.HttpServletResponse;

import service.BsyUserDAO;
  
  
  @WebServlet("/idCheckController") //aJaxTest�ִ� url�� �̰� Ÿ�� ����. ����Ʈ����̶�ϱ� �ؿ����� ��������
  public class IdCheckController extends HttpServlet { private static final
  long serialVersionUID = 1L;
  
  
  
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
  String id = request.getParameter("id"); //�Ķ���Ͱ��� ����� ���ϰ�;�. //���§�� DAO�� �ִ�.
  
  BsyUserDAO dao = new BsyUserDAO(); //���ľ���. ����;��� int result =


	int result = 0;
	try {
		result = dao.idCheck(id);
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  
  response.getWriter().print(result); }
  
  }
 