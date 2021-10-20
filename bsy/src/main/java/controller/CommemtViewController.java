package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.CommentDTO;
import service.CommentDAO;


@WebServlet("/commemtViewController")
public class CommemtViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      System.out.println("CommemtView>>>>>>>>>>>>>>>>>");
	      response.setContentType("application/json");
	       request.setCharacterEncoding("UTF-8");
	       response.setCharacterEncoding("UTF-8");
	       
	       String num = request.getParameter("num");
	      
	      int boardNum = Integer.parseInt(num);
	      
	      
	      System.out.println("11111111111111111111111");
	      System.out.println(boardNum);
	     
	      CommentDAO dao = new CommentDAO();
	      
	      

	      List<CommentDTO> commentList = dao.CommentList(boardNum);
	      System.out.println(commentList);
	      String commentListt = new Gson().toJson(commentList);
	      response.getWriter().println(commentListt);
	      
//		  request(json) to map
		
		////받거니
//        Gson gson = new Gson();
//        Map<Object, Object> data = new HashMap<>();
//
//        StringBuffer json = new StringBuffer();
//        String line = null;
//
//        try {
//            BufferedReader reader = request.getReader();
//            while((line = reader.readLine()) != null) {
//                json.append(line);
//            }
//
//        }catch(Exception e) {
//            System.out.println("Error reading JSON string: " + e.toString());
//        }
//        data = (Map) gson.fromJson(json.toString(), data.getClass());
//        
//        
//        
//        
//        ////주거니
//        JsonObject jsonObject = new JsonObject();
//
//        // 서비스 결과를 json 형식으로 담기
//        for (Object key : data.keySet()) {
//            jsonObject.addProperty((String) key, (String) data.get(key) + "반환");
//        }
//
//        // 회신
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(gson.toJson(jsonObject));
//
//	       
//	   }
	}

}
