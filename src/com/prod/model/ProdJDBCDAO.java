package com.prod.model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.prod.model.ProdVO;

public class ProdJDBCDAO implements ProdDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO product (PROD_ID, MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE) VALUES ('P'||LPAD(to_char(prod_id_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT PROD_ID,MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, to_char(PROD_DATE,'YYYY-MM-DD HH24:MI:SS')PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE FROM product order by PROD_ID";
	private static final String GET_ONE_STMT = "SELECT PROD_ID,MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, to_char(PROD_DATE,'YYYY-MM-DD HH24:MI:SS')PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE FROM product where PROD_ID = ?";
	private static final String DELETE = "DELETE FROM product where PROD_ID = ?";
	private static final String UPDATE = "UPDATE product set PROD_TYPE_ID=?, PROD_ANI_TYPE_ID=?, PROD_NAME=?, PROD_DES=?, PROD_INFO=?, PROD_QTY=?, PROD_STOCK=?, PROD_DATE=?, PROD_REVIEW=?, PROD_REVIEW_DES=?, PROD_STATUS=?, PROD_PRICE=? where PROD_ID = ?";

	@Override
	public String insert(ProdVO prodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String str = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT, new String[]{"prod_id"});

			pstmt.setString(1, prodVO.getMemb_id());
			pstmt.setString(2, prodVO.getProd_type_id());
			pstmt.setString(3, prodVO.getProd_ani_type_id());
			pstmt.setString(4, prodVO.getProd_name());
//			pstmt.setString(5, prodVO.getProd_des());
			pstmt.setString(6, prodVO.getProd_info());
			pstmt.setInt(7, prodVO.getProd_qty());
			pstmt.setInt(8, prodVO.getProd_stock());
			pstmt.setTimestamp(9, new Timestamp(new Date().getTime()));
			pstmt.setString(10, prodVO.getProd_review());
			pstmt.setString(11, prodVO.getProd_review_des());
			pstmt.setString(12, prodVO.getProd_status());
			pstmt.setInt(13, prodVO.getProd_price());
			
			Clob clob = con.createClob(); //使用連線connection建立clob
			clob.setString(1, prodVO.getProd_des()); // 括號內第一個數字1是指放置在clob的位置。 str - the string to be written to the CLOBvalue that this Clob designates，
			pstmt.setClob(5, clob);

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
			rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
			    str = rs.getString(1);
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
		System.out.println(str);
		return str;
	}

	@Override
	public void update(ProdVO prodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, prodVO.getProd_type_id());
			pstmt.setString(2, prodVO.getProd_ani_type_id());
			pstmt.setString(3, prodVO.getProd_name());
//			pstmt.setString(4, prodVO.getProd_des());
			pstmt.setString(5, prodVO.getProd_info());
			pstmt.setInt(6, prodVO.getProd_qty());
			pstmt.setInt(7, prodVO.getProd_stock());
			pstmt.setTimestamp(8, prodVO.getProd_date());
			pstmt.setString(9, prodVO.getProd_review());
			pstmt.setString(10, prodVO.getProd_review_des());
			pstmt.setString(11, prodVO.getProd_status());
			pstmt.setInt(12, prodVO.getProd_price());
			pstmt.setString(13, prodVO.getProd_id());
			
			Clob clob = con.createClob(); //使用連線connection建立clob
			clob.setString(1, prodVO.getProd_des()); // 括號內第一個數字1是指放置在clob的位置。 str - the string to be written to the CLOBvalue that this Clob designates，
			pstmt.setClob(4, clob);

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
	public void update(ProdVO prodVO, Connection con) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProdVO findByPrimaryKey(String prod_id) {
		ProdVO prodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, prod_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				prodVO = new ProdVO();
				prodVO.setProd_id(prod_id);
				prodVO.setMemb_id(rs.getString("memb_id"));
				prodVO.setProd_type_id(rs.getString("prod_type_id"));
				prodVO.setProd_ani_type_id(rs.getString("prod_ani_type_id"));
				prodVO.setProd_name(rs.getString("prod_name"));
				prodVO.setProd_des(readString(rs.getClob("prod_des")));
				prodVO.setProd_info(rs.getString("prod_info"));
				prodVO.setProd_qty(rs.getInt("prod_qty"));
				prodVO.setProd_stock(rs.getInt("prod_stock"));
				prodVO.setProd_date(rs.getTimestamp("prod_date"));
				prodVO.setProd_review(rs.getString("prod_review"));
				prodVO.setProd_review_des(rs.getString("prod_review_des"));
				prodVO.setProd_status(rs.getString("prod_status"));
				prodVO.setProd_price(rs.getInt("prod_price"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} catch (IOException e) {
			e.printStackTrace();
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
		return prodVO;

	}

	@Override
	public List<ProdVO> getAll() {
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ProdVO 也稱為 Domain objects
				prodVO = new ProdVO();
				prodVO.setProd_id(rs.getString("prod_id"));
				prodVO.setMemb_id(rs.getString("memb_id"));
				prodVO.setProd_type_id(rs.getString("prod_type_id"));
				prodVO.setProd_ani_type_id(rs.getString("prod_ani_type_id"));
				prodVO.setProd_name(rs.getString("prod_name"));
				prodVO.setProd_des(readString(rs.getClob("prod_des")));
				prodVO.setProd_info(rs.getString("prod_info"));
				prodVO.setProd_qty(rs.getInt("prod_qty"));
				prodVO.setProd_stock(rs.getInt("prod_stock"));
				prodVO.setProd_date(rs.getTimestamp("prod_date"));
				prodVO.setProd_review(rs.getString("prod_review"));
				prodVO.setProd_review_des(rs.getString("prod_review_des"));
				prodVO.setProd_status(rs.getString("prod_status"));
				prodVO.setProd_price(rs.getInt("prod_price"));
				list.add(prodVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} catch (IOException e) {
			e.printStackTrace();
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
	public List<ProdVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ProdVO> getAll_Front() {
		// TODO Auto-generated method stub
		return null;
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
	
	public static String readString(Clob clob) throws IOException, SQLException {
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(clob.getCharacterStream());
		String str;
		while((str = br.readLine()) != null) {
			sb.append(str);
			sb.append("\n");
		}
		br.close();

		return sb.toString();
	}
	
	public static String getLongString(String path) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(path));
		StringBuilder sb = new StringBuilder(); // StringBuffer is thread-safe!
		String str;
		while ((str = br.readLine()) != null) {
			sb.append(str);
			sb.append("\n");
		}
		br.close();

		return sb.toString();
	}

	public static void main(String[] args) {

		ProdJDBCDAO dao = new ProdJDBCDAO();

		// 新增
//		ProdVO prodVO1 = new ProdVO();
//		prodVO1.setProd_id("P00000test");
//		prodVO1.setMemb_id("M000000001");
//		prodVO1.setProd_type_id("玩具");
//		prodVO1.setProd_ani_type_id("貓");
//		prodVO1.setProd_name("擬真鮭魚抱枕22");
//		prodVO1.setProd_info("Test");
//		prodVO1.setProd_qty(10);
//		prodVO1.setProd_stock(0);
//		prodVO1.setProd_date(new Timestamp(new Date().getTime()));
//		prodVO1.setProd_review("Test");
//		prodVO1.setProd_review_des("Test");
//		prodVO1.setProd_status("Test");
//		prodVO1.setProd_price(10);
//		
//		try {
//			String str = getLongString("C:\\專題\\假資料\\表格假資料_20181206.docx");
//			prodVO1.setProd_des(str);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.insert(prodVO1);

		// 修改
//		ProdVO prodVO2 = new ProdVO();
//		prodVO2.setProd_id("P000000014");
//		prodVO2.setMemb_id("M000000002");
//		prodVO2.setProd_type_id("玩具");
//		prodVO2.setProd_ani_type_id("貓");
//		prodVO2.setProd_name("擬真鮭魚抱枕2");
//		prodVO2.setProd_info("Test2");
//		prodVO2.setProd_qty(20);
//		prodVO2.setProd_stock(10);
//		prodVO2.setProd_date(new Timestamp(new Date().getTime()));
//		prodVO2.setProd_review("未審核");
//		prodVO2.setProd_review_des("Test");
//		prodVO2.setProd_status("Test");
//		prodVO2.setProd_price(10);
//		
//		try {
//			String str = getLongString("C:\\Users\\Jen\\Desktop\\專題頁面列表.txt");
//			prodVO2.setProd_des(str);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		dao.update(prodVO2);

		// 刪除
//		dao.delete("P000000014");

//		// 查詢
//		ProdVO prodVO3 = dao.findByPrimaryKey("P000000014");
//		System.out.print(prodVO3.getProd_id() + ",");
//		System.out.print(prodVO3.getMemb_id() + ",");
//		System.out.print(prodVO3.getProd_type_id() + ",");
//		System.out.print(prodVO3.getProd_ani_type_id() + ",");
//		System.out.print(prodVO3.getProd_name() + ",");
//		System.out.print(prodVO3.getProd_des() + ",");
//		System.out.println(prodVO3.getProd_qty());
//		System.out.println("---------------------");

		// 查詢
//		List<ProdVO> list = dao.getAll();
//		for (ProdVO aProd : list) {
//			System.out.print(aProd.getProd_id() + ",");
//			System.out.print(aProd.getMemb_id() + ",");
//			System.out.print(aProd.getProd_type_id() + ",");
//			System.out.print(aProd.getProd_ani_type_id() + ",");
//			System.out.print(aProd.getProd_name() + ",");
//			System.out.print(aProd.getProd_des() + ",");
//			System.out.print(aProd.getProd_info() + ",");
//			System.out.print(aProd.getProd_qty() + ",");
//			System.out.print(aProd.getProd_stock() + ",");
//			System.out.print(aProd.getProd_date() + ",");
//			System.out.print(aProd.getProd_review() + ",");
//			System.out.print(aProd.getProd_review_des() + ",");
//			System.out.print(aProd.getProd_status() + ",");
//			System.out.println(aProd.getProd_price());
//			System.out.println();
//		}
	}

	@Override
	public List<ProdVO> getProdByMem(String memb_id) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	

}
