package com.foundMsgReport.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.missingMsgReport.model.missingMsgReportVO;

public class foundMsgReportJDBCDAO implements foundMsgReportDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "juber";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO found_msg_rt(fd_msg_rt_id,fd_msg_id,memb_id,fd_msg_rt_cont,fd_msg_rt_sta,fd_msg_rt_time) VALUES ('FMR'||LPAD(to_char(missing_msg_rt_seq.NEXTVAL), 7, '0'),  ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT fd_msg_rt_id,fd_msg_id,memb_id,fd_msg_rt_cont,fd_msg_rt_sta,to_char(fd_msg_rt_time,'yyyy-mm-dd hh24:mi:ss')fd_msg_rt_time FROM found_msg_rt order by fd_msg_rt_id";
	private static final String GET_ONE_STMT = "SELECT fd_msg_rt_id,fd_msg_id,memb_id,fd_msg_rt_cont,fd_msg_rt_sta,to_char(fd_msg_rt_time,'yyyy-mm-dd hh24:mi:ss')fd_msg_rt_time FROM found_msg_rt where fd_msg_rt_id = ?";
	private static final String DELETE = "DELETE FROM found_msg_rt where fd_msg_rt_id = ?";
	private static final String UPDATE = "UPDATE found_msg_rt set fd_msg_id=?, memb_id=?, fd_msg_rt_cont=?, fd_msg_rt_sta=?, fd_msg_rt_time=? where fd_msg_rt_id = ?";

	// 新增
	@Override
	public void insert(foundMsgReportVO foundMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundMsgReportVO.getFd_msg_id());
			pstmt.setString(2, foundMsgReportVO.getMemb_id());
			pstmt.setString(3, foundMsgReportVO.getFd_msg_rt_cont());
			pstmt.setString(4, foundMsgReportVO.getFd_msg_rt_sta());
			pstmt.setTimestamp(5, foundMsgReportVO.getFd_msg_rt_time());

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
	public void update(foundMsgReportVO foundMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, foundMsgReportVO.getFd_msg_id());
			pstmt.setString(2, foundMsgReportVO.getMemb_id());
			pstmt.setString(3, foundMsgReportVO.getFd_msg_rt_cont());
			pstmt.setString(4, foundMsgReportVO.getFd_msg_rt_sta());
			pstmt.setTimestamp(5, foundMsgReportVO.getFd_msg_rt_time());
			pstmt.setString(6, foundMsgReportVO.getFd_msg_rt_id());

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
	public void delete(String fd_msg_rt_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, fd_msg_rt_id);

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

	// 單獨查詢
	@Override
	public foundMsgReportVO findByPrimaryKey(String fd_msg_rt_id) {

		foundMsgReportVO foundMsgReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, fd_msg_rt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundMsgReportVO = new foundMsgReportVO();
				foundMsgReportVO.setFd_msg_rt_id(rs.getString("fd_msg_rt_id"));
				foundMsgReportVO.setFd_msg_id(rs.getString("fd_msg_id"));
				foundMsgReportVO.setMemb_id(rs.getString("memb_id"));
				foundMsgReportVO.setFd_msg_rt_cont(rs.getString("fd_msg_rt_cont"));
				foundMsgReportVO.setFd_msg_rt_sta(rs.getString("fd_msg_rt_sta"));
				foundMsgReportVO.setFd_msg_rt_time(rs.getTimestamp("fd_msg_rt_time"));
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
		return foundMsgReportVO;
	}

	// 查全部
	@Override
	public List<foundMsgReportVO> getAll() {
		List<foundMsgReportVO> list = new ArrayList<foundMsgReportVO>();
		foundMsgReportVO foundMsgReportVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundMsgReportVO = new foundMsgReportVO();
				foundMsgReportVO.setFd_msg_rt_id(rs.getString("fd_msg_rt_id"));
				foundMsgReportVO.setFd_msg_id(rs.getString("fd_msg_id"));
				foundMsgReportVO.setMemb_id(rs.getString("memb_id"));
				foundMsgReportVO.setFd_msg_rt_cont(rs.getString("fd_msg_rt_cont"));
				foundMsgReportVO.setFd_msg_rt_sta(rs.getString("fd_msg_rt_sta"));
				foundMsgReportVO.setFd_msg_rt_time(rs.getTimestamp("fd_msg_rt_time"));
				list.add(foundMsgReportVO);
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
		foundMsgReportJDBCDAO dao = new foundMsgReportJDBCDAO();
		
		//新增
//		foundMsgReportVO foundMsgReportVO1 = new foundMsgReportVO();
//		foundMsgReportVO1.setFd_msg_rt_id("FMR0000002");
//		foundMsgReportVO1.setFd_msg_id("FM00000001");
//		foundMsgReportVO1.setMemb_id("M000000002");
//		foundMsgReportVO1.setFd_msg_rt_cont("不雅文字喔");
//		foundMsgReportVO1.setFd_msg_rt_sta("F1");
//		foundMsgReportVO1.setFd_msg_rt_time(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		dao.insert(foundMsgReportVO1);
		
		//修改
//		foundMsgReportVO foundMsgReportVO2 = new foundMsgReportVO();
//		foundMsgReportVO2.setFd_msg_id("FM00000001");
//		foundMsgReportVO2.setMemb_id("M000000002");
//		foundMsgReportVO2.setFd_msg_rt_cont("不雅文字喔33");
//		foundMsgReportVO2.setFd_msg_rt_sta("F1");
//		foundMsgReportVO2.setFd_msg_rt_time(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		foundMsgReportVO2.setFd_msg_rt_id("FMR0000001");
//		dao.update(foundMsgReportVO2);
	
		//刪除
//		dao.delete("FMR0000001");
		
		//單獨查詢
//		foundMsgReportVO foundMsgReportVO3 = dao.findByPrimaryKey("FMR0000002");
//		System.out.print(foundMsgReportVO3.getFd_msg_rt_id()+",");
//		System.out.print(foundMsgReportVO3.getFd_msg_id()+",");
//		System.out.print(foundMsgReportVO3.getMemb_id()+",");
//		System.out.print(foundMsgReportVO3.getFd_msg_rt_cont()+",");
//		System.out.print(foundMsgReportVO3.getFd_msg_rt_sta()+",");
//		System.out.println(foundMsgReportVO3.getFd_msg_rt_time());
//		System.out.println();

		//查全部
		List<foundMsgReportVO> list = dao.getAll();
		for (foundMsgReportVO Msg : list) {
			System.out.print(Msg.getFd_msg_rt_id()+",");
			System.out.print(Msg.getFd_msg_id()+",");
			System.out.print(Msg.getMemb_id()+",");
			System.out.print(Msg.getFd_msg_rt_cont()+",");
			System.out.print(Msg.getFd_msg_rt_sta()+",");
			System.out.println(Msg.getFd_msg_rt_time());
			System.out.println();
		}
	}
}
