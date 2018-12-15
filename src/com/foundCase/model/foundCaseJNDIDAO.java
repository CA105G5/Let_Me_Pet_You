package com.foundCase.model;

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

public class foundCaseJNDIDAO implements foundCaseDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO found_case(fd_case_id,memb_id,fd_date,fd_name,fd_des,fd_status,fd_status_rv_des,fd_loc,fd_status_shelve,fd_etime) VALUES ('F'||LPAD(to_char(found_case_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT fd_case_id,memb_id,to_char(fd_date,'yyyy-mm-dd hh24:mi:ss')fd_date,fd_name,fd_des,fd_status,fd_status_rv_des,fd_loc,fd_status_shelve,fd_etime FROM found_case order by fd_case_id";
	private static final String GET_ONE_STMT = "SELECT fd_case_id,memb_id,to_char(fd_date,'yyyy-mm-dd hh24:mi:ss')fd_date,fd_name,fd_des,fd_status,fd_status_rv_des,fd_loc,fd_status_shelve,fd_etime FROM found_case where fd_case_id = ?";
	private static final String DELETE = "DELETE FROM found_case where fd_case_id = ?";
	private static final String UPDATE = "UPDATE found_case set memb_id=?, fd_date=?,fd_name=?, fd_des=?, fd_status=?,fd_status_rv_des=?, fd_loc=?,fd_status_shelve=?,fd_etime=? where fd_case_id = ?";

	// 新增
	@Override
	public void insert(foundCaseVO foundCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundCaseVO.getMemb_id());
			pstmt.setTimestamp(2, foundCaseVO.getFd_date());
			pstmt.setString(3, foundCaseVO.getFd_name());
			pstmt.setString(4, foundCaseVO.getFd_des());
			pstmt.setString(5, foundCaseVO.getFd_status());
			pstmt.setString(6, foundCaseVO.getFd_status_rv_des());
			pstmt.setString(7, foundCaseVO.getFd_loc());
			pstmt.setString(8, foundCaseVO.getFd_status_shelve());
			pstmt.setTimestamp(9, foundCaseVO.getFd_etime());

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
	public void update(foundCaseVO foundCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, foundCaseVO.getMemb_id());
			pstmt.setTimestamp(2, foundCaseVO.getFd_date());
			pstmt.setString(3, foundCaseVO.getFd_name());
			pstmt.setString(4, foundCaseVO.getFd_des());
			pstmt.setString(5, foundCaseVO.getFd_status());
			pstmt.setString(6, foundCaseVO.getFd_status_rv_des());
			pstmt.setString(7, foundCaseVO.getFd_loc());
			pstmt.setString(8, foundCaseVO.getFd_status_shelve());
			pstmt.setTimestamp(9, foundCaseVO.getFd_etime());
			pstmt.setString(10, foundCaseVO.getFd_case_id());

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
	public void delete(String fd_case_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, fd_case_id);

			pstmt.execute();

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
	public foundCaseVO findByPrimaryKey(String fd_case_id) {
		foundCaseVO foundCaseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, fd_case_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundCaseVO = new foundCaseVO();
				foundCaseVO.setFd_case_id(rs.getString("fd_case_id"));
				foundCaseVO.setMemb_id(rs.getString("memb_id"));
				foundCaseVO.setFd_date(rs.getTimestamp("fd_date"));
				foundCaseVO.setFd_name(rs.getString("fd_name"));
				foundCaseVO.setFd_des(rs.getString("fd_des"));
				foundCaseVO.setFd_status(rs.getString("fd_status"));
				foundCaseVO.setFd_status_rv_des(rs.getString("fd_status_rv_des"));
				foundCaseVO.setFd_loc(rs.getString("fd_loc"));
				foundCaseVO.setFd_status_shelve(rs.getString("fd_status_shelve"));
				foundCaseVO.setFd_etime(rs.getTimestamp("fd_etime"));

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

		return foundCaseVO;
	}

	@Override
	public List<foundCaseVO> getAll() {
		List<foundCaseVO> list = new ArrayList<foundCaseVO>();
		foundCaseVO foundCaseVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundCaseVO = new foundCaseVO();
				foundCaseVO.setFd_case_id(rs.getString("fd_case_id"));
				foundCaseVO.setMemb_id(rs.getString("memb_id"));
				foundCaseVO.setFd_date(rs.getTimestamp("fd_date"));
				foundCaseVO.setFd_name(rs.getString("fd_name"));
				foundCaseVO.setFd_des(rs.getString("fd_des"));
				foundCaseVO.setFd_status(rs.getString("fd_status"));
				foundCaseVO.setFd_status_rv_des(rs.getString("fd_status_rv_des"));
				foundCaseVO.setFd_loc(rs.getString("fd_loc"));
				foundCaseVO.setFd_status_shelve(rs.getString("fd_status_shelve"));
				foundCaseVO.setFd_etime(rs.getTimestamp("fd_etime"));
				list.add(foundCaseVO);
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
