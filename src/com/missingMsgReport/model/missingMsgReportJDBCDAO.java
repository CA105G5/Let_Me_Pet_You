package com.missingMsgReport.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class missingMsgReportJDBCDAO implements missingMsgReportDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO missing_msg_rt(missing_msg_rt_id,missing_msg_id,memb_id,missing_msg_rt_cont,missing_msg_rt_sta,missing_msg_rt_time) VALUES ('SMR'||LPAD(to_char(missing_msg_rt_seq.NEXTVAL), 7, '0'),  ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT missing_msg_rt_id,missing_msg_id,memb_id,missing_msg_rt_cont,missing_msg_rt_sta,to_char(missing_msg_rt_time,'yyyy-mm-dd hh24:mi:ss')missing_msg_rt_time FROM missing_msg_rt order by missing_msg_rt_id";
	private static final String GET_ONE_STMT = "SELECT missing_msg_rt_id,missing_msg_id,memb_id,missing_msg_rt_cont,missing_msg_rt_sta,to_char(missing_msg_rt_time,'yyyy-mm-dd hh24:mi:ss')missing_msg_rt_time FROM missing_msg_rt where missing_msg_id = ?";
	private static final String DELETE = "DELETE FROM missing_msg_rt where missing_msg_rt_id = ?";
	private static final String UPDATE = "UPDATE missing_msg_rt set missing_msg_id=?, memb_id=?, missing_msg_rt_cont=?, missing_msg_rt_sta=?, missing_msg_rt_time=? where missing_msg_rt_id = ?";
	private static final String UPDATE_STATUS = "UPDATE missing_msg_rt set missing_msg_rt_sta=? where missing_msg_rt_id=?";

	// 新增
	@Override
	public void insert(missingMsgReportVO missingMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, missingMsgReportVO.getMissing_msg_id());
			pstmt.setString(2, missingMsgReportVO.getMemb_id());
			pstmt.setString(3, missingMsgReportVO.getMissing_msg_rt_cont());
			pstmt.setString(4, missingMsgReportVO.getMissing_msg_rt_sta());
			pstmt.setTimestamp(5, missingMsgReportVO.getMissing_msg_rt_time());

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
	public void update(missingMsgReportVO missingMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, missingMsgReportVO.getMissing_msg_id());
			pstmt.setString(2, missingMsgReportVO.getMemb_id());
			pstmt.setString(3, missingMsgReportVO.getMissing_msg_rt_cont());
			pstmt.setString(4, missingMsgReportVO.getMissing_msg_rt_sta());
			pstmt.setTimestamp(5, missingMsgReportVO.getMissing_msg_rt_time());
			pstmt.setString(6, missingMsgReportVO.getMissing_msg_rt_id());

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
	public void delete(String missing_msg_rt_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, missing_msg_rt_id);

			pstmt.executeUpdate();

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

	// 修改狀態
	public void updateStatus(missingMsgReportVO missingMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STATUS);

			pstmt.setString(1, missingMsgReportVO.getMissing_msg_rt_sta());
			pstmt.setString(2, missingMsgReportVO.getMissing_msg_rt_id());

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
	public missingMsgReportVO findByPrimaryKey(String missing_msg_id) {

		missingMsgReportVO missingMsgReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, missing_msg_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingMsgReportVO = new missingMsgReportVO();
				missingMsgReportVO.setMissing_msg_rt_id(rs.getString("missing_msg_rt_id"));
				missingMsgReportVO.setMissing_msg_id(rs.getString("missing_msg_id"));
				missingMsgReportVO.setMemb_id(rs.getString("memb_id"));
				missingMsgReportVO.setMissing_msg_rt_cont(rs.getString("missing_msg_rt_cont"));
				missingMsgReportVO.setMissing_msg_rt_sta(rs.getString("missing_msg_rt_sta"));
				missingMsgReportVO.setMissing_msg_rt_time(rs.getTimestamp("missing_msg_rt_time"));
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
		return missingMsgReportVO;
	}

	// 查全部
	@Override
	public List<missingMsgReportVO> getAll() {
		List<missingMsgReportVO> list = new ArrayList<missingMsgReportVO>();
		missingMsgReportVO missingMsgReportVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingMsgReportVO = new missingMsgReportVO();
				missingMsgReportVO.setMissing_msg_rt_id(rs.getString("missing_msg_rt_id"));
				missingMsgReportVO.setMissing_msg_id(rs.getString("missing_msg_id"));
				missingMsgReportVO.setMemb_id(rs.getString("memb_id"));
				missingMsgReportVO.setMissing_msg_rt_cont(rs.getString("missing_msg_rt_cont"));
				missingMsgReportVO.setMissing_msg_rt_sta(rs.getString("missing_msg_rt_sta"));
				missingMsgReportVO.setMissing_msg_rt_time(rs.getTimestamp("missing_msg_rt_time"));
				list.add(missingMsgReportVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (

		SQLException se) {
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
		missingMsgReportJDBCDAO dao = new missingMsgReportJDBCDAO();

		// 新增
//		missingMsgReportVO missingMsgReportVO1 = new missingMsgReportVO();
//		missingMsgReportVO1.setMissing_msg_rt_id("SMR0000002");
//		missingMsgReportVO1.setMissing_msg_id("SM00000001");
//		missingMsgReportVO1.setMemb_id("M000000002");
//		missingMsgReportVO1.setMissing_msg_rt_cont("不雅文字喔");
//		missingMsgReportVO1.setMissing_msg_rt_sta("S1");
//		missingMsgReportVO1.setMissing_msg_rt_time(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		dao.insert(missingMsgReportVO1);

		// 修改
//		missingMsgReportVO missingMsgReportVO2 = new missingMsgReportVO();
//		missingMsgReportVO2.setMissing_msg_id("SM00000001");
//		missingMsgReportVO2.setMemb_id("M000000003");
//		missingMsgReportVO2.setMissing_msg_rt_cont("哈囉你好嗎");
//		missingMsgReportVO2.setMissing_msg_rt_sta("S0");
//		missingMsgReportVO2.setMissing_msg_rt_time(java.sql.Timestamp.valueOf("1999-07-20 14:24:00"));
//		missingMsgReportVO2.setMissing_msg_rt_id("SMR0000002");
//		dao.update(missingMsgReportVO2);

		// 刪除
//		dao.delete("SMR0000002");

		// 單獨查詢
//		missingMsgReportVO missingMsgReportVO3 = dao.findByPrimaryKey("SMR0000001");
//		System.out.print(missingMsgReportVO3.getMissing_msg_rt_id()+",");
//		System.out.print(missingMsgReportVO3.getMissing_msg_id()+",");
//		System.out.print(missingMsgReportVO3.getMemb_id()+",");
//		System.out.print(missingMsgReportVO3.getMissing_msg_rt_cont()+",");
//		System.out.print(missingMsgReportVO3.getMissing_msg_rt_sta()+",");
//		System.out.println(missingMsgReportVO3.getMissing_msg_rt_time());
//		System.out.println();

		// 查全部
		List<missingMsgReportVO> list = dao.getAll();
		for (missingMsgReportVO Msg : list) {
			System.out.print(Msg.getMissing_msg_rt_id() + ",");
			System.out.print(Msg.getMissing_msg_id() + ",");
			System.out.print(Msg.getMemb_id() + ",");
			System.out.print(Msg.getMissing_msg_rt_cont() + ",");
			System.out.print(Msg.getMissing_msg_rt_sta() + ",");
			System.out.println(Msg.getMissing_msg_rt_time());
			System.out.println();
		}

	}
}
