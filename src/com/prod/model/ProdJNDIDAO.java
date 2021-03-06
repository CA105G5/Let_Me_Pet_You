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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ntf.model.NtfJDBCDAO;
import com.ntf.model.NtfVO;
import com.ord.model.OrdService;
import com.prod.model.ProdVO;

public class ProdJNDIDAO implements ProdDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO product (PROD_ID, MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE) VALUES ('P'||LPAD(to_char(prod_id_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT PROD_ID,MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, to_char(PROD_DATE,'YYYY-MM-DD HH24:MI:SS')PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE FROM product order by PROD_ID desc";
	private static final String GET_ALL_STMT_Front = "SELECT PROD_ID,MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, to_char(PROD_DATE,'YYYY-MM-DD HH24:MI:SS')PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE FROM product where PROD_STATUS='上架' order by PROD_ID desc";
	private static final String GET_ALL_BY_MEMBER = "SELECT PROD_ID,MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, to_char(PROD_DATE,'YYYY-MM-DD HH24:MI:SS')PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE FROM product where MEMB_ID=? order by PROD_ID desc";
	private static final String GET_ONE_STMT = "SELECT PROD_ID,MEMB_ID, PROD_TYPE_ID, PROD_ANI_TYPE_ID, PROD_NAME, PROD_DES, PROD_INFO, PROD_QTY, PROD_STOCK, to_char(PROD_DATE,'YYYY-MM-DD HH24:MI:SS')PROD_DATE, PROD_REVIEW, PROD_REVIEW_DES, PROD_STATUS, PROD_PRICE FROM product where PROD_ID = ?";
	private static final String DELETE = "DELETE FROM product where PROD_ID = ?";
	private static final String UPDATE = "UPDATE product set PROD_TYPE_ID=?, PROD_ANI_TYPE_ID=?, PROD_NAME=?, PROD_DES=?, PROD_INFO=?, PROD_QTY=?, PROD_STOCK=?, PROD_DATE=?, PROD_REVIEW=?, PROD_REVIEW_DES=?, PROD_STATUS=?, PROD_PRICE=? where PROD_ID = ?";
	private static final String UPDATE2 = "UPDATE product set PROD_STOCK=?, PROD_STATUS=? where PROD_ID = ?";

	@Override
	public String insert(ProdVO prodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String str = null;

		try {

			con = ds.getConnection();
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

	//上架審核
	@Override
	public void update(ProdVO prodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			
			// 1●設定於 pstm.executeUpdate()之前
			con.setAutoCommit(false);
			
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
			
			// 再同時新增通知給訂單會員
			NtfVO ntfVO = new NtfVO();
			NtfJDBCDAO ntfDAO = new NtfJDBCDAO();
						
			//上架審核完畢通知
			ntfVO.setMemb_id(prodVO.getMemb_id());
			ntfVO.setNtf_src_id(prodVO.getProd_id());
			ntfVO.setNtf_dt("您的商品: "+prodVO.getProd_name()+"已審核完畢，審核結果:" + prodVO.getProd_review() + "，請前往查看詳細資訊。");
							
						
			ntfDAO.insert(ntfVO, con);
						
						
			// 2●設定於 pstm.executeUpdate()之後
			con.commit();

			// Handle any driver errors
			} catch (SQLException se) {
				if (con != null) {
					try {
						// 3●設定於當有exception發生時之catch區塊內
						System.err.print("Transaction is being ");
						System.err.println("rolled back-由-product");
						con.rollback();
					} catch (SQLException excep) {
						throw new RuntimeException("rollback error occured. " + excep.getMessage());
					}
				}
				throw new RuntimeException("A database error occured. " + se.getMessage());
					// Clean up JDBC resources
			} finally {
				try {
					con.setAutoCommit(true);
				} catch (SQLException e1) {
					e1.printStackTrace();
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
	}

	@Override
	public void update(ProdVO prodVO, Connection con) {
		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement(UPDATE2);

			pstmt.setInt(1, prodVO.getProd_stock());
			pstmt.setString(2, prodVO.getProd_status());
			pstmt.setString(3, prodVO.getProd_id());
			
			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		
		} catch (Exception se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-Product庫存量更新");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
			
	}
	
	
	@Override
	public ProdVO findByPrimaryKey(String prod_id) {
		ProdVO prodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
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

			con = ds.getConnection();
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
	public List<ProdVO> getAll_Front() {
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_Front);
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
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			
			con = ds.getConnection();
			String finalSQL = "select * from product"
		          + jdbcUtil_CompositeQuery_Prod.get_WhereCondition(map)
		          + " order by prod_id desc";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
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
	
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void delete(String prod_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, prod_id);

			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
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

	@Override
	public List<ProdVO> getProdByMem(String memb_id) {
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MEMBER);
			
			pstmt.setString(1, memb_id);

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

	
	

}
