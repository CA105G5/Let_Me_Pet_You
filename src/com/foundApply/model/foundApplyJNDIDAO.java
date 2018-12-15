package com.foundApply.model;

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

public class foundApplyJNDIDAO implements foundApplyDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO found_Apply(fd_case_id,memb_id,fd_apply_status,fd_apply_des,fd_apply_rv_des) values (?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT fd_case_id,memb_id,fd_apply_status,fd_apply_des,fd_apply_rv_des FROM found_apply where fd_case_id =? ";
	private static final String DELETE = "DELETE FROM found_apply where fd_case_id = ? and memb_id = ?";

	// 新增
	@Override
	public void insert(foundApplyVO foundApplyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundApplyVO.getFd_case_id());
			pstmt.setString(2, foundApplyVO.getMemb_id());
			pstmt.setString(3, foundApplyVO.getFd_apply_status());
			pstmt.setString(4, foundApplyVO.getFd_apply_des());
			pstmt.setString(5, foundApplyVO.getFd_apply_rv_des());

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
	public void delete(String fd_case_id, String memb_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, fd_case_id);
			pstmt.setString(2, memb_id);

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

	// 查詢
	@Override
	public List<foundApplyVO> findByCase(String fd_case_id) {
		List<foundApplyVO> list = new ArrayList<foundApplyVO>();
		foundApplyVO foundApplyVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);

			pstmt.setString(1, fd_case_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				foundApplyVO = new foundApplyVO();
				foundApplyVO.setFd_case_id(rs.getString("fd_case_id"));
				foundApplyVO.setMemb_id(rs.getString("memb_id"));
				foundApplyVO.setFd_apply_status(rs.getString("fd_apply_status"));
				foundApplyVO.setFd_apply_des(rs.getString("fd_apply_des"));
				foundApplyVO.setFd_apply_rv_des(rs.getString("fd_apply_rv_des"));
				list.add(foundApplyVO);

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
