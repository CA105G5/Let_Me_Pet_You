package com.foundTrace.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class foundTraceJDBCDAO implements foundTraceDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "juber";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO found_trace(fd_case_id,memb_id) values (?,?)";
	private static final String GET_ALL_STMT = "SELECT fd_case_id,memb_id FROM found_trace where memb_id =? ";
	private static final String DELETE = "DELETE FROM found_trace where fd_case_id = ? and memb_id = ?";

	// 新增
	@Override
	public void insert(foundTraceVO foundTraceVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundTraceVO.getFd_case_id());
			pstmt.setString(2, foundTraceVO.getMemb_id());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	// 新增II
	@Override
	public void insert(String fd_case_id, String memb_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, fd_case_id);
			pstmt.setString(2, memb_id);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	// 刪除
	@Override
	public void delete(String fd_case_id, String memb_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, fd_case_id);
			pstmt.setString(2, memb_id);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	// 查詢
	@Override
	public List<foundTraceVO> findByMember(String memb_id) {
		List<foundTraceVO> list = new ArrayList<foundTraceVO>();
		foundTraceVO foundTraceVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			pstmt.setString(1, memb_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundTraceVO = new foundTraceVO();
				foundTraceVO.setFd_case_id(rs.getString("fd_case_id"));
				foundTraceVO.setMemb_id(rs.getString("memb_id"));
				list.add(foundTraceVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		foundTraceJDBCDAO dao = new foundTraceJDBCDAO();
		
		//新增
//		foundTraceVO foundTraceVO1 = new foundTraceVO();
//		foundTraceVO1.setFd_case_id("F000000001");
//		foundTraceVO1.setMemb_id("M000000008");
//		dao.insert(foundTraceVO1);
		
		//新增
//		dao.insert("F000000001", "M000000009");
		
		//刪除
//		foundTraceVO foundTraceVO2 = new foundTraceVO();
//		dao.delete("F000000001", "M000000009");
		
		//查詢
//		List<foundTraceVO> list = dao.findByMember("M000000008");
//		for (foundTraceVO ft : list) {
//			System.out.print(ft.getFd_case_id()+",");
//			System.out.println(ft.getMemb_id());
//			System.out.println("-----------------------------------------");
//		}
	}
	
}