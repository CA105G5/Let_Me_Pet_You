package com.reportMissing.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.missingCase.model.missingCaseVO;

public class reportMissingJDBCDAO implements reportMissingDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO report_missing(report_missing_id,missing_case_id,memb_id,report_missing_cont,report_missing_sta,report_missing_time) VALUES ('RS'||LPAD(to_char(report_missing_seq.NEXTVAL), 8, '0'), ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT report_missing_id,missing_case_id,memb_id,report_missing_cont,report_missing_sta,to_char(report_missing_time,'yyyy-mm-dd hh24:mi:ss')report_missing_time FROM report_missing order by report_missing_id";
	private static final String GET_ONE_STMT = "SELECT report_missing_id,missing_case_id,memb_id,report_missing_cont,report_missing_sta,to_char(report_missing_time,'yyyy-mm-dd hh24:mi:ss')report_missing_time FROM report_missing where report_missing_id = ?";
	private static final String DELETE = "DELETE FROM  report_missing where  report_missing_id = ?";
	private static final String UPDATE = "UPDATE  report_missing set missing_case_id=?, memb_id=?, report_missing_cont=?, report_missing_sta=?, report_missing_time=? where report_missing_id = ?";
	private static final String UPDATE_STATUS = "UPDATE report_missing set report_missing_sta=? where report_missing_id=?";

	
	// 新增
	@Override
	public void insert(reportMissingVO reportMissingVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, reportMissingVO.getMissing_case_id());
			pstmt.setString(2, reportMissingVO.getMemb_id());
			pstmt.setString(3, reportMissingVO.getReport_missing_cont());
			pstmt.setString(4, reportMissingVO.getReport_missing_sta());
			pstmt.setTimestamp(5, reportMissingVO.getReport_missing_time());

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

	// 修改
	@Override
	public void update(reportMissingVO reportMissingVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, reportMissingVO.getMissing_case_id());
			pstmt.setString(2, reportMissingVO.getMemb_id());
			pstmt.setString(3, reportMissingVO.getReport_missing_cont());
			pstmt.setString(4, reportMissingVO.getReport_missing_sta());
			pstmt.setTimestamp(5, reportMissingVO.getReport_missing_time());
			pstmt.setString(6, reportMissingVO.getReport_missing_id());

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
	public void delete(String report_missing_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, report_missing_id);

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

	//修改狀態
	public void updateStatus(reportMissingVO reportMissingVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STATUS);
			
			pstmt.setString(1, reportMissingVO.getReport_missing_sta());
			pstmt.setString(2, reportMissingVO.getReport_missing_id());
			
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

	
	// 單獨查詢
	@Override
	public reportMissingVO findByPrimaryKey(String report_missing_id) {

		reportMissingVO reportMissingVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, report_missing_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				reportMissingVO = new reportMissingVO();
				reportMissingVO.setReport_missing_id(rs.getString("report_missing_id"));
				reportMissingVO.setMissing_case_id(rs.getString("missing_case_id"));
				reportMissingVO.setMemb_id(rs.getString("memb_id"));
				reportMissingVO.setReport_missing_cont(rs.getString("report_missing_cont"));
				reportMissingVO.setReport_missing_sta(rs.getString("report_missing_sta"));
				reportMissingVO.setReport_missing_time(rs.getTimestamp("report_missing_time"));
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
		return reportMissingVO;
	}

	// 查全部
	@Override
	public List<reportMissingVO> getAll() {
		List<reportMissingVO> list = new ArrayList<reportMissingVO>();
		reportMissingVO reportMissingVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				reportMissingVO = new reportMissingVO();
				reportMissingVO.setReport_missing_id(rs.getString("report_missing_id"));
				reportMissingVO.setMissing_case_id(rs.getString("missing_case_id"));
				reportMissingVO.setMemb_id(rs.getString("memb_id"));
				reportMissingVO.setReport_missing_cont(rs.getString("report_missing_cont"));
				reportMissingVO.setReport_missing_sta(rs.getString("report_missing_sta"));
				reportMissingVO.setReport_missing_time(rs.getTimestamp("report_missing_time"));
				list.add(reportMissingVO);
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
		reportMissingJDBCDAO dao = new reportMissingJDBCDAO();

		// 新增
//		reportMissingVO reportMissingVO1 = new reportMissingVO();
//		reportMissingVO1.setMissing_case_id("S000000001");
//		reportMissingVO1.setMemb_id("M000000005");
//		reportMissingVO1.setReport_missing_cont("圖文不符");
//		reportMissingVO1.setReport_missing_sta("R1");
//		reportMissingVO1.setReport_missing_time(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		dao.insert(reportMissingVO1);

		// 修改
//		reportMissingVO reportMissingVO2 = new reportMissingVO();
//		reportMissingVO2.setMissing_case_id("S000000004");
//		reportMissingVO2.setMemb_id("M000000004");
//		reportMissingVO2.setReport_missing_cont("留言位置錯了吧");
//		reportMissingVO2.setReport_missing_sta("R1");
//		reportMissingVO2.setReport_missing_time(java.sql.Timestamp.valueOf("2018-12-15 13:56:00"));
//		reportMissingVO2.setReport_missing_id("RS00000001");
//		dao.update(reportMissingVO2);

		// 刪除
//		dao.delete("RS00000003");

		// 單獨查詢
//		reportMissingVO reportMissingVO3 = dao.findByPrimaryKey("RS00000001");
//		System.out.print(reportMissingVO3.getReport_missing_id()+",");
//		System.out.print(reportMissingVO3.getMissing_case_id()+",");
//		System.out.print(reportMissingVO3.getMemb_id()+",");
//		System.out.print(reportMissingVO3.getReport_missing_cont()+",");
//		System.out.print(reportMissingVO3.getReport_missing_sta()+",");
//		System.out.println(reportMissingVO3.getReport_missing_time());
//		System.out.println("------------------------------------------------------------------------");

		// 查全部
//		List<reportMissingVO> list = dao.getAll();
//		for (reportMissingVO rMis : list) {
//			System.out.print(rMis.getReport_missing_id() + ",");
//			System.out.print(rMis.getMissing_case_id() + ",");
//			System.out.print(rMis.getMemb_id() + ",");
//			System.out.print(rMis.getReport_missing_cont() + ",");
//			System.out.print(rMis.getReport_missing_sta() + ",");
//			System.out.println(rMis.getReport_missing_time());
//			System.out.println("------------------------------------------------------------------------");
//		}
	}

}
