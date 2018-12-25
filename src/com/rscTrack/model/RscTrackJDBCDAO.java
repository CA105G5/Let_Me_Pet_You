package com.rscTrack.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.rescueCoin.model.RescueCoinVO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_RscTrack;







public class RscTrackJDBCDAO implements RscTrackDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO RSC_TRACK (rsc_id,memb_id) VALUES (?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_id,memb_id FROM RSC_TRACK order by memb_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_id,memb_id FROM RSC_TRACK where rsc_id = ?";
	private static final String DELETE = 
			"DELETE FROM RSC_TRACK where rsc_id = ? AND memb_id = ?";
	private static final String UPDATE = 
			"UPDATE RSC_TRACK set rsc_id = ?,memb_id = ? where rsc_id = ? AND memb_id = ?";

	@Override
	public void insert(RscTrackVO rscTrackVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rscTrackVO.getRsc_id());
			pstmt.setString(2, rscTrackVO.getMemb_id());

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
	public void update(RscTrackVO rscTrackVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, rscTrackVO.getRsc_id());
			pstmt.setString(2, rscTrackVO.getMemb_id());
			pstmt.setString(3, rscTrackVO.getRsc_id());
			pstmt.setString(4, rscTrackVO.getMemb_id());

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
	public void delete(String rsc_id, String memb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, rsc_id);
			pstmt.setString(2, memb_id);

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
	public RscTrackVO findByPrimaryKey(String rsc_id) {
		RscTrackVO rscTrackVO = null;
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
				rscTrackVO = new RscTrackVO();
				rscTrackVO.setRsc_id(rsc_id);
				rscTrackVO.setMemb_id(rs.getString("memb_id"));
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
		return rscTrackVO;
	}

	@Override
	public List<RscTrackVO> getAll() {
		List<RscTrackVO> list = new ArrayList<RscTrackVO>();
		RscTrackVO rscTrackVO = null;

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
				rscTrackVO = new RscTrackVO();
				rscTrackVO.setRsc_id(rs.getString("rsc_id"));
				rscTrackVO.setMemb_id(rs.getString("memb_id"));
				
				list.add(rscTrackVO); // Store the row in the list
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
	public List<RscTrackVO> getAll(Map<String, String[]> map) {
		
		List<RscTrackVO> list = new ArrayList<RscTrackVO>();
		RscTrackVO rscTrackVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			String finalSQL = "select * from rsc_track "
			          + jdbcUtil_CompositeQuery_RscTrack.get_WhereCondition(map)
			          + "order by rsc_id";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				rscTrackVO = new RscTrackVO();
				rscTrackVO.setRsc_id(rs.getString("rsc_id"));
				rscTrackVO.setMemb_id(rs.getString("memb_id"));
				list.add(rscTrackVO); // Store the row in the List
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

		RscTrackJDBCDAO dao = new RscTrackJDBCDAO();

//		// 新增
//		RscTrackVO rscTrackVO1 = new RscTrackVO();
//		rscTrackVO1.setRsc_id("R000000001");
//		rscTrackVO1.setMemb_id("M000000005");
//		dao.insert(rscTrackVO1);

		// 修改(其實不需要這個，因為兩個都是主鍵)
//		RscTrackVO rscTrackVO2 = new RscTrackVO();
//		rscTrackVO2.setRsc_id("R000000001");
//		rscTrackVO2.setMemb_id("M000000005");
//		dao.update(rscTrackVO2);
//
		// 刪除
//		dao.delete("R000000001","M000000005");
//
////		// 查詢(其實不需要這個，因為兩個都是主鍵)
//		RscTrackVO rscTrackVO3 = dao.findByPrimaryKey("R000000004");
//		System.out.print(rscTrackVO3.getRsc_id() + ",");
//		System.out.println(rscTrackVO3.getMemb_id() + ",");
//		System.out.println("---------------------");
//
////		 查詢
//		List<RscTrackVO> list = dao.getAll();
//		for (RscTrackVO aRscTrack : list) {
//			System.out.print(aRscTrack.getRsc_id() + ",");
//			System.out.print(aRscTrack.getMemb_id() + ",");
//			System.out.println();
//		}
		
//		複合查詢
		
//		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("rsc_id", new String[] { "R000000003" });
//		
//		map.put("action", new String[] { "getXXX" });
//		List<RscTrackVO> list = dao.getAll(map);
//		for (RscTrackVO aRscTrack : list) {
//			System.out.print(aRscTrack.getRsc_id() + ",");
//			System.out.print(aRscTrack.getMemb_id() + ",");
//			System.out.println();
//		}
	}


}
