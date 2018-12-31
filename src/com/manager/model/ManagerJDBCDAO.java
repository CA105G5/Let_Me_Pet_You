package com.manager.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManagerJDBCDAO implements ManagerDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456"; 
	
	private static final String INSERT_STMT="INSERT INTO MANAGER_ACCOUNT (ma_id,ma_name,ma_acc,ma_psw) VALUES ('MA'||lpad(to_char(manager_account_seq.nextval), 8, '0'),?,?,?)";
	private static final String UPDATE_STMT="UPDATE MANAGER_ACCOUNT set ma_name=?, ma_acc=?, ma_psw=?, ma_status=? where ma_id=?";
	private static final String DELETE_STMT="DELETE FROM MANAGER_ACCOUNT where ma_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM MANAGER_ACCOUNT where ma_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM MANAGER_ACCOUNT order by ma_id";
	private static final String MANAGER_LOGIN_STMT="SELECT * FROM MANAGER_ACCOUNT where ma_acc=?";
	

	public static void main(String[] args) {
		//checked
		ManagerJDBCDAO dao = new ManagerJDBCDAO();
		//insert
//		ManagerVO managerVO1 = new ManagerVO();
//		managerVO1.setMa_name("傅俊皓");
//		managerVO1.setMa_acc("fu");
//		managerVO1.setMa_psw("123456");
//		dao.insert(managerVO1);
//		System.out.println("新增成功");
//		System.out.println("===========");
//		
//		//update
//		ManagerVO managerVO2 = new ManagerVO();
//		managerVO2.setMa_id("MA00000004");
//		managerVO2.setMa_name("傅俊皓!");
//		managerVO2.setMa_acc("fufu");
//		managerVO2.setMa_psw("1234567");
//		managerVO2.setMa_status("停權");
//		dao.update(managerVO2);
//		System.out.println("修改成功");
//		System.out.println("===========");
//		
//		//delete
//		dao.delete("MA00000004");
//		System.out.println("刪除成功");
//		System.out.println("===========");
//		
//		
//		//findByPrimaryKey
//		ManagerVO managerVO3 = dao.findByPrimaryKey("MA00000001");
//		System.out.println(managerVO3.getMa_id());
//		System.out.println(managerVO3.getMa_name());
//		System.out.println(managerVO3.getMa_acc());
//		System.out.println(managerVO3.getMa_psw());
//		System.out.println(managerVO3.getMa_status());
//		System.out.println("==========================");
//		System.out.println("單一資料查詢成功");
//		System.out.println("===========");
		
		//findByManagerAccount
				ManagerVO managerVO4 = dao.findByManagerAccount("peter");
				System.out.println(managerVO4.getMa_id());
				System.out.println(managerVO4.getMa_name());
				System.out.println(managerVO4.getMa_acc());
				System.out.println(managerVO4.getMa_psw());
				System.out.println(managerVO4.getMa_status());
				System.out.println("==========================");
				System.out.println("帳號查全部查詢成功");
				System.out.println("===========");
		
		
//		//getAll
//		List<ManagerVO> list = dao.getAll();
//		for(ManagerVO aManager : list) {
//			System.out.println(aManager.getMa_id());
//			System.out.println(aManager.getMa_name());
//			System.out.println(aManager.getMa_acc());
//			System.out.println(aManager.getMa_psw());
//			System.out.println(aManager.getMa_status());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		
		
		
	}

	@Override
	public void insert(ManagerVO managerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,managerVO.getMa_name());
			pstmt.setString(2,managerVO.getMa_acc());
			pstmt.setString(3,managerVO.getMa_psw());
			
			
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void update(ManagerVO managerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,managerVO.getMa_name());
			pstmt.setString(2,managerVO.getMa_acc());
			pstmt.setString(3,managerVO.getMa_psw());
			pstmt.setString(4,managerVO.getMa_status());
			pstmt.setString(5,managerVO.getMa_id());
			
					
			pstmt.executeUpdate();
			
	
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void delete(String ma_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,ma_id);
			
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public ManagerVO findByPrimaryKey(String ma_id) {
		ManagerVO managerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,ma_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				managerVO = new ManagerVO();
				managerVO.setMa_id(rs.getString("ma_id"));
				managerVO.setMa_name(rs.getString("ma_name"));
				managerVO.setMa_acc(rs.getString("ma_acc"));
				managerVO.setMa_psw(rs.getString("ma_psw"));
				managerVO.setMa_status(rs.getString("ma_status"));
				
			}
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return managerVO;
	}

	@Override
	public List<ManagerVO> getAll() {
		List<ManagerVO> list = new ArrayList<ManagerVO>();
		ManagerVO managerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				managerVO = new ManagerVO();
				managerVO.setMa_id(rs.getString("ma_id"));
				managerVO.setMa_name(rs.getString("ma_name"));
				managerVO.setMa_acc(rs.getString("ma_acc"));
				managerVO.setMa_psw(rs.getString("ma_psw"));
				managerVO.setMa_status(rs.getString("ma_status"));
				list.add(managerVO);
			}
			
			
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public ManagerVO findByManagerAccount(String ma_acc) {
		ManagerVO managerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(MANAGER_LOGIN_STMT);
			
			pstmt.setString(1,ma_acc);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				managerVO = new ManagerVO();
				managerVO.setMa_id(rs.getString("ma_id"));
				managerVO.setMa_name(rs.getString("ma_name"));
				managerVO.setMa_acc(rs.getString("ma_acc"));
				managerVO.setMa_psw(rs.getString("ma_psw"));
				managerVO.setMa_status(rs.getString("ma_status"));
				
			}
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return managerVO;
	}

}
