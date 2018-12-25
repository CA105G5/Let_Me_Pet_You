package com.donate.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DonateJDBCDAO implements DonateDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO donate (DONATE_ID, MEMB_ID, BANK_ID, DONATE_AMOUNT, DONATE_DATE, DONATE_COIN, DONATE_PRIVATE, DONATE_SRC, DONATE_SRC_CRE, DONATE_SRC_TRN, DONATE_STATUS, donate_name, donate_phone, donate_mail) VALUES ('D'||LPAD(to_char(donate_id_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT DONATE_ID, MEMB_ID, BANK_ID, DONATE_AMOUNT, DONATE_DATE, DONATE_COIN, DONATE_PRIVATE, DONATE_SRC, DONATE_SRC_CRE, DONATE_SRC_TRN, DONATE_STATUS, donate_name, donate_phone, donate_mail FROM donate order by donate_ID";
	private static final String GET_ONE_STMT = "SELECT DONATE_ID, MEMB_ID, BANK_ID, DONATE_AMOUNT, DONATE_DATE, DONATE_COIN, DONATE_PRIVATE, DONATE_SRC, DONATE_SRC_CRE, DONATE_SRC_TRN, DONATE_STATUS, donate_name, donate_phone, donate_mail FROM donate where donate_ID = ?";
	private static final String DELETE = "DELETE FROM donate where donate_ID = ?";
	private static final String UPDATE = "UPDATE donate set MEMB_ID=?, BANK_ID=?, DONATE_AMOUNT=?, DONATE_DATE=?, DONATE_COIN=?, DONATE_PRIVATE=?, DONATE_SRC=?, DONATE_SRC_CRE=?, DONATE_SRC_TRN=?, DONATE_STATUS=?, donate_name=?, donate_phone=?, donate_mail=? where donate_ID = ?";

	@Override
	public void insert(DonateVO donateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			Timestamp date = donateVO.getDonate_date();
			if (date==null) {
				date = new Timestamp(new Date().getTime());
			} else {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time = df.format(date);
				date = Timestamp.valueOf(time);
			}
			
			pstmt.setString(1, donateVO.getMemb_id());
			pstmt.setString(2, donateVO.getBank_id());
			pstmt.setInt(3, donateVO.getDonate_amount());
			pstmt.setTimestamp(4, date);
			pstmt.setInt(5, donateVO.getDonate_coin());
			pstmt.setString(6, donateVO.getDonate_private());
			pstmt.setString(7, donateVO.getDonate_src());
			pstmt.setString(8, donateVO.getDonate_src_cre());
			pstmt.setString(9, donateVO.getDonate_src_trn());
			pstmt.setString(10, donateVO.getDonate_status());
			pstmt.setString(10, donateVO.getDonate_name());
			pstmt.setString(10, donateVO.getDonate_phone());
			pstmt.setString(10, donateVO.getDonate_mail());

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
	public void update(DonateVO donateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(11, donateVO.getDonate_id());
			pstmt.setString(1, donateVO.getMemb_id());
			pstmt.setString(2, donateVO.getBank_id());
			pstmt.setInt(3, donateVO.getDonate_amount());
			pstmt.setTimestamp(4, donateVO.getDonate_date());
			pstmt.setInt(5, donateVO.getDonate_coin());
			pstmt.setString(6, donateVO.getDonate_private());
			pstmt.setString(7, donateVO.getDonate_src());
			pstmt.setString(8, donateVO.getDonate_src_cre());
			pstmt.setString(9, donateVO.getDonate_src_trn());
			pstmt.setString(10, donateVO.getDonate_status());
			pstmt.setString(11, donateVO.getDonate_name());
			pstmt.setString(12, donateVO.getDonate_phone());
			pstmt.setString(13, donateVO.getDonate_mail());

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
	public DonateVO findByPrimaryKey(String donate_id) {
		DonateVO donateVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, donate_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				donateVO = new DonateVO();
				donateVO.setDonate_id(donate_id);
				donateVO.setMemb_id(rs.getString("memb_id"));
				donateVO.setBank_id(rs.getString("bank_id"));
				donateVO.setDonate_amount(rs.getInt("donate_amount"));
				donateVO.setDonate_date(rs.getTimestamp("donate_date"));
				donateVO.setDonate_coin(rs.getInt("donate_coin"));
				donateVO.setDonate_private(rs.getString("donate_private"));
				donateVO.setDonate_src(rs.getString("donate_src"));
				donateVO.setDonate_src_cre(rs.getString("donate_src_cre"));
				donateVO.setDonate_src_trn(rs.getString("donate_src_trn"));
				donateVO.setDonate_status(rs.getString("donate_status"));
				donateVO.setDonate_status(rs.getString("donate_name"));
				donateVO.setDonate_status(rs.getString("donate_phone"));
				donateVO.setDonate_status(rs.getString("donate_mail"));
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
		return donateVO;

	}

	@Override
	public List<DonateVO> getAll() {
		List<DonateVO> list = new ArrayList<DonateVO>();
		DonateVO donateVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// DonateVO 也稱為 Domain objects
				donateVO = new DonateVO();
				donateVO.setDonate_id(rs.getString("donate_id"));
				donateVO.setMemb_id(rs.getString("memb_id"));
				donateVO.setBank_id(rs.getString("bank_id"));
				donateVO.setDonate_amount(rs.getInt("donate_amount"));
				donateVO.setDonate_date(rs.getTimestamp("donate_date"));
				donateVO.setDonate_coin(rs.getInt("donate_coin"));
				donateVO.setDonate_private(rs.getString("donate_private"));
				donateVO.setDonate_src(rs.getString("donate_src"));
				donateVO.setDonate_src_cre(rs.getString("donate_src_cre"));
				donateVO.setDonate_src_trn(rs.getString("donate_src_trn"));
				donateVO.setDonate_status(rs.getString("donate_status"));
				donateVO.setDonate_status(rs.getString("donate_name"));
				donateVO.setDonate_status(rs.getString("donate_phone"));
				donateVO.setDonate_status(rs.getString("donate_mail"));
				list.add(donateVO); // Store the row in the list
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
	public void delete(String donate_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, donate_id);

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

		DonateJDBCDAO dao = new DonateJDBCDAO();

		// 新增
//		DonateVO donateVO1 = new DonateVO();
//		donateVO1.setDonate_id("D00000test");
//		donateVO1.setMemb_id("M000000001");
//		donateVO1.setBank_id("004");
//		donateVO1.setDonate_amount(66666);
//		donateVO1.setDonate_date(new Timestamp(new Date().getTime()));
//		donateVO1.setDonate_coin(66);
//		donateVO1.setDonate_private("不匿名");
//		donateVO1.setDonate_src("轉帳");
////		donateVO1.setDonate_src_cre("8888");
//		donateVO1.setDonate_src_trn("8888");
//		donateVO1.setDonate_status("已收到");
//		dao.insert(donateVO1);

		// 修改
//		DonateVO donateVO2 = new DonateVO();
//		donateVO2.setDonate_id("D000000011");
//		donateVO2.setMemb_id("M000000001");
//		donateVO2.setBank_id("004");
//		donateVO2.setDonate_amount(8888888);
//		donateVO2.setDonate_date(new Timestamp(new Date().getTime()));
//		donateVO2.setDonate_coin(88888);
//		donateVO2.setDonate_private("不匿名");
//		donateVO2.setDonate_src("轉帳");
//		donateVO2.setDonate_src_cre("8888");
//		donateVO2.setDonate_src_trn("8888");
//		donateVO2.setDonate_status("已收到");
//		dao.update(donateVO2);

		// 刪除
//		dao.delete("D000000011");

		// 查詢
//		DonateVO donateVO3 = dao.findByPrimaryKey("D000000010");
//		System.out.print(donateVO3.getDonate_id() + ",");
//		System.out.print(donateVO3.getMemb_id() + ",");
//		System.out.print(donateVO3.getDonate_amount() + ",");
//		System.out.print(donateVO3.getDonate_date() + ",");
//		System.out.print(donateVO3.getDonate_src() + ",");
//		System.out.println(donateVO3.getDonate_status());
//		System.out.println("---------------------");

		// 查詢
		List<DonateVO> list = dao.getAll();
		for (DonateVO aDon : list) {
			System.out.print(aDon.getDonate_id() + ",");
			System.out.print(aDon.getMemb_id() + ",");
			System.out.print(aDon.getDonate_amount() + ",");
			System.out.print(aDon.getDonate_date() + ",");
			System.out.print(aDon.getDonate_src() + ",");
			System.out.println(aDon.getDonate_status());
			System.out.println("---------------------");
		}
	}

}
