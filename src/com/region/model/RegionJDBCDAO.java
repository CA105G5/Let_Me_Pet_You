package com.region.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class RegionJDBCDAO implements RegionDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "test2";
	String passwd = "111";
	
	private static final String INSERT_STMT = 
			"INSERT INTO REGION (reg_id,reg_name) VALUES ('REG'||LPAD(to_char(region_seq.NEXTVAL), 7, '0'), ?)";
	private static final String GET_ALL_STMT = 
			"SELECT reg_id,reg_name FROM REGION order by reg_id";
	private static final String GET_ONE_STMT = 
			"SELECT reg_id,reg_name FROM REGION where reg_id = ?";
	private static final String DELETE = 
			"DELETE FROM REGION where reg_id = ?";
	private static final String UPDATE = 
			"UPDATE REGION set reg_name =? where reg_id = ?";

	@Override
	public void insert(RegionVO regionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			
			pstmt.setString(1, regionVO.getReg_name());
			

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

		
	

	@Override
	public void update(RegionVO regionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1,regionVO.getReg_name());
			pstmt.setString(2,regionVO.getReg_id());
			

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
	}

	@Override
	public void delete(String reg_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,reg_id);

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	
		
	}

	@Override
	public RegionVO findByPrimaryKey(String reg_id) {
		RegionVO regionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, reg_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// regionVo 也稱為 Domain objects
				regionVO = new RegionVO();
				regionVO.setReg_id(rs.getString("reg_id"));
				regionVO.setReg_name(rs.getString("reg_name"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return regionVO;
		
	}

	@Override
	public List<RegionVO> getAll() {
		
		List<RegionVO> list = new ArrayList<RegionVO>();
		RegionVO regionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				regionVO = new RegionVO();
				regionVO.setReg_id(rs.getString("reg_id"));
				regionVO.setReg_name(rs.getString("reg_name"));
				list.add(regionVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	public static void main(String[] args) {

		RegionJDBCDAO dao = new RegionJDBCDAO();

		// 新增
		RegionVO regionVO1 = new RegionVO();
		
		regionVO1.setReg_name("綠島");
		
		dao.insert(regionVO1);

		// 修改
		RegionVO regionVO2 = new RegionVO();
		regionVO2.setReg_id("REG0000023");
		regionVO2.setReg_name("小硫球");
		
		dao.update(regionVO2);

		// 刪除
		dao.delete("REG0000023");

		// 查詢
		RegionVO regionVO3 = dao.findByPrimaryKey("REG0000001");
		System.out.print(regionVO3.getReg_id() + ",");
		System.out.println(regionVO3.getReg_name() + ",");
		
		System.out.println("---------------------");

		// 查詢
		List<RegionVO> list = dao.getAll();
		for (RegionVO aReg : list) {
			System.out.print(aReg.getReg_id() + ",");
			System.out.print(aReg.getReg_name() + ",");
			System.out.println();
		}
	}
}
