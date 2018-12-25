package com.rscRt.model;

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
import java.util.TreeMap;




import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_RscRt;






public class RscRtJDBCDAO implements RscRtDAO_interface{

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO RSC_RT (rsc_rt_id,rsc_id,memb_id,rsc_rt_time,rsc_rt_comm,rsc_rv_des,rsc_rt_status) VALUES ('RR'||LPAD(to_char(rsc_rt_seq.NEXTVAL), 13, '0'),?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_rt_id,rsc_id,memb_id,to_char(rsc_rt_time,'yyyy-mm-dd hh24:mi:ss') rsc_rt_time,rsc_rt_comm,rsc_rv_des,rsc_rt_status FROM RSC_RT order by rsc_rt_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_rt_id,rsc_id,memb_id,to_char(rsc_rt_time,'yyyy-mm-dd hh24:mi:ss') rsc_rt_time,rsc_rt_comm,rsc_rv_des,rsc_rt_status FROM RSC_RT where rsc_rt_id = ?";
	private static final String DELETE = 
			"DELETE FROM RSC_RT where rsc_rt_id = ?";
	private static final String UPDATE = 
			"UPDATE RSC_RT set rsc_id = ?,memb_id = ?,rsc_rt_time = ?,rsc_rt_comm = ?,rsc_rv_des = ?,rsc_rt_status = ? where rsc_rt_id = ?";
	
	
	
	@Override
	public void insert(RscRtVO rscRtVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rscRtVO.getRsc_id());
			pstmt.setString(2, rscRtVO.getMemb_id());
			pstmt.setTimestamp(3, rscRtVO.getRsc_rt_time());
			pstmt.setString(4, rscRtVO.getRsc_rt_comm());
			pstmt.setString(5, rscRtVO.getRsc_rv_des());
			pstmt.setString(6, rscRtVO.getRsc_rt_status());
		

			int rowsUpdated =pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
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
	public void update(RscRtVO rscRtVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, rscRtVO.getRsc_id());
			pstmt.setString(2, rscRtVO.getMemb_id());
			pstmt.setTimestamp(3, rscRtVO.getRsc_rt_time());
			pstmt.setString(4, rscRtVO.getRsc_rt_comm());
			pstmt.setString(5, rscRtVO.getRsc_rv_des());
			pstmt.setString(6, rscRtVO.getRsc_rt_status());
			pstmt.setString(7, rscRtVO.getRsc_rt_id());
			

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
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
	public void delete(String rsc_rt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,rsc_rt_id);

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
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
	public RscRtVO findByPrimaryKey(String rsc_rt_id) {
		RscRtVO rscRtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,rsc_rt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// regionVo 嘿 Domain objects
				rscRtVO = new RscRtVO();
				rscRtVO.setRsc_rt_id(rs.getString("rsc_rt_id"));
				rscRtVO.setRsc_id(rs.getString("rsc_id"));
				rscRtVO.setMemb_id(rs.getString("memb_id"));
				rscRtVO.setRsc_rt_time(rs.getTimestamp("rsc_rt_time"));
				rscRtVO.setRsc_rt_comm(rs.getString("rsc_rt_comm"));
				rscRtVO.setRsc_rv_des(rs.getString("rsc_rv_des"));
				rscRtVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return rscRtVO;
	}

	@Override
	public List<RscRtVO> getAll() {
		List<RscRtVO> list = new ArrayList<RscRtVO>();
		RscRtVO rscRtVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 嘿 Domain objects
				rscRtVO = new RscRtVO();
				rscRtVO.setRsc_rt_id(rs.getString("rsc_rt_id"));
				rscRtVO.setRsc_id(rs.getString("rsc_id"));
				rscRtVO.setMemb_id(rs.getString("memb_id"));
				rscRtVO.setRsc_rt_time(rs.getTimestamp("rsc_rt_time"));
				rscRtVO.setRsc_rt_comm(rs.getString("rsc_rt_comm"));
				rscRtVO.setRsc_rv_des(rs.getString("rsc_rv_des"));
				rscRtVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				list.add(rscRtVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public List<RscRtVO> getAll(Map<String, String[]> map) {
		List<RscRtVO> list = new ArrayList<RscRtVO>();
		RscRtVO rscRtVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			String finalSQL = "select * from rsc_rt "
			          + jdbcUtil_CompositeQuery_RscRt.get_WhereCondition(map)
			          + "order by rsc_rt_id";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {

				rscRtVO = new RscRtVO();
				rscRtVO.setRsc_rt_id(rs.getString("rsc_rt_id"));
				rscRtVO.setRsc_id(rs.getString("rsc_id"));
				rscRtVO.setMemb_id(rs.getString("memb_id"));
				rscRtVO.setRsc_rt_time(rs.getTimestamp("rsc_rt_time"));
				rscRtVO.setRsc_rt_comm(rs.getString("rsc_rt_comm"));
				rscRtVO.setRsc_rv_des(rs.getString("rsc_rv_des"));
				rscRtVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				list.add(rscRtVO); // Store the row in the List
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

		RscRtJDBCDAO dao = new RscRtJDBCDAO();

		 //新增
//		RscRtVO rscRtVO1 = new RscRtVO();
//
//		rscRtVO1.setRsc_id("R000000003");
//		rscRtVO1.setMemb_id("M000000008");
//		rscRtVO1.setRsc_rt_time(new Timestamp(new Date().getTime()));
//		rscRtVO1.setRsc_rt_comm("XXX");
//		rscRtVO1.setRsc_rv_des("XXX");
//		rscRtVO1.setRsc_rt_status("XXX");
//		dao.insert(rscRtVO1);

		// 修改
//		RscRtVO rscRtVO2 = new RscRtVO();
//		rscRtVO2.setRsc_rt_id("RR0000000000003");
//		rscRtVO2.setRsc_id("R000000003");
//		rscRtVO2.setMemb_id("M000000008");
//		rscRtVO2.setRsc_rt_comm("XXX");
//		rscRtVO2.setRsc_rv_des("XXX");
//		rscRtVO2.setRsc_rt_status("XXX");
//		dao.update(rscRtVO2);

		// 刪除
//		dao.delete("RR0000000000003");

//		// 查詢
//		RscRtVO rscRtVO3 = dao.findByPrimaryKey("RR0000000000001");
//		System.out.print(rscRtVO3.getRsc_id() + ",");
//		System.out.print(rscRtVO3.getMemb_id() + ",");
//		System.out.print(rscRtVO3.getRsc_rt_time() + ",");
//		System.out.print(rscRtVO3.getRsc_rt_comm() + ",");
//		System.out.print(rscRtVO3.getRsc_rv_des() + ",");
//		System.out.print(rscRtVO3.getRsc_rt_status() + ",");
//		System.out.println(rscRtVO3.getRsc_rt_id()+ ",");
//		System.out.println("---------------------");
//
		// 查詢
//		List<RscRtVO> list = dao.getAll();
//		for (RscRtVO aRsc : list) {
//			System.out.print(aRsc.getRsc_id() + ",");
//			System.out.print(aRsc.getMemb_id() + ",");
//			System.out.print(aRsc.getRsc_rt_time() + ",");
//			System.out.print(aRsc.getRsc_rt_comm() + ",");
//			System.out.print(aRsc.getRsc_rv_des() + ",");
//			System.out.print(aRsc.getRsc_rt_status() + ",");
//			System.out.print(aRsc.getRsc_rt_id()+ ",");
//			System.out.println();
//			
//		}
		
	//複合查詢
		
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("rsc_rt_id", new String[] { "RR0000000000001" });
		map.put("action", new String[] { "getXXX" });
		List<RscRtVO> list = dao.getAll(map);
		for (RscRtVO aRsc : list) {
			System.out.print(aRsc.getRsc_id() + ",");
			System.out.print(aRsc.getMemb_id() + ",");
			System.out.print(aRsc.getRsc_rt_time() + ",");
			System.out.print(aRsc.getRsc_rt_comm() + ",");
			System.out.print(aRsc.getRsc_rv_des() + ",");
			System.out.print(aRsc.getRsc_rt_status() + ",");
			System.out.print(aRsc.getRsc_rt_id()+ ",");
			System.out.println();
		}
	}


}
