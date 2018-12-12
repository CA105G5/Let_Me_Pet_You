package com.prodtrack.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProdTrackJDBCDAO implements ProdTrackDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "Jen";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO prod_track (PROD_ID, MEMB_ID) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT PROD_ID, MEMB_ID FROM prod_track order by PROD_ID";
	private static final String GET_ONE_STMT = "SELECT PROD_ID, MEMB_ID FROM prod_track where MEMB_ID=?";
	private static final String DELETE = "DELETE FROM prod_track where PROD_ID=? and MEMB_ID=?";
	private static final String UPDATE = "UPDATE PROD_TRACK set PROD_ID=?, MEMB_ID=? where PROD_ID=? and MEMB_ID=?";

	@Override
	public void insert(ProdTrackVO prodTrackVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, prodTrackVO.getProd_id());
			pstmt.setString(2, prodTrackVO.getMemb_id());

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
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

//	@Override //修改(其實不需要這個，因為兩個都是主鍵)
//	public void update(ProdTrackVO prodTrackVO) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(UPDATE);
//
//			pstmt.setString(1, prodTrackVO.getProd_id());
//			pstmt.setString(2, prodTrackVO.getMemb_id());
//			pstmt.setString(3, prodTrackVO.getProd_id());
//			pstmt.setString(4, prodTrackVO.getMemb_id());
//
//			int rowsUpdated = pstmt.executeUpdate();
//
//			System.out.println("Changed " + rowsUpdated + "rows");
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//
//	}

	@Override
	public ProdTrackVO findByPrimaryKey(String memb_id) {
		ProdTrackVO prodTrackVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, memb_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				prodTrackVO = new ProdTrackVO();
				prodTrackVO.setProd_id(rs.getString("prod_id"));
				prodTrackVO.setMemb_id(memb_id);
			}

			// Handle any driver errors
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
		return prodTrackVO;

	}

	@Override
	public List<ProdTrackVO> getAll() {
		List<ProdTrackVO> list = new ArrayList<ProdTrackVO>();
		ProdTrackVO prodTrackVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ProdTrackVO 也稱為 Domain objects
				prodTrackVO = new ProdTrackVO();
				prodTrackVO.setProd_id(rs.getString("prod_id"));
				prodTrackVO.setMemb_id(rs.getString("memb_id"));
				list.add(prodTrackVO); // Store the row in the list
			}

			// Handle any driver errors
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

	@Override
	public void delete(String prod_id, String memb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, prod_id);
			pstmt.setString(2, memb_id);

			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
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

	public static void main(String[] args) {

		ProdTrackJDBCDAO dao = new ProdTrackJDBCDAO();

		// 新增
		ProdTrackVO prodTrackVO1 = new ProdTrackVO();
		prodTrackVO1.setProd_id("P000000001");
		prodTrackVO1.setMemb_id("M000000001");
		dao.insert(prodTrackVO1);

		// 修改(其實不需要這個，因為兩個都是主鍵)
//		ProdTrackVO prodTrackVO2 = new ProdTrackVO();
//		prodTrackVO2.setProd_id("P000000001");
//		prodTrackVO2.setMemb_id("M000000001");
//		dao.update(prodTrackVO2);
//
		// 刪除
		dao.delete("P000000001","M000000001");

		// 查詢
		ProdTrackVO prodTrackVO3 = dao.findByPrimaryKey("M000000001");
		System.out.print(prodTrackVO3.getProd_id() + ",");
		System.out.print(prodTrackVO3.getMemb_id() + ",");
		System.out.println("---------------------");

		// 查詢
		List<ProdTrackVO> list = dao.getAll();
		for (ProdTrackVO aProdTrack : list) {
			System.out.print(aProdTrack.getProd_id() + ",");
			System.out.print(aProdTrack.getMemb_id() + ",");
			System.out.println();
		}
	}

}
