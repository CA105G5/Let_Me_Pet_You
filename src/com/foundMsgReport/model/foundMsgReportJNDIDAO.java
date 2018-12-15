package com.foundMsgReport.model;

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

public class foundMsgReportJNDIDAO implements foundMsgReportDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundMsgReportVO.getFd_msg_id());
			pstmt.setString(2, foundMsgReportVO.getMemb_id());
			pstmt.setString(3, foundMsgReportVO.getFd_msg_rt_cont());
			pstmt.setString(4, foundMsgReportVO.getFd_msg_rt_sta());
			pstmt.setTimestamp(5, foundMsgReportVO.getFd_msg_rt_time());

			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, foundMsgReportVO.getFd_msg_id());
			pstmt.setString(2, foundMsgReportVO.getMemb_id());
			pstmt.setString(3, foundMsgReportVO.getFd_msg_rt_cont());
			pstmt.setString(4, foundMsgReportVO.getFd_msg_rt_sta());
			pstmt.setTimestamp(5, foundMsgReportVO.getFd_msg_rt_time());
			pstmt.setString(6, foundMsgReportVO.getFd_msg_rt_id());

			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, fd_msg_rt_id);

			pstmt.executeUpdate();

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

			con = ds.getConnection();
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
			con = ds.getConnection();
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

}
