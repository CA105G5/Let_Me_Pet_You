package com.missingTrace.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class missingTraceJDBCDAO implements missingTraceDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO missing_trace(missing_case_id,memb_id) values (?,?)";
	private static final String GET_ALL_STMT = "SELECT missing_case_id,memb_id FROM missing_trace where memb_id =? ";
	private static final String DELETE = "DELETE FROM missing_trace where missing_case_id = ? and memb_id = ?";

	// 新增
	@Override
	public void insert(missingTraceVO missingTraceVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, missingTraceVO.getMissing_case_id());
			pstmt.setString(2, missingTraceVO.getMemb_id());

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
	public void insert(String missing_case_id, String memb_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, missing_case_id);
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
	public void delete(String missing_case_id, String memb_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, missing_case_id);
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
	public List<missingTraceVO> findByMember(String memb_id) {
		List<missingTraceVO> list = new ArrayList<missingTraceVO>();
		missingTraceVO missingTraceVO = null;

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
				missingTraceVO = new missingTraceVO();
				missingTraceVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingTraceVO.setMemb_id(rs.getString("memb_id"));
				list.add(missingTraceVO);

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
		missingTraceJDBCDAO dao = new missingTraceJDBCDAO();

		// 新增
//		missingTraceVO missingTraceVO1 = new missingTraceVO();
//		missingTraceVO1.setMissing_case_id("S000000001");
//		missingTraceVO1.setMemb_id("M000000009");
//		dao.insert(missingTraceVO1);

		// 新增II
//		dao.insert("S000000003", "M000000010");

		// 刪除
//		missingTraceVO missingTraceVO2 = new missingTraceVO();
//		dao.delete("S000000003", "M000000010");

		// 查詢
//		List<missingTraceVO> list = dao.findByMember("M000000003");
//		for (missingTraceVO mCase : list) {
//			System.out.print(mCase.getMissing_case_id() + ",");
//			System.out.println(mCase.getMemb_id());
//			System.out.println("------------------------------------");
//		}

	}
}
