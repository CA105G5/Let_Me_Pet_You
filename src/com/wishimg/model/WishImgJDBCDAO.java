package com.wishimg.model;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WishImgJDBCDAO implements WishImgDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "Jen";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO WISH_IMG (wish_img_id, wish_id, wish_img) VALUES (LPAD(to_char(wish_img_id_seq.NEXTVAL), 10, '0'), ?, ?)";
	private static final String GET_ALL_STMT = "SELECT wish_img_id, wish_id, wish_img FROM WISH_IMG order by wish_img_id";
	private static final String GET_ONE_STMT = "SELECT wish_img_id, wish_id, wish_img FROM WISH_IMG where wish_id = ?";
	private static final String DELETE = "DELETE FROM WISH_IMG where wish_img_id = ?";
	private static final String UPDATE = "UPDATE WISH_IMG set wish_id=?, wish_img=? where wish_img_id=?";

	@Override
	public void insert(WishImgVO wishImgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, wishImgVO.getWish_id());
			pstmt.setBytes(2, wishImgVO.getWish_img());

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
	public void update(WishImgVO wishImgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, wishImgVO.getWish_id());
			pstmt.setBytes(2, wishImgVO.getWish_img());
			pstmt.setString(3, wishImgVO.getWish_img_id());

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
	public List<WishImgVO> findByPrimaryKey(String wish_id) {
		List<WishImgVO> list = new ArrayList<WishImgVO>();
		WishImgVO wishImgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,  wish_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// wishVo 也稱為 Domain objects
				wishImgVO = new WishImgVO();
				wishImgVO.setWish_img_id(rs.getString("wish_img_id"));
				wishImgVO.setWish_id(wish_id);
				wishImgVO.setWish_img(rs.getBytes("wish_img"));
				list.add(wishImgVO);
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
	public List<WishImgVO> getAll() {
		List<WishImgVO> list = new ArrayList<WishImgVO>();
		WishImgVO wishImgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// WishImgVO 也稱為 Domain objects
				wishImgVO = new WishImgVO();
				wishImgVO.setWish_img_id(rs.getString("wish_img_id"));
				wishImgVO.setWish_id(rs.getString("wish_id"));
				wishImgVO.setWish_img(rs.getBytes("wish_img"));
				list.add(wishImgVO);
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

		WishImgJDBCDAO dao = new WishImgJDBCDAO();

		// 新增
//		WishImgVO wishImgVO1 = new WishImgVO();
//		wishImgVO1.setWish_img_id("000000test");
//		wishImgVO1.setWish_id("W000000001");
//		
//		try {
//			byte[] pic1 = getPictureByteArray("C:\\Users\\Jen\\Desktop\\1.jpg");
//			wishImgVO1.setWish_img(pic1);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.insert(wishImgVO1);

		// 修改
//		WishImgVO wishImgVO2 = new WishImgVO();
//		wishImgVO2.setWish_img_id("0000000039");
//		wishImgVO2.setWish_id("W000000003");
//		
//		try {
//			byte[] pic2 = getPictureByteArray("C:\\Users\\Jen\\Desktop\\2.jpg");
//			wishImgVO2.setWish_img(pic2);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.update(wishImgVO2);

		// 刪除
		dao.delete("0000000039");

		// 查詢
//		List<WishImgVO> list = dao.findByPrimaryKey("W000000001");
//		for (WishImgVO aWishImg1 : list) {
//			System.out.print(aWishImg1.getWish_img_id() + ",");
//			System.out.print(aWishImg1.getWish_id() + ",");
//			System.out.println(aWishImg1.getWish_img() + ",");
//			System.out.println("---------------------");
//		}

		// 查詢
//		List<WishImgVO> list = dao.getAll();
//		for (WishImgVO aWishImg : list) {
//			System.out.print(aWishImg.getWish_img_id() + ",");
//			System.out.print(aWishImg.getWish_id() + ",");
//			System.out.println(aWishImg.getWish_img() + ",");
//			System.out.println();
//		}
	}
	
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];	//設定每次讀取的大小
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();	//將ByteArrayOutputStream轉成ByteArray
	}

}
