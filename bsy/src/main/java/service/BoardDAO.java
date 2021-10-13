package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BoardDTO;

public class BoardDAO {
	
	
	Connection conn;			
	PreparedStatement pstmt;	
	ResultSet rs;		
	
	public void InsertBoard(String title, String content, String boardWriter, String boardWriterPassword) throws ClassNotFoundException, SQLException {
		conn = null;	
		pstmt = null;	
		
		Class.forName("com.mysql.jdbc.Driver");	
		
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "insert into bsyBoard(title, content, boardWriter, boardWriterPassword) values( ?, ?, ?, ?)";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, boardWriter);
		pstmt.setString(4, boardWriterPassword);
		
		pstmt.executeUpdate();

	}
	
	public List<BoardDTO> readBoardAll(){
		
		List<BoardDTO> list = new ArrayList<>();
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		
								
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			
			String url = 
					"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
			String dbUser = "root";									
			String dbPassword = "rootroot";	
			
			conn = DriverManager.getConnection(url, dbUser, dbPassword);
			
			String sql = "select * from bsyBoard order by num desc";	
			
			pstmt = conn.prepareStatement(sql);	
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setBoardWriter(rs.getString("boardWriter"));
				dto.setBoardWriterPassword(rs.getString("boardWriterPassword"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setViews(rs.getString("views"));
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	
	public void BoardDelete(String num) throws ClassNotFoundException{
		conn = null;	
		pstmt = null;	
		
		Class.forName("com.mysql.jdbc.Driver");	
		
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		try {
			conn = DriverManager.getConnection(url, dbUser, dbPassword);
			
			String sql = "delete from bsyboard where num=?";	
			
			
			pstmt = conn.prepareStatement(sql);	
			
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			boardCount();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	

	
	}
	
	public List<BoardDTO> ContentRead(String num, int newViews) throws ClassNotFoundException, SQLException {
		
		
			List<BoardDTO> list = new ArrayList<>();
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		Class.forName("com.mysql.jdbc.Driver");	
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "select * from bsyBoard where num=?";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, num);
		
		rs = pstmt.executeQuery();
		
		
		
		while (rs.next()) {
			
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setBoardWriter(rs.getString("boardWriter"));
			dto.setRegDate(rs.getString("regDate"));
			dto.setViews(rs.getString("views"));
			
	
			
			list.add(dto);
			
		}
		rs.close();
		pstmt.close();
		
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		Class.forName("com.mysql.jdbc.Driver");	
								
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
			
		String sqlU = "update bsyBoard set views = ? where num = ?";	
		
		pstmt = conn.prepareStatement(sqlU);	
		
		pstmt.setInt(1, newViews);
		pstmt.setString(2, num);
		
		pstmt.executeUpdate();
		
		return list;
		
	}
	
	


	public List<BoardDTO> boardUpdateForm(String num) throws ClassNotFoundException, SQLException {
		List<BoardDTO> list = new ArrayList<>();
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		Class.forName("com.mysql.jdbc.Driver");	
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "select * from bsyBoard where num=?";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, num);
		
		rs = pstmt.executeQuery();
		
		
		
		while (rs.next()) {
			
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setBoardWriter(rs.getString("boardWriter"));
			dto.setRegDate(rs.getString("regDate"));
			
	
			
			list.add(dto);
			
		}
		
		
		return list;
		
	}
	
	public void boardUpdate(String num, String title, String content) throws ClassNotFoundException, SQLException {
		conn = null;	
		pstmt = null;	
		
		Class.forName("com.mysql.jdbc.Driver");	
		
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "update bsyBoard set title = ?, content = ? where num = ?;";	
		
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, num);
		
	
		
		pstmt.executeUpdate();
		
	}
	
	public List<BoardDTO> searchList(String search, String searchKey) throws ClassNotFoundException{
		List<BoardDTO> list = new ArrayList<>();
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		
		
		Class.forName("com.mysql.jdbc.Driver");	
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		try {
			conn = DriverManager.getConnection(url, dbUser, dbPassword);
			
			String sql = "select * from bsyBoard where " + search + " like ? order by num desc";	
			
			System.out.println("==============================>>   11  " + search);
			
			pstmt = conn.prepareStatement(sql);	
			
			System.out.println("==============================>>   22  " + searchKey);
			System.out.println("==============================>>   !!  " + sql );
			
			/* pstmt.setString(1, search); */
			pstmt.setString(1, '%'+searchKey+'%');
			
			
			System.out.println("==============================>>   33  " + search);
			rs = pstmt.executeQuery();
			System.out.println("==============================>>   !!  " + rs );
			System.out.println("==============================>>   44  " + searchKey);
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setBoardWriter(rs.getString("boardWriter"));
				/* dto.setContent(rs.getString("content")); */
				dto.setRegDate(rs.getString("regDate"));
				dto.setViews(rs.getString("views"));
				
				list.add(dto);
				/* list.add(new BoardDTO(num, title, content, boardWriter, regDate, views)); */

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	
	
		return list;
		
	}
	
	public void boardCount() throws ClassNotFoundException {
			
			conn = null;	
			pstmt = null;	
			rs = null;
			int count = 0;
			
			Class.forName("com.mysql.jdbc.Driver");	
			String url = 
					"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
			String dbUser = "root";									
			String dbPassword = "rootroot";							
			
			String sql = "select count(*) as 'count' from bsyBoard";
			
			
			
			
			
				try {
					conn = DriverManager.getConnection(url, dbUser, dbPassword);
					
					System.out.println("==============================>>   11  ");
					
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						count = rs.getInt("count");
					}
					
					
					System.out.println("==============================>>   22  ");
					System.out.println("==============================>>   !!  ");
					
					pstmt.executeQuery();
					
					pstmt.close();
					
					
					String[] aa = {"set @CNT = 0", "update bsyBoard set bsyBoard.num =@CNT:=@CNT+1", "alter table bsyBoard auto_increment = " + (count+1)};
					
					for(int i = 0; i < aa.length; i ++ ) {
						pstmt = null;
						pstmt = conn.prepareStatement(aa[i]);
						pstmt.executeUpdate();
						
						pstmt.close();
						
					}
					
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					
				}
			
				
					
				
				
				
				
				
	}
	
	
	

}

