package com.sys_para.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class SysParaJDBCDAO implements SysParaDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456"; 
	
	private static final String INSERT_STMT="INSERT INTO SYSTEM_PARAMETER (sys_name,sys_content) VALUES (?,?)";
	private static final String UPDATE_STMT="UPDATE SYSTEM_PARAMETER set sys_content=? where sys_name=?";
	private static final String DELETE_STMT="DELETE FROM SYSTEM_PARAMETER where sys_name=?";
	private static final String GET_ONE_STMT="SELECT * FROM SYSTEM_PARAMETER where sys_name=?";
	private static final String GET_ALL_STMT="SELECT * FROM SYSTEM_PARAMETER order by sys_name";

	public static void main(String[] args) {
		//checked
		SysParaJDBCDAO dao = new SysParaJDBCDAO();
		//insert
		SysParaVO sysparaVO1 = new SysParaVO();
		sysparaVO1.setSys_name("組員");
		sysparaVO1.setSys_content("周伯謙");
		dao.insert(sysparaVO1);
		System.out.println("新增成功");
		System.out.println("===========");
		
		//update
		SysParaVO sysparaVO2 = new SysParaVO();
		sysparaVO2.setSys_name("組員");
		sysparaVO2.setSys_content("楊書鳴");
		dao.update(sysparaVO2);
		System.out.println("修改成功");
		System.out.println("===========");
		
		//delete
		dao.delete("組員");
		System.out.println("刪除成功");
		System.out.println("===========");
		
		//findByPrimaryKey
		SysParaVO sysparaVO3 = dao.findByPrimaryKey("女神");
		System.out.println(sysparaVO3.getSys_name());
		System.out.println(sysparaVO3.getSys_content());
		System.out.println("單一資料查詢成功");
		System.out.println("===========");
		
		//getAll
		List<SysParaVO> list = dao.getAll();
		for(SysParaVO aSysPara : list) {
			System.out.println(aSysPara.getSys_name());
			System.out.println(aSysPara.getSys_content());
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
		}
		System.out.println("多筆資料查詢成功");
		System.out.println("===========");
		
		
	}

	@Override
	public void insert(SysParaVO sysparaVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,sysparaVO.getSys_name());
			pstmt.setString(2,sysparaVO.getSys_content());

			
			
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
	public void update(SysParaVO sysparaVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,sysparaVO.getSys_content());
			pstmt.setString(2,sysparaVO.getSys_name());

					
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
	public void delete(String sys_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,sys_name);
			
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
	public SysParaVO findByPrimaryKey(String sys_name) {
		SysParaVO sysparaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,sys_name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sysparaVO = new SysParaVO();
				sysparaVO.setSys_name(rs.getString("sys_name"));
				sysparaVO.setSys_content(rs.getString("sys_content"));
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
		return sysparaVO;
	}

	@Override
	public List<SysParaVO> getAll() {
		List<SysParaVO> list = new ArrayList<SysParaVO>();
		SysParaVO sysparaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sysparaVO = new SysParaVO();
				sysparaVO.setSys_name(rs.getString("sys_name"));
				sysparaVO.setSys_content(rs.getString("sys_content"));
				list.add(sysparaVO);
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

}
