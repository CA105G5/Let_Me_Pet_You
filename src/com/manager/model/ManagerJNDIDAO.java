package com.manager.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ManagerJNDIDAO implements ManagerDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String userid = "CA105G5";
//	String password = "123456"; 
	
	private static final String INSERT_STMT="INSERT INTO MANAGER_ACCOUNT (ma_id,ma_name,ma_acc,ma_psw) VALUES ('MA'||lpad(to_char(manager_account_seq.nextval), 8, '0'),?,?,?)";
	private static final String UPDATE_STMT="UPDATE MANAGER_ACCOUNT set ma_name=?, ma_acc=?, ma_psw=?, ma_status=? where ma_id=?";
	private static final String DELETE_STMT="DELETE FROM MANAGER_ACCOUNT where ma_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM MANAGER_ACCOUNT where ma_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM MANAGER_ACCOUNT order by ma_id";
	private static final String MANAGER_LOGIN_STMT="SELECT * FROM MANAGER_ACCOUNT where ma_acc=?";
	

	

	@Override
	public void insert(ManagerVO managerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,managerVO.getMa_name());
			pstmt.setString(2,managerVO.getMa_acc());
			pstmt.setString(3,managerVO.getMa_psw());
			
			
			pstmt.executeUpdate();
			
			
			
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
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,managerVO.getMa_name());
			pstmt.setString(2,managerVO.getMa_acc());
			pstmt.setString(3,managerVO.getMa_psw());
			pstmt.setString(4,managerVO.getMa_status());
			pstmt.setString(5,managerVO.getMa_id());
			
					
			pstmt.executeUpdate();
			
	
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
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,ma_id);
			
			pstmt.executeUpdate();
			
			
			
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
			
			con = ds.getConnection();
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
			
			con = ds.getConnection();
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
			
			con = ds.getConnection();
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

