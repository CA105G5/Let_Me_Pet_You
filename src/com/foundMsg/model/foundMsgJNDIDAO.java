package com.foundMsg.model;

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

public class foundMsgJNDIDAO implements foundMsgDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO found_msg(fd_msg_id,fd_case_id,memb_id,fd_msg_date,fd_msg_cont) VALUES ('FM'||LPAD(to_char(found_msg_seq.NEXTVAL), 8, '0'), ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT fd_msg_id,fd_case_id,memb_id,to_char(fd_msg_date,'yyyy-mm-dd hh24:mi:ss')fd_msg_date,fd_msg_cont FROM found_msg order by fd_msg_id";
	private static final String GET_ONE_STMT = "SELECT fd_msg_id,fd_case_id,memb_id,to_char(fd_msg_date,'yyyy-mm-dd hh24:mi:ss')fd_msg_date,fd_msg_cont FROM found_msg where fd_msg_id = ?";
	private static final String DELETE = "DELETE FROM found_msg where fd_msg_id = ?";
	private static final String UPDATE = "UPDATE found_msg set fd_case_id=?, memb_id=?, fd_msg_date=?, fd_msg_cont=? where fd_msg_id = ?";

	// 新增
	@Override
	public void insert(foundMsgVO foundMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundMsgVO.getFd_case_id());
			pstmt.setString(2, foundMsgVO.getMemb_id());
			pstmt.setTimestamp(3, foundMsgVO.getFd_msg_date());
			pstmt.setString(4, foundMsgVO.getFd_msg_cont());

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
	public void update(foundMsgVO foundMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, foundMsgVO.getFd_case_id());
			pstmt.setString(2, foundMsgVO.getMemb_id());
			pstmt.setTimestamp(3, foundMsgVO.getFd_msg_date());
			pstmt.setString(4, foundMsgVO.getFd_msg_cont());
			pstmt.setString(5, foundMsgVO.getFd_msg_id());

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
	public void delete(String fd_msg_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, fd_msg_id);

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
	public foundMsgVO findByPrimaryKey(String fd_msg_id) {

		foundMsgVO foundMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, fd_msg_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundMsgVO = new foundMsgVO();
				foundMsgVO.setFd_msg_id(rs.getString("fd_msg_id"));
				foundMsgVO.setFd_case_id(rs.getString("fd_case_id"));
				foundMsgVO.setMemb_id(rs.getString("memb_id"));
				foundMsgVO.setFd_msg_date(rs.getTimestamp("fd_msg_date"));
				foundMsgVO.setFd_msg_cont(rs.getString("fd_msg_cont"));
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
		return foundMsgVO;
	}

	// 查全部
	@Override
	public List<foundMsgVO> getAll() {
		List<foundMsgVO> list = new ArrayList<foundMsgVO>();
		foundMsgVO foundMsgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundMsgVO = new foundMsgVO();
				foundMsgVO.setFd_msg_id(rs.getString("fd_msg_id"));
				foundMsgVO.setFd_case_id(rs.getString("fd_case_id"));
				foundMsgVO.setMemb_id(rs.getString("memb_id"));
				foundMsgVO.setFd_msg_date(rs.getTimestamp("fd_msg_date"));
				foundMsgVO.setFd_msg_cont(rs.getString("fd_msg_cont"));
				list.add(foundMsgVO);
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
		return list;
	}

}
