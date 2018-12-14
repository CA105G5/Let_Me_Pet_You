package com.wishdon.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WishDonJDBCDAO implements WishDonDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO wish_don (WISH_DON_ID, WISH_ID, MEMB_ID, WISH_DON_QTY, WISH_DON_DATE, WISH_DON_SP_STATUS, WISH_DON_SP_DATE, WISH_DON_RC_STATUS, WISH_DON_RC_DATE, WISH_DON_COIN_ST) VALUES ('WD'||LPAD(to_char(wish_don_id_seq.NEXTVAL), 8, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT WISH_DON_ID, WISH_ID, MEMB_ID, WISH_DON_QTY, WISH_DON_DATE, WISH_DON_SP_STATUS, WISH_DON_SP_DATE, WISH_DON_RC_STATUS, WISH_DON_RC_DATE, WISH_DON_COIN_ST FROM wish_don order by wish_don_ID";
	private static final String GET_ONE_STMT = "SELECT WISH_DON_ID, WISH_ID, MEMB_ID, WISH_DON_QTY, WISH_DON_DATE, WISH_DON_SP_STATUS, WISH_DON_SP_DATE, WISH_DON_RC_STATUS, WISH_DON_RC_DATE, WISH_DON_COIN_ST FROM wish_don where wish_don_ID = ?";
	private static final String DELETE = "DELETE FROM wish_don where wish_don_ID = ?";
	private static final String UPDATE = "UPDATE wish_don set WISH_ID=?, MEMB_ID=?, WISH_DON_QTY=?, WISH_DON_DATE=?, WISH_DON_SP_STATUS=?, WISH_DON_SP_DATE=?, WISH_DON_RC_STATUS=?, WISH_DON_RC_DATE=?, WISH_DON_COIN_ST=? where wish_don_ID = ?";

	@Override
	public void insert(WishDonVO wishDonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, wishDonVO.getWish_id());
			pstmt.setString(2, wishDonVO.getMemb_id());
			pstmt.setInt(3, wishDonVO.getWish_don_qty());
			pstmt.setTimestamp(4, wishDonVO.getWish_don_date());
			pstmt.setString(5, wishDonVO.getWish_don_sp_status());
			pstmt.setTimestamp(6, wishDonVO.getWish_don_sp_date());
			pstmt.setString(7, wishDonVO.getWish_don_rc_status());
			pstmt.setTimestamp(8, wishDonVO.getWish_don_rc_date());
			pstmt.setString(9, wishDonVO.getWish_don_coin_st());

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
	public void update(WishDonVO wishDonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, wishDonVO.getWish_id());
			pstmt.setString(2, wishDonVO.getMemb_id());
			pstmt.setInt(3, wishDonVO.getWish_don_qty());
			pstmt.setTimestamp(4, wishDonVO.getWish_don_date());
			pstmt.setString(5, wishDonVO.getWish_don_sp_status());
			pstmt.setTimestamp(6, wishDonVO.getWish_don_sp_date());
			pstmt.setString(7, wishDonVO.getWish_don_rc_status());
			pstmt.setTimestamp(8, wishDonVO.getWish_don_rc_date());
			pstmt.setString(9, wishDonVO.getWish_don_coin_st());
			pstmt.setString(10, wishDonVO.getWish_don_id());

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
	public WishDonVO findByPrimaryKey(String wish_don_id) {
		WishDonVO wishDonVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, wish_don_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				wishDonVO = new WishDonVO();
				wishDonVO.setWish_don_id(wish_don_id);
				wishDonVO.setWish_id(rs.getString("wish_id"));
				wishDonVO.setMemb_id(rs.getString("memb_id"));
				wishDonVO.setWish_don_qty(rs.getInt("wish_don_qty"));
				wishDonVO.setWish_don_date(rs.getTimestamp("wish_don_date"));
				wishDonVO.setWish_don_sp_status(rs.getString("wish_don_sp_status"));
				wishDonVO.setWish_don_sp_date(rs.getTimestamp("wish_don_sp_date"));
				wishDonVO.setWish_don_rc_status(rs.getString("wish_don_rc_status"));
				wishDonVO.setWish_don_rc_date(rs.getTimestamp("wish_don_rc_date"));
				wishDonVO.setWish_don_coin_st(rs.getString("wish_don_coin_st"));
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
		return wishDonVO;

	}

	@Override
	public List<WishDonVO> getAll() {
		List<WishDonVO> list = new ArrayList<WishDonVO>();
		WishDonVO wishDonVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// WishDonVO 也稱為 Domain objects
				wishDonVO = new WishDonVO();
				wishDonVO = new WishDonVO();
				wishDonVO.setWish_don_id(rs.getString("wish_don_id"));
				wishDonVO.setWish_id(rs.getString("wish_id"));
				wishDonVO.setMemb_id(rs.getString("memb_id"));
				wishDonVO.setWish_don_qty(rs.getInt("wish_don_qty"));
				wishDonVO.setWish_don_date(rs.getTimestamp("wish_don_date"));
				wishDonVO.setWish_don_sp_status(rs.getString("wish_don_sp_status"));
				wishDonVO.setWish_don_sp_date(rs.getTimestamp("wish_don_sp_date"));
				wishDonVO.setWish_don_rc_status(rs.getString("wish_don_rc_status"));
				wishDonVO.setWish_don_rc_date(rs.getTimestamp("wish_don_rc_date"));
				wishDonVO.setWish_don_coin_st(rs.getString("wish_don_coin_st"));
				list.add(wishDonVO); // Store the row in the list
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
	public void delete(String wish_don_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, wish_don_id);

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

		WishDonJDBCDAO dao = new WishDonJDBCDAO();

		// 新增
//		WishDonVO wishDonVO1 = new WishDonVO();
//		wishDonVO1.setWish_don_id("WD0000test");
//		wishDonVO1.setWish_id("W000000008");
//		wishDonVO1.setMemb_id("M000000008");
//		wishDonVO1.setWish_don_qty(8);
//		wishDonVO1.setWish_don_date(new Timestamp(new Date().getTime()));
//		wishDonVO1.setWish_don_sp_status("已出貨");
//		wishDonVO1.setWish_don_sp_date(new Timestamp(new Date().getTime()+24*60*60*1000));
//		wishDonVO1.setWish_don_rc_status("已收貨");
//		wishDonVO1.setWish_don_rc_date(new Timestamp(new Date().getTime()+24*60*60*1000*2));
//		wishDonVO1.setWish_don_coin_st("已發放");
//		dao.insert(wishDonVO1);

		// 修改
//		WishDonVO wishDonVO2 = new WishDonVO();
//		wishDonVO2.setWish_don_id("WD00000007");
//		wishDonVO2.setWish_id("W000000008");
//		wishDonVO2.setMemb_id("M000000008");
//		wishDonVO2.setWish_don_qty(8);
//		wishDonVO2.setWish_don_date(new Timestamp(new Date().getTime()));
//		wishDonVO2.setWish_don_sp_status("已出貨-");
//		wishDonVO2.setWish_don_sp_date(new Timestamp(new Date().getTime()+24*60*60*1000));
//		wishDonVO2.setWish_don_rc_status("已收貨-");
//		wishDonVO2.setWish_don_rc_date(new Timestamp(new Date().getTime()+24*60*60*1000*2));
//		wishDonVO2.setWish_don_coin_st("已發放-");
//		dao.update(wishDonVO2);

		// 刪除
		dao.delete("WD00000007");

		// 查詢
//		WishDonVO wishDonVO3 = dao.findByPrimaryKey("WD00000007");
//		System.out.print(wishDonVO3.getWish_don_id() + ",");
//		System.out.print(wishDonVO3.getWish_id() + ",");
//		System.out.print(wishDonVO3.getMemb_id() + ",");
//		System.out.print(wishDonVO3.getWish_don_qty() + ",");
//		System.out.print(wishDonVO3.getWish_don_date() + ",");
//		System.out.print(wishDonVO3.getWish_don_sp_status() + ",");
//		System.out.print(wishDonVO3.getWish_don_sp_date() + ",");
//		System.out.print(wishDonVO3.getWish_don_rc_status() + ",");
//		System.out.print(wishDonVO3.getWish_don_rc_date() + ",");
//		System.out.println(wishDonVO3.getWish_don_coin_st());
//		System.out.println("---------------------");

		// 查詢
		List<WishDonVO> list = dao.getAll();
		for (WishDonVO aWishDon : list) {
			System.out.print(aWishDon.getWish_don_id() + ",");
			System.out.print(aWishDon.getWish_id() + ",");
			System.out.print(aWishDon.getMemb_id() + ",");
			System.out.print(aWishDon.getWish_don_qty() + ",");
			System.out.print(aWishDon.getWish_don_date() + ",");
			System.out.print(aWishDon.getWish_don_sp_status() + ",");
			System.out.print(aWishDon.getWish_don_sp_date() + ",");
			System.out.print(aWishDon.getWish_don_rc_status() + ",");
			System.out.print(aWishDon.getWish_don_rc_date() + ",");
			System.out.println(aWishDon.getWish_don_coin_st());
			System.out.println("---------------------");
		}
	}

}
