package com.foundApply.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.missingTrace.model.missingTraceVO;

public class foundApplyJDBCDAO implements foundApplyDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "juber";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO found_Apply(fd_case_id,memb_id,fd_apply_status,fd_apply_des,fd_apply_rv_des) values (?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT fd_case_id,memb_id,fd_apply_status,fd_apply_des,fd_apply_rv_des FROM found_apply where fd_case_id =? ";
	private static final String DELETE = "DELETE FROM found_apply where fd_case_id = ? and memb_id = ?";

	// 新增
	@Override
	public void insert(foundApplyVO foundApplyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundApplyVO.getFd_case_id());
			pstmt.setString(2, foundApplyVO.getMemb_id());
			pstmt.setString(3, foundApplyVO.getFd_apply_status());
			pstmt.setString(4, foundApplyVO.getFd_apply_des());
			pstmt.setString(5, foundApplyVO.getFd_apply_rv_des());

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
	public List<foundApplyVO> findByCase(String fd_case_id) {
		List<foundApplyVO> list = new ArrayList<foundApplyVO>();
		foundApplyVO foundApplyVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
		foundApplyJDBCDAO dao = new foundApplyJDBCDAO();

		// 新增
//		foundApplyVO foundApplyVO1 = new foundApplyVO();
//		foundApplyVO1.setFd_case_id("F000000003");
//		foundApplyVO1.setMemb_id("M000000008");
//		foundApplyVO1.setFd_apply_status("F0");
//		foundApplyVO1.setFd_apply_des("那是我的狗");
//		foundApplyVO1.setFd_apply_rv_des("恭喜申請成功");
//		dao.insert(foundApplyVO1);

		// 刪除
//		foundApplyVO foundApplyVO2 =  new foundApplyVO();
//		dao.delete("F000000003","M000000008");

		// 查詢
		List<foundApplyVO> list = dao.findByCase("F000000001");
		for (foundApplyVO fa : list) {
			System.out.print(fa.getFd_case_id() + ",");
			System.out.print(fa.getMemb_id() + ",");
			System.out.print(fa.getFd_apply_status() + ",");
			System.out.print(fa.getFd_apply_des() + ",");
			System.out.print(fa.getFd_apply_rv_des() + ",");
			System.out.println();
		}

	}
}
