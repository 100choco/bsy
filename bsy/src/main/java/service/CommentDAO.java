package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;


import model.CommentDTO;

public class CommentDAO {

	
	Connection conn;			
	PreparedStatement pstmt;	
	ResultSet rs;
	
	
	public List<CommentDTO> CommentList(int boardNum) {
		   List<CommentDTO> commentList= new ArrayList<CommentDTO>();
		      
		   
		      try{
		    	    conn = null;	
		  	    	pstmt = null;	
		  	    	rs = null;
		  	    	Class.forName("com.mysql.jdbc.Driver");	
		  			
		  			String url = 
		  					"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		  			String dbUser = "root";									
		  			String dbPassword = "rootroot";							
		  			conn = DriverManager.getConnection(url, dbUser, dbPassword);

		         String sql = "select * from comment where boardNum=? order by commentNum desc";
		         pstmt = conn.prepareStatement(sql);

		         pstmt.setInt(1, boardNum);
		         rs = pstmt.executeQuery();   

		         while (rs.next()) {
		            CommentDTO dto = new CommentDTO();

		            dto.setCommentNum(rs.getInt("commentNum"));
		            dto.setCommentContent(rs.getString("commentContent"));
		            dto.setCommentWriter(rs.getString("commentWriter"));
		            dto.setCommentRegDate(rs.getString("commentRegDate"));
		            dto.setBoardNum(rs.getInt("boardNum"));
		            
		            commentList.add(dto);
		            
		         }

		         
		               

		         
		      }catch(Exception ex){
		         System.out.println("selectCommentList ½ÇÆÐ");
		         ex.printStackTrace();
		      }finally {
		            try {
		                rs.close();
		             } catch (Exception e) {
		                e.printStackTrace();
		             }
		             try {
		                pstmt.close();
		             } catch (Exception e) {
		                e.printStackTrace();
		             }
		             try {
		                conn.close();
		             } catch (Exception e) {
		                e.printStackTrace();
		             }
		          }
		          
		      return commentList; 
		      

	}	
	
	
	  public void commentInsert(String commentInsert, String commentWriter, String num) throws SQLException { 
		  
		  
		  try{ 
			  
		  conn = null; 
		  pstmt = null;
	  
	  
		  Class.forName("com.mysql.jdbc.Driver");
		  
		  String url = "jdbc:mysql://localhost:3306/bsy?useSSL=false"; 
		  String dbUser = "root"; 
		  String dbPassword = "rootroot";
		  conn = DriverManager.getConnection(url, dbUser, dbPassword);
		  
		  String sql =
		  "insert into comment(commentContent, commentWriter, boardNum) values(?, ?, ?)";
		  pstmt = conn.prepareStatement(sql);
		  	pstmt.setString(1, commentInsert);
		  	pstmt.setString(2, commentWriter);
		  	pstmt.setInt(3, Integer.parseInt(num));
		  	
		  	pstmt.executeUpdate();
		  	
		  }catch(Exception e){
			  System.out.println(e);
		  }finally {
			conn.close();
			pstmt.close();
		}
	 
	  }


	public void commentDelete(String commentNum) throws SQLException {
		try{ 
			  
			  conn = null; 
			  pstmt = null;
		  
			  Class.forName("com.mysql.jdbc.Driver");
			  
			  String url = "jdbc:mysql://localhost:3306/bsy?useSSL=false"; 
			  String dbUser = "root"; 
			  String dbPassword = "rootroot";
			  conn = DriverManager.getConnection(url, dbUser, dbPassword);
			  String sql =
			  "delete from comment where commentNum =?";
			  pstmt = conn.prepareStatement(sql);
			  
			  pstmt.setString(1, commentNum);
			  pstmt.executeUpdate();
	}catch(Exception e){
		  System.out.println(e);
	  }finally {
		conn.close();
		pstmt.close();
	}
	
}
	
}

