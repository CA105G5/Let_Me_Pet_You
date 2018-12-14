package com.prodimg.model;

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

public class ProdImgJDBCDAO implements ProdImgDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO PROD_IMG (prod_img_id, prod_id, prod_img) VALUES (LPAD(to_char(prod_img_id_seq.NEXTVAL), 10, '0'), ?, ?)";
	private static final String GET_ALL_STMT = "SELECT prod_img_id, prod_id, prod_img FROM PROD_IMG order by prod_img_id";
	private static final String GET_ONE_STMT = "SELECT prod_img_id, prod_id, prod_img FROM PROD_IMG where prod_id = ?";
	private static final String GET_ONE_STMT2 = "SELECT prod_img_id, prod_id, prod_img FROM PROD_IMG where prod_img_id =?";
	private static final String DELETE = "DELETE FROM PROD_IMG where prod_img_id = ?";
	private static final String UPDATE = "UPDATE PROD_IMG set prod_id=?, prod_img=? where prod_img_id=?";

	@Override
	public void insert(ProdImgVO prodImgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, prodImgVO.getProd_id());
			pstmt.setBytes(2, prodImgVO.getProd_img());

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
	public void update(ProdImgVO prodImgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, prodImgVO.getProd_id());
			pstmt.setBytes(2, prodImgVO.getProd_img());
			pstmt.setString(3, prodImgVO.getProd_img_id());

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
	public List<ProdImgVO> findByPrimaryKey(String prod_id) {
		List<ProdImgVO> list = new ArrayList<ProdImgVO>();
		ProdImgVO prodImgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,  prod_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				prodImgVO = new ProdImgVO();
				prodImgVO.setProd_img_id(rs.getString("prod_img_id"));
				prodImgVO.setProd_id(prod_id);
				prodImgVO.setProd_img(rs.getBytes("prod_img"));
				list.add(prodImgVO);
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
	public ProdImgVO findByPrimaryKey2(String prod_img_id) {

		ProdImgVO prodImgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT2);

			pstmt.setString(1,  prod_img_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				prodImgVO = new ProdImgVO();
				prodImgVO.setProd_img_id(prod_img_id);
				prodImgVO.setProd_id(rs.getString("prod_id"));
				prodImgVO.setProd_img(rs.getBytes("prod_img"));
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
		return prodImgVO;
	}


	@Override
	public List<ProdImgVO> getAll() {
		List<ProdImgVO> list = new ArrayList<ProdImgVO>();
		ProdImgVO prodImgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ProdImgVO 也稱為 Domain objects
				prodImgVO = new ProdImgVO();
				prodImgVO.setProd_img_id(rs.getString("prod_img_id"));
				prodImgVO.setProd_id(rs.getString("prod_id"));
				prodImgVO.setProd_img(rs.getBytes("prod_img"));
				list.add(prodImgVO);
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
	public void delete(String prod_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, prod_id);

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

		ProdImgJDBCDAO dao = new ProdImgJDBCDAO();

		// 新增
//		ProdImgVO prodImgVO1 = new ProdImgVO();
//		prodImgVO1.setProd_img_id("000000test");
//		prodImgVO1.setProd_id("P000000001");
//		
//		try {
//			byte[] pic1 = getPictureByteArray("C:\\Users\\Jen\\Desktop\\1.jpg");
//			prodImgVO1.setProd_img(pic1);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.insert(prodImgVO1);

		// 修改
//		ProdImgVO prodImgVO2 = new ProdImgVO();
//		prodImgVO2.setProd_img_id("0000000043");
//		prodImgVO2.setProd_id("P000000003");
//		
//		try {
//			byte[] pic2 = getPictureByteArray("C:\\Users\\Jen\\Desktop\\2.jpg");
//			prodImgVO2.setProd_img(pic2);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.update(prodImgVO2);

		// 刪除
//		dao.delete("0000000043");

		// 查詢
//		List<ProdImgVO> list = dao.findByPrimaryKey("P000000001");
//		for (ProdImgVO aProdImg1 : list) {
//			System.out.print(aProdImg1.getProd_img_id() + ",");
//			System.out.print(aProdImg1.getProd_id() + ",");
//			System.out.println(aProdImg1.getProd_img() + ",");
//			System.out.println("---------------------");
//		}

		// 查詢
		List<ProdImgVO> list = dao.getAll();
		for (ProdImgVO aProdImg : list) {
			System.out.print(aProdImg.getProd_img_id() + ",");
			System.out.print(aProdImg.getProd_id() + ",");
			System.out.println(aProdImg.getProd_img() + ",");
			System.out.println();
		}
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
