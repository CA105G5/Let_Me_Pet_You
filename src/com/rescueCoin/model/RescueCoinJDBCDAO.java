package com.rescueCoin.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class RescueCoinJDBCDAO implements RescueCoinDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO RESCUE_COIN (rsc_id,rsc_coin_mem) VALUES (?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_id,rsc_coin_mem FROM RESCUE_COIN order by rsc_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_id,rsc_coin_mem FROM RESCUE_COIN where rsc_id = ?";
	private static final String DELETE = 
			"DELETE FROM RESCUE_COIN where rsc_id = ? AND rsc_coin_mem = ?";
	private static final String UPDATE = 
			"UPDATE RESCUE_COIN set rsc_id = ?,rsc_coin_mem = ? where rsc_id = ? AND rsc_coin_mem = ?";

	
	
	@Override
	public void insert(RescueCoinVO rescueCoinVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rescueCoinVO.getRsc_id());
			pstmt.setString(2, rescueCoinVO.getRsc_coin_mem());

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
	public void update(RescueCoinVO rescueCoinVO) {
		
			Connection con = null;
			PreparedStatement pstmt = null;
	
			try {
	
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(UPDATE);
	
				pstmt.setString(1, rescueCoinVO.getRsc_id());
				pstmt.setString(2, rescueCoinVO.getRsc_coin_mem());
				pstmt.setString(3, rescueCoinVO.getRsc_id());
				pstmt.setString(4, rescueCoinVO.getRsc_coin_mem());
	
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
	public void delete(String rsc_id, String rsc_coin_mem) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, rsc_id);
			pstmt.setString(2, rsc_coin_mem);

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
	public RescueCoinVO findByPrimaryKey(String rsc_id) {
		RescueCoinVO rescueCoinVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, rsc_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// prodVo 也稱為 Domain objects
				rescueCoinVO = new RescueCoinVO();
				rescueCoinVO.setRsc_id(rsc_id);
				rescueCoinVO.setRsc_coin_mem(rs.getString("rsc_coin_mem"));
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
		return rescueCoinVO;
	}

	@Override
	public List<RescueCoinVO> getAll() {
		List<RescueCoinVO> list = new ArrayList<RescueCoinVO>();
		RescueCoinVO rescueCoinVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ProdTrackVO 也稱為 Domain objects
				rescueCoinVO = new RescueCoinVO();
				rescueCoinVO.setRsc_id(rs.getString("rsc_id"));
				rescueCoinVO.setRsc_coin_mem(rs.getString("rsc_coin_mem"));
				list.add(rescueCoinVO); // Store the row in the list
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

	public static void main(String[] args) {

		RescueCoinJDBCDAO dao = new RescueCoinJDBCDAO();

//		// 新增
//		RescueCoinVO rescueCoinVO1 = new RescueCoinVO();
//		rescueCoinVO1.setRsc_id("R000000005");
//		rescueCoinVO1.setRsc_coin_mem("M000000001");
//		dao.insert(rescueCoinVO1);

//		// 修改(其實不需要這個，因為兩個都是主鍵)
//		RescueCoinVO rescueCoinVO2 = new RescueCoinVO();
//		rescueCoinVO2.setRsc_id("R000000005");
//		rescueCoinVO2.setRsc_coin_mem("M000000001");
//		dao.update(rescueCoinVO2);

		// 刪除
//		dao.delete("R000000005","M000000001");

//		// 查詢(其實不需要這個，因為兩個都是主鍵)
//		RescueCoinVO rescueCoinVO3 = dao.findByPrimaryKey("R000000001");
//		System.out.print(rescueCoinVO3.getRsc_id() + ",");
//		System.out.println(rescueCoinVO3.getRsc_coin_mem() + ",");
//		System.out.println("---------------------");

//		 查詢
//		List<RescueCoinVO> list = dao.getAll();
//		for (RescueCoinVO aRscCoin : list) {
//			System.out.print(aRscCoin.getRsc_id() + ",");
//			System.out.print(aRscCoin.getRsc_coin_mem() + ",");
//			System.out.println();
//		}
	}
}
