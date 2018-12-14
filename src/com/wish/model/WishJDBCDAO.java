package com.wish.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WishJDBCDAO implements WishDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO wish (WISH_ID, WISH_NAME, WISH_DES, WISH_QTY, WISH_STOCK, WISH_DATE, WISH_STATUS, WISH_COIN) VALUES ('W'||LPAD(to_char(wish_id_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT WISH_ID, WISH_NAME, WISH_DES, WISH_QTY, WISH_STOCK, WISH_DATE, WISH_STATUS, WISH_COIN FROM wish order by wish_ID";
	private static final String GET_ONE_STMT = "SELECT WISH_ID, WISH_NAME, WISH_DES, WISH_QTY, WISH_STOCK, WISH_DATE, WISH_STATUS, WISH_COIN FROM wish where wish_ID = ?";
	private static final String DELETE = "DELETE FROM wish where wish_id = ?";
	private static final String UPDATE = "UPDATE wish set WISH_NAME=?, WISH_DES=?, WISH_QTY=?, WISH_STOCK=?, WISH_DATE=?, WISH_STATUS=?, WISH_COIN=? where wish_id = ?";

	@Override
	public void insert(WishVO wishVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, wishVO.getWish_name());
			pstmt.setString(2, wishVO.getWish_des());
			pstmt.setInt(3, wishVO.getWish_qty());
			pstmt.setInt(4, wishVO.getWish_stock());
			pstmt.setTimestamp(5, wishVO.getWish_date());
			pstmt.setString(6, wishVO.getWish_status());
			pstmt.setInt(7, wishVO.getWish_coin());

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

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

	@Override
	public void update(WishVO wishVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, wishVO.getWish_name());
			pstmt.setString(2, wishVO.getWish_des());
			pstmt.setInt(3, wishVO.getWish_qty());
			pstmt.setInt(4, wishVO.getWish_stock());
			pstmt.setTimestamp(5, wishVO.getWish_date());
			pstmt.setString(6, wishVO.getWish_status());
			pstmt.setInt(7, wishVO.getWish_coin());
			pstmt.setString(8, wishVO.getWish_id());

			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

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

	@Override
	public WishVO findByPrimaryKey(String wish_id) {
		WishVO wishVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, wish_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				wishVO = new WishVO();
				wishVO.setWish_id(wish_id);
				wishVO.setWish_name(rs.getString("wish_name"));
				wishVO.setWish_des(rs.getString("wish_des"));
				wishVO.setWish_qty(rs.getInt("wish_qty"));
				wishVO.setWish_stock(rs.getInt("wish_stock"));
				wishVO.setWish_date(rs.getTimestamp("wish_date"));
				wishVO.setWish_status(rs.getString("wish_status"));
				wishVO.setWish_coin(rs.getInt("wish_coin"));
			}

			// Handle any driver errors
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
		return wishVO;

	}

	@Override
	public List<WishVO> getAll() {
		List<WishVO> list = new ArrayList<WishVO>();
		WishVO wishVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// WishVO 也稱為 Domain objects
				wishVO = new WishVO();
				wishVO.setWish_id(rs.getString("wish_id"));
				wishVO.setWish_name(rs.getString("wish_name"));
				wishVO.setWish_des(rs.getString("wish_des"));
				wishVO.setWish_qty(rs.getInt("wish_qty"));
				wishVO.setWish_stock(rs.getInt("wish_stock"));
				wishVO.setWish_date(rs.getTimestamp("wish_date"));
				wishVO.setWish_status(rs.getString("wish_status"));
				wishVO.setWish_coin(rs.getInt("wish_coin"));
				list.add(wishVO); // Store the row in the list
			}

			// Handle any driver errors
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

	@Override
	public void delete(String wish_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, wish_id);

			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

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

	public static void main(String[] args) {

		WishJDBCDAO dao = new WishJDBCDAO();

		// 新增
//		WishVO wishVO1 = new WishVO();
//		wishVO1.setWish_id("W00000test");
//		wishVO1.setWish_name("Test");
//		wishVO1.setWish_des("Test");
//		wishVO1.setWish_qty(10);
//		wishVO1.setWish_stock(1);
//		wishVO1.setWish_date(new Timestamp(new Date().getTime()));
//		wishVO1.setWish_status("上架");
//		wishVO1.setWish_coin(10);
//		dao.insert(wishVO1);

		// 修改
//		WishVO wishVO2 = new WishVO();
//		wishVO2.setWish_id("W000000012");
//		wishVO2.setWish_name("Test2");
//		wishVO2.setWish_des("Test2");
//		wishVO2.setWish_qty(10);
//		wishVO2.setWish_stock(2);
//		wishVO2.setWish_date(new Timestamp(new Date().getTime()));
//		wishVO2.setWish_status("上架");
//		wishVO2.setWish_coin(10);
//		dao.update(wishVO2);

//		// 刪除
		dao.delete("W000000012");

		// 查詢
//		WishVO wishVO3 = dao.findByPrimaryKey("W000000001");
//		System.out.print(wishVO3.getWish_id() + ",");
//		System.out.print(wishVO3.getWish_name() + ",");
//		System.out.print(wishVO3.getWish_des() + ",");
//		System.out.print(wishVO3.getWish_qty() + ",");
//		System.out.print(wishVO3.getWish_stock() + ",");
//		System.out.print(wishVO3.getWish_date() + ",");
//		System.out.print(wishVO3.getWish_status() + ",");
//		System.out.println(wishVO3.getWish_coin());
//		System.out.println("---------------------");

		// 查詢
		List<WishVO> list = dao.getAll();
		for (WishVO aWish : list) {
			System.out.print(aWish.getWish_id() + ",");
			System.out.print(aWish.getWish_name() + ",");
			System.out.print(aWish.getWish_des() + ",");
			System.out.print(aWish.getWish_qty() + ",");
			System.out.print(aWish.getWish_stock() + ",");
			System.out.print(aWish.getWish_date() + ",");
			System.out.print(aWish.getWish_status() + ",");
			System.out.println(aWish.getWish_coin());
			System.out.println("---------------------");
		}
	}

}
