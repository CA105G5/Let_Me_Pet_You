package com.orditem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.orditem.model.OrdItemVO;

public class OrdItemJDBCDAO implements OrdItemDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO ORD_ITEM (PROD_ID, ORD_ID, ORD_ITEM_QTY, ORD_ITEM_SP_STATUS, ORD_ITEM_SP_DATE, ORD_ITEM_RC_STATUS, ORD_ITEM_RC_DATE, ORD_ITEM_COIN_ST, ORD_ITEM_RT_STATUS, ord_item_rt_date, ord_item_rt_comm, ord_item_review, ord_item_rv_des) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT PROD_ID, ORD_ID, ORD_ITEM_QTY, ORD_ITEM_SP_STATUS, ORD_ITEM_SP_DATE, ORD_ITEM_RC_STATUS, ORD_ITEM_RC_DATE, ORD_ITEM_COIN_ST, ORD_ITEM_RT_STATUS, ord_item_rt_date, ord_item_rt_comm, ord_item_review, ord_item_rv_des FROM ORD_ITEM order by PROD_ID";
	private static final String GET_ONE_STMT = "SELECT PROD_ID, ORD_ID, ORD_ITEM_QTY, ORD_ITEM_SP_STATUS, ORD_ITEM_SP_DATE, ORD_ITEM_RC_STATUS, ORD_ITEM_RC_DATE, ORD_ITEM_COIN_ST, ORD_ITEM_RT_STATUS, ord_item_rt_date, ord_item_rt_comm, ord_item_review, ord_item_rv_des FROM ORD_ITEM where PROD_ID = ? and ORD_ID = ? ";
	private static final String DELETE = "DELETE FROM ORD_ITEM where PROD_ID = ? and ORD_ID = ? ";
	private static final String UPDATE = "UPDATE ORD_ITEM set ORD_ITEM_QTY=?, ORD_ITEM_SP_STATUS=?, ORD_ITEM_SP_DATE=?, ORD_ITEM_RC_STATUS=?, ORD_ITEM_RC_DATE=?, ORD_ITEM_COIN_ST=?, ORD_ITEM_RT_STATUS=?, ord_item_rt_date=?, ord_item_rt_comm=?, ord_item_review=?, ord_item_rv_des=? where PROD_ID = ? and ORD_ID = ?";

	@Override
	public void insert(OrdItemVO ordItemVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, ordItemVO.getProd_id());
			pstmt.setString(2, ordItemVO.getOrd_id());
			pstmt.setInt(3, ordItemVO.getOrd_item_qty());
			pstmt.setString(4, ordItemVO.getOrd_item_sp_status());
			pstmt.setTimestamp(5, ordItemVO.getOrd_item_sp_date());
			pstmt.setString(6, ordItemVO.getOrd_item_rc_status());
			pstmt.setTimestamp(7, ordItemVO.getOrd_item_rc_date());
			pstmt.setString(8, ordItemVO.getOrd_item_coin_st());
			pstmt.setString(9, ordItemVO.getOrd_item_rt_status());
			pstmt.setTimestamp(10, ordItemVO.getOrd_item_rt_date());
			pstmt.setString(11, ordItemVO.getOrd_item_rt_comm());
			pstmt.setString(12, ordItemVO.getOrd_item_review());
			pstmt.setString(13, ordItemVO.getOrd_item_rv_des());

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
	public void update(OrdItemVO ordItemVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(12, ordItemVO.getProd_id());
			pstmt.setString(13, ordItemVO.getOrd_id());
			pstmt.setInt(1, ordItemVO.getOrd_item_qty());
			pstmt.setString(2, ordItemVO.getOrd_item_sp_status());
			pstmt.setTimestamp(3, ordItemVO.getOrd_item_sp_date());
			pstmt.setString(4, ordItemVO.getOrd_item_rc_status());
			pstmt.setTimestamp(5, ordItemVO.getOrd_item_rc_date());
			pstmt.setString(6, ordItemVO.getOrd_item_coin_st());
			pstmt.setString(7, ordItemVO.getOrd_item_rt_status());
			pstmt.setTimestamp(8, ordItemVO.getOrd_item_rt_date());
			pstmt.setString(9, ordItemVO.getOrd_item_rt_comm());
			pstmt.setString(10, ordItemVO.getOrd_item_review());
			pstmt.setString(11, ordItemVO.getOrd_item_rv_des());


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
	public OrdItemVO findByPrimaryKey(String prod_id, String ord_id) {
		OrdItemVO ordItemVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, prod_id);
			pstmt.setString(2, ord_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				ordItemVO = new OrdItemVO();
				ordItemVO.setProd_id(prod_id);
				ordItemVO.setOrd_id(ord_id);
				ordItemVO.setOrd_item_qty(rs.getInt("ord_item_qty"));
				ordItemVO.setOrd_item_sp_status(rs.getString("ord_item_sp_status"));
				ordItemVO.setOrd_item_sp_date(rs.getTimestamp("ord_item_sp_date"));
				ordItemVO.setOrd_item_rc_status(rs.getString("ord_item_rc_status"));
				ordItemVO.setOrd_item_rc_date(rs.getTimestamp("ord_item_rc_date"));
				ordItemVO.setOrd_item_coin_st(rs.getString("ord_item_coin_st"));
				ordItemVO.setOrd_item_rt_status(rs.getString("ord_item_rt_status"));
				ordItemVO.setOrd_item_rt_date(rs.getTimestamp("ord_item_rt_date"));
				ordItemVO.setOrd_item_rt_comm(rs.getString("ord_item_rt_comm"));
				ordItemVO.setOrd_item_review(rs.getString("ord_item_review"));
				ordItemVO.setOrd_item_rv_des(rs.getString("ord_item_rv_des"));
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
		return ordItemVO;

	}

	@Override
	public List<OrdItemVO> getAll() {
		List<OrdItemVO> list = new ArrayList<OrdItemVO>();
		OrdItemVO ordItemVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// OrdItemVO 也稱為 Domain objects
				ordItemVO = new OrdItemVO();
				ordItemVO.setProd_id(rs.getString("prod_id"));
				ordItemVO.setOrd_id(rs.getString("ord_id"));
				ordItemVO.setOrd_item_qty(rs.getInt("ord_item_qty"));
				ordItemVO.setOrd_item_sp_status(rs.getString("ord_item_sp_status"));
				ordItemVO.setOrd_item_sp_date(rs.getTimestamp("ord_item_sp_date"));
				ordItemVO.setOrd_item_rc_status(rs.getString("ord_item_rc_status"));
				ordItemVO.setOrd_item_rc_date(rs.getTimestamp("ord_item_rc_date"));
				ordItemVO.setOrd_item_coin_st(rs.getString("ord_item_coin_st"));
				ordItemVO.setOrd_item_rt_status(rs.getString("ord_item_rt_status"));
				ordItemVO.setOrd_item_rt_date(rs.getTimestamp("ord_item_rt_date"));
				ordItemVO.setOrd_item_rt_comm(rs.getString("ord_item_rt_comm"));
				ordItemVO.setOrd_item_review(rs.getString("ord_item_review"));
				ordItemVO.setOrd_item_rv_des(rs.getString("ord_item_rv_des"));
				list.add(ordItemVO); // Store the row in the list
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
	public void delete(String prod_id, String ord_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, prod_id);
			pstmt.setString(2, ord_id);

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

		OrdItemJDBCDAO dao = new OrdItemJDBCDAO();

		// 新增
//		OrdItemVO ordItemVO1 = new OrdItemVO();
//		ordItemVO1.setProd_id("P000000010");
//		ordItemVO1.setOrd_id("O20181212-008");
//		ordItemVO1.setOrd_item_qty(1);
//		ordItemVO1.setOrd_item_sp_status("已出貨");
//		ordItemVO1.setOrd_item_sp_date(new Timestamp(new Date().getTime()));
//		ordItemVO1.setOrd_item_rc_status("已收貨");
//		ordItemVO1.setOrd_item_rc_date(new Timestamp(new Date().getTime()+24*60*60*1000));
//		ordItemVO1.setOrd_item_coin_st("已發放");
//		ordItemVO1.setOrd_item_rt_status("未檢舉");
////		ordItemVO1.setOrd_item_rt_date();
////		ordItemVO1.setOrd_item_rt_comm();
////		ordItemVO1.setOrd_item_review();
////		ordItemVO1.setOrd_item_rv_des();
//		dao.insert(ordItemVO1);

		// 修改
//		OrdItemVO ordItemVO2 = new OrdItemVO();
//		ordItemVO2.setProd_id("P000000010");
//		ordItemVO2.setOrd_id("O20181212-008");
//		ordItemVO2.setOrd_item_qty(1);
//		ordItemVO2.setOrd_item_sp_status("已出貨-");
//		ordItemVO2.setOrd_item_sp_date(new Timestamp(new Date().getTime()));
//		ordItemVO2.setOrd_item_rc_status("已收貨-");
//		ordItemVO2.setOrd_item_rc_date(new Timestamp(new Date().getTime()+24*60*60*1000));
//		ordItemVO2.setOrd_item_coin_st("已發放-");
//		ordItemVO2.setOrd_item_rt_status("未檢舉-");
////		ordItemVO2.setOrd_item_rt_date();
////		ordItemVO2.setOrd_item_rt_comm();
////		ordItemVO2.setOrd_item_review();
////		ordItemVO2.setOrd_item_rv_des();
//		dao.update(ordItemVO2);

		// 刪除
//		dao.delete("P000000010","O20181212-008");

		// 查詢
//		OrdItemVO ordItemVO3 = dao.findByPrimaryKey("P000000005","O20181211-005");
//		System.out.print(ordItemVO3.getProd_id() + ",");
//		System.out.print(ordItemVO3.getOrd_id() + ",");
//		System.out.print(ordItemVO3.getOrd_item_qty() + ",");
//		System.out.print(ordItemVO3.getOrd_item_sp_status() + ",");
//		System.out.print(ordItemVO3.getOrd_item_sp_date() + ",");
//		System.out.print(ordItemVO3.getOrd_item_rc_status() + ",");
//		System.out.print(ordItemVO3.getOrd_item_rc_date()+ ",");
//		System.out.println(ordItemVO3.getOrd_item_coin_st());
//		System.out.println("---------------------");

		// 查詢
		List<OrdItemVO> list = dao.getAll();
		for (OrdItemVO aOrdItem : list) {
			System.out.print(aOrdItem.getProd_id() + ",");
			System.out.print(aOrdItem.getOrd_id() + ",");
			System.out.print(aOrdItem.getOrd_item_qty() + ",");
			System.out.print(aOrdItem.getOrd_item_sp_status() + ",");
			System.out.print(aOrdItem.getOrd_item_sp_date() + ",");
			System.out.print(aOrdItem.getOrd_item_rc_status() + ",");
			System.out.print(aOrdItem.getOrd_item_rc_date()+ ",");
			System.out.println(aOrdItem.getOrd_item_coin_st());
			System.out.println("---------------------");
		}
	}

}
