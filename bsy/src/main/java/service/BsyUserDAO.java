package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.BsyUserDTO;

public class BsyUserDAO {
	
	
	Connection conn;			
	PreparedStatement pstmt;	
	ResultSet rs;	
	
	public void userInsert(String id, String password, String phoneNumber, String gender, String email, String birth) throws SQLException, ClassNotFoundException {
		conn = null;	
		pstmt = null;	
		
		Class.forName("com.mysql.jdbc.Driver");	
		
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";	
		
conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "insert into bsyUser(id, password, phoneNumber, gender, email, birth) values( ?, ?, ?, ?, ?, ?)";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, phoneNumber);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6, birth);
		
		pstmt.executeUpdate();
	}
	
	public List<BsyUserDTO> readUserListAll() throws ClassNotFoundException, SQLException{
		
		List<BsyUserDTO> list = new ArrayList<>();
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		Class.forName("com.mysql.jdbc.Driver");	
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "select * from bsyUser order by userNum desc";	
		
		pstmt = conn.prepareStatement(sql);	
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BsyUserDTO dto = new BsyUserDTO();
			
			dto.setUserNum(rs.getInt("userNum"));
			dto.setId(rs.getString("id"));
			dto.setPassword(rs.getString("password"));
			dto.setPhoneNumber(rs.getString("phoneNumber"));
			dto.setGender(rs.getString("gender"));
			dto.setEmail(rs.getString("email"));
			dto.setBirth(rs.getString("birth"));
			
			list.add(dto);
		}
		
		
		return list;
	}
	
	public void userDelete(String userNum) throws ClassNotFoundException, SQLException {
		conn = null;	
		pstmt = null;	
		
		Class.forName("com.mysql.jdbc.Driver");	
		
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";	
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "delete from bsyUser where userNum=?";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, userNum);
		
		pstmt.executeUpdate();
		
	}
	
public List<BsyUserDTO> userUpdateForm(String userNum) throws ClassNotFoundException, SQLException{
		
		List<BsyUserDTO> list = new ArrayList<>();
		
		conn = null;	
		pstmt = null;	
		rs = null;
		
		Class.forName("com.mysql.jdbc.Driver");	
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";							
		
		conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "select * from bsyUser where userNum=?";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, userNum);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BsyUserDTO dto = new BsyUserDTO();
			
			dto.setUserNum(rs.getInt("userNum"));
			dto.setId(rs.getString("id"));
			dto.setPassword(rs.getString("password"));
			dto.setPhoneNumber(rs.getString("phoneNumber"));
			dto.setGender(rs.getString("gender"));
			dto.setEmail(rs.getString("email"));
			dto.setBirth(rs.getString("birth"));
			
			list.add(dto);
		}
		
		
		return list;
	}

	public void userUpdate(String userNum, String password, String phoneNumber, String gender, String email, String birth) throws ClassNotFoundException, SQLException {
		conn = null;	
		pstmt = null;	
		
		Class.forName("com.mysql.jdbc.Driver");	
		
		String url = 
				"jdbc:mysql://localhost:3306/bsy?useSSL=false";	
		String dbUser = "root";									
		String dbPassword = "rootroot";	
		
conn = DriverManager.getConnection(url, dbUser, dbPassword);	
		
		String sql = "update bsyUser set password = ? , phoneNumber = ? , gender = ? , email = ? , birth = ? where userNum = ?";	
		
		pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1, password);
		pstmt.setString(2, phoneNumber);
		pstmt.setString(3, gender);
		pstmt.setString(4, email);
		pstmt.setString(5, birth);
		pstmt.setString(6, userNum);
		
		
		pstmt.executeUpdate();
		
	}
	
	public int idCheck(String id) throws ClassNotFoundException, SQLException {
		
		
		
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
		
		String sql = "select * from bsyUser where id = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			return 1;
		}else if(id.equals("")) {
			return 2;
		}else {
			return 0;
		}
		}catch (Exception e) {
			System.out.println("아이디 비교 실패");
		}
		return -1;
	}

	
	

	
	  public String loginId(String id, String password) throws SQLException, ClassNotFoundException {
		  String idc = null;
		  
		  conn = null; 
		  pstmt = null; 
		  rs = null;
	  
	  try{ 
		  
		  Class.forName("com.mysql.jdbc.Driver");	
		  
		  String url = "jdbc:mysql://localhost:3306/bsy?useSSL=false";
		  String dbUser = "root"; 
		  String dbPassword = "rootroot";
	  
	  conn = DriverManager.getConnection(url, dbUser, dbPassword);
	  
	  String sql = "select * from bsyUser where id = ?";
	  pstmt = conn.prepareStatement(sql);
	  
		pstmt.setString(1, id);
	  
	  rs = pstmt.executeQuery();
	  
	  if(rs.next()) {
	  
		  if(id.equals(rs.getString("id"))) {
			  if(password.equals(rs.getString("password"))) {
				  idc = "success";
				  return idc;
			  }else {
				  idc = "pwfail";
				  return idc;
			  }
		  }
	 
	  }else {
		  idc = "idfail";
		  return idc;
	  }
	  
	  }catch(SQLException ex){
		  System.out.println("로그인 실패"); 
	  
	  			
	  			}finally{
	  
	  				pstmt.close(); 
	  				conn.close(); 
	  				rs.close();
	  			}
	return idc;
	  
	  }
}
