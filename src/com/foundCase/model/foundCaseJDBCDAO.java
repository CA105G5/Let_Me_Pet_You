package com.foundCase.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.missingCase.model.missingCaseVO;

public class foundCaseJDBCDAO implements foundCaseDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "juber";
	String passwd = "123456";

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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
	public void update(foundCaseVO foundCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
	public void delete(String fd_case_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, fd_case_id);

			pstmt.execute();

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
	public foundCaseVO findByPrimaryKey(String fd_case_id) {
		foundCaseVO foundCaseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
		foundCaseJDBCDAO dao = new foundCaseJDBCDAO();

		// 新增
//		foundCaseVO foundCaseVO1 = new foundCaseVO();
//		foundCaseVO1.setFd_case_id("F000000003");
//		foundCaseVO1.setMemb_id("M000000008");
//		foundCaseVO1.setFd_date(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		foundCaseVO1.setFd_name("巴巴");
//		foundCaseVO1.setFd_des("路邊撿到的");
//		foundCaseVO1.setFd_status("F0");
//		foundCaseVO1.setFd_status_rv_des("不是自己的希望能上架");
//		foundCaseVO1.setFd_loc("中央大學");
//		foundCaseVO1.setFd_status_shelve("S0");
//		foundCaseVO1.setFd_etime(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		dao.insert(foundCaseVO1);

		// 修改
//		foundCaseVO foundCaseVO2 = new foundCaseVO();
//		foundCaseVO2.setMemb_id("M000000007");
//		foundCaseVO2.setFd_date(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		foundCaseVO2.setFd_name("巴巴");
//		foundCaseVO2.setFd_des("路邊撿到的");
//		foundCaseVO2.setFd_status("F0");
//		foundCaseVO2.setFd_status_rv_des("不是自己的希望能上架");
//		foundCaseVO2.setFd_loc("中央大學");
//		foundCaseVO2.setFd_status_shelve("S0");
//		foundCaseVO2.setFd_etime(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		foundCaseVO2.setFd_case_id("F000000003");
//		dao.update(foundCaseVO2);

		// 刪除
//		dao.delete("F000000004");

		// 單獨查詢
//		foundCaseVO foundCaseVO3 = dao.findByPrimaryKey("F000000001");
//		System.out.print(foundCaseVO3.getFd_case_id() + ",");
//		System.out.print(foundCaseVO3.getMemb_id() + ",");
//		System.out.print(foundCaseVO3.getFd_date() + ",");
//		System.out.print(foundCaseVO3.getFd_name() + ",");
//		System.out.print(foundCaseVO3.getFd_des() + ",");
//		System.out.print(foundCaseVO3.getFd_status() + ",");
//		System.out.print(foundCaseVO3.getFd_status_rv_des() + ",");
//		System.out.print(foundCaseVO3.getFd_loc() + ",");
//		System.out.print(foundCaseVO3.getFd_status_shelve() + ",");
//		System.out.println(foundCaseVO3.getFd_etime());

		// 查全部
		List<foundCaseVO> list = dao.getAll();
		for (foundCaseVO fCase : list) {
			System.out.print(fCase.getFd_case_id() + ",");
			System.out.print(fCase.getMemb_id() + ",");
			System.out.print(fCase.getFd_date() + ",");
			System.out.print(fCase.getFd_name() + ",");
			System.out.print(fCase.getFd_des() + ",");
			System.out.print(fCase.getFd_status() + ",");
			System.out.print(fCase.getFd_status_rv_des() + ",");
			System.out.print(fCase.getFd_loc() + ",");
			System.out.print(fCase.getFd_status_shelve() + ",");
			System.out.println(fCase.getFd_etime());
			System.out.println();
		}
	}

}
