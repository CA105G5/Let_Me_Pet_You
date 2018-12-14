package com.foundMsg.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.missingMsg.model.missingMsgVO;

public class foundMsgJDBCDAO implements foundMsgDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "juber";
	String passwd = "123456";

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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, foundMsgVO.getFd_case_id());
			pstmt.setString(2, foundMsgVO.getMemb_id());
			pstmt.setTimestamp(3, foundMsgVO.getFd_msg_date());
			pstmt.setString(4, foundMsgVO.getFd_msg_cont());

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
	public void update(foundMsgVO foundMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, foundMsgVO.getFd_case_id());
			pstmt.setString(2, foundMsgVO.getMemb_id());
			pstmt.setTimestamp(3, foundMsgVO.getFd_msg_date());
			pstmt.setString(4, foundMsgVO.getFd_msg_cont());
			pstmt.setString(5, foundMsgVO.getFd_msg_id());

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
	public void delete(String fd_msg_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, fd_msg_id);

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
	public foundMsgVO findByPrimaryKey(String fd_msg_id) {

		foundMsgVO foundMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
		foundMsgJDBCDAO dao = new foundMsgJDBCDAO();
		
		//新增
//		foundMsgVO foundMsgVO1 = new foundMsgVO();
//		foundMsgVO1.setFd_case_id("F000000001");
//		foundMsgVO1.setMemb_id("M000000005");
//		foundMsgVO1.setFd_msg_date(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		foundMsgVO1.setFd_msg_cont("好可愛的示威");
//		dao.insert(foundMsgVO1);
		
		//修改
//		foundMsgVO foundMsgVO2 = new foundMsgVO();
//		foundMsgVO2.setFd_case_id("F000000002");
//		foundMsgVO2.setMemb_id("M000000005");
//		foundMsgVO2.setFd_msg_date(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		foundMsgVO2.setFd_msg_cont("好可愛的示威");
//		foundMsgVO2.setFd_msg_id("FM00000002");
//		dao.update(foundMsgVO2);
		
		//刪除
//		dao.delete("FM00000002");
		
		//單獨查詢
//		foundMsgVO foundMsgVO3 = dao.findByPrimaryKey("FM00000003");
//		System.out.print(foundMsgVO3.getFd_msg_id() + ",");
//		System.out.print(foundMsgVO3.getFd_case_id() + ",");
//		System.out.print(foundMsgVO3.getMemb_id() + ",");
//		System.out.print(foundMsgVO3.getFd_msg_date() + ",");
//		System.out.println(foundMsgVO3.getFd_msg_cont());
//		System.out.println();

		//查全部
		List<foundMsgVO> list = dao.getAll();
		for (foundMsgVO fm : list) {
			System.out.print(fm.getFd_msg_id() + ",");
			System.out.print(fm.getFd_case_id() + ",");
			System.out.print(fm.getMemb_id() + ",");
			System.out.print(fm.getFd_msg_date() + ",");
			System.out.println(fm.getFd_msg_cont());
			System.out.println();

		}
	}
}
