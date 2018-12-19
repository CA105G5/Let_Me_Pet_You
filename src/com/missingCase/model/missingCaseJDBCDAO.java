package com.missingCase.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class missingCaseJDBCDAO implements missingCaseDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO missing_case(missing_case_id,memb_id,missing_date,missing_name,missing_des,missing_loc,missing_status_shelve,missing_photo) VALUES ('S'||LPAD(to_char(missing_case_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT missing_case_id,memb_id,to_char(missing_date,'yyyy-mm-dd hh24:mi:ss')missing_date,missing_name,missing_des,missing_loc,missing_status_shelve,missing_photo FROM missing_case order by missing_case_id";
	private static final String GET_ONE_STMT = "SELECT missing_case_id,memb_id,to_char(missing_date,'yyyy-mm-dd hh24:mi:ss')missing_date,missing_name,missing_des,missing_loc,missing_status_shelve,missing_photo FROM missing_case where missing_case_id = ?";
	private static final String DELETE = "DELETE FROM missing_case where missing_case_id = ?";
	private static final String UPDATE = "UPDATE missing_case set memb_id=?, missing_date=?, missing_name=?, missing_des=?, missing_loc=?, missing_status_shelve=?, missing_photo=? where missing_case_id = ?";

	// 新增
	@Override
	public void insert(missingCaseVO missingCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, missingCaseVO.getMemb_id());
			pstmt.setTimestamp(2, missingCaseVO.getMissing_date());
			pstmt.setString(3, missingCaseVO.getMissing_name());
			pstmt.setString(4, missingCaseVO.getMissing_des());
			pstmt.setString(5, missingCaseVO.getMissing_loc());
			pstmt.setString(6, missingCaseVO.getMissing_status_shelve());
			pstmt.setBytes(7, missingCaseVO.getMissing_photo());

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
	public void update(missingCaseVO missingCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, missingCaseVO.getMemb_id());
			pstmt.setTimestamp(2, missingCaseVO.getMissing_date());
			pstmt.setString(3, missingCaseVO.getMissing_name());
			pstmt.setString(4, missingCaseVO.getMissing_des());
			pstmt.setString(5, missingCaseVO.getMissing_loc());
			pstmt.setString(6, missingCaseVO.getMissing_status_shelve());
			pstmt.setBytes(7, missingCaseVO.getMissing_photo());
			pstmt.setString(8, missingCaseVO.getMissing_case_id());

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
	public void delete(String missing_case_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, missing_case_id);

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
	public missingCaseVO findByPrimaryKey(String missing_case_id) {

		missingCaseVO missingCaseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, missing_case_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingCaseVO.setMemb_id(rs.getString("memb_id"));
				missingCaseVO.setMissing_date(rs.getTimestamp("missing_date"));
				missingCaseVO.setMissing_name(rs.getString("missing_name"));
				missingCaseVO.setMissing_des(rs.getString("missing_des"));
				missingCaseVO.setMissing_loc(rs.getString("missing_loc"));
				missingCaseVO.setMissing_status_shelve(rs.getString("missing_status_shelve"));
				missingCaseVO.setMissing_photo(rs.getBytes("missing_photo"));
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
		return missingCaseVO;
	}

	// 查全部
	@Override
	public List<missingCaseVO> getAll() {
		List<missingCaseVO> list = new ArrayList<missingCaseVO>();
		missingCaseVO missingCaseVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingCaseVO.setMemb_id(rs.getString("memb_id"));
				missingCaseVO.setMissing_date(rs.getTimestamp("missing_date"));
				missingCaseVO.setMissing_name(rs.getString("missing_name"));
				missingCaseVO.setMissing_des(rs.getString("missing_des"));
				missingCaseVO.setMissing_loc(rs.getString("missing_loc"));
				missingCaseVO.setMissing_status_shelve(rs.getString("missing_status_shelve"));
				missingCaseVO.setMissing_photo(rs.getBytes("missing_photo"));
				list.add(missingCaseVO);
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
		missingCaseJDBCDAO dao = new missingCaseJDBCDAO();

		// 新增
//		missingCaseVO missingCaseVO1 = new missingCaseVO();
//		missingCaseVO1.setMemb_id("M000000002");
//		missingCaseVO1.setMissing_date(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//		missingCaseVO1.setMissing_name("周伯");
//		missingCaseVO1.setMissing_des("哈囉大家好");
//		missingCaseVO1.setMissing_loc("中壢資策會");
//		missingCaseVO1.setMissing_status_shelve("M1");
//		
//		try {
//			byte[] pic1 = getPictureByteArray("C:\\Users\\Java\\Desktop\\上課講義\\專題\\假資料\\MARU.jpg");
//			missingCaseVO1.setMissing_photo(pic1);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.insert(missingCaseVO1);

		// 修改
//		missingCaseVO missingCaseVO2 = new missingCaseVO();
//		missingCaseVO2.setMemb_id("M000000003");
//		missingCaseVO2.setMissing_date(java.sql.Timestamp.valueOf("1999-07-20 14:24:00"));
//		missingCaseVO2.setMissing_name("示威");
//		missingCaseVO2.setMissing_des("阿囉哈");
//		missingCaseVO2.setMissing_loc("台中");
//		missingCaseVO2.setMissing_status_shelve("M1");
//		missingCaseVO2.setMissing_case_id("S000000007");
//		dao.update(missingCaseVO2);

		// 刪除
//		dao.delete("S000000008");

		// 單獨查詢
		missingCaseVO missingCaseVO3 = dao.findByPrimaryKey("S000000001");
		System.out.print(missingCaseVO3.getMissing_case_id()+",");
		System.out.print(missingCaseVO3.getMemb_id()+",");
		System.out.print(missingCaseVO3.getMissing_date()+",");
		System.out.print(missingCaseVO3.getMissing_name()+",");
		System.out.print(missingCaseVO3.getMissing_des()+",");
		System.out.print(missingCaseVO3.getMissing_loc()+",");
		System.out.println(missingCaseVO3.getMissing_status_shelve());
		System.out.println(missingCaseVO3.getMissing_photo());
		System.out.println("---------------------------------------------------------------------");

		// 查全部
//		List<missingCaseVO> list = dao.getAll();
//		for (missingCaseVO mCase : list) {
//			System.out.print(mCase.getMissing_case_id() + ",");
//			System.out.print(mCase.getMemb_id() + ",");
//			System.out.print(mCase.getMissing_date() + ",");
//			System.out.print(mCase.getMissing_name() + ",");
//			System.out.print(mCase.getMissing_des() + ",");
//			System.out.print(mCase.getMissing_loc() + ",");
//			System.out.println(mCase.getMissing_status_shelve());
//			System.out.println();
//		}
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192]; // 設定每次讀取的大小
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray(); // 將ByteArrayOutputStream轉成ByteArray
	}
}
