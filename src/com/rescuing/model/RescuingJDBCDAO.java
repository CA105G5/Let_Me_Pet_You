package com.rescuing.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;





public class RescuingJDBCDAO implements RescuingDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	

	private static final String INSERT_STMT = 
			"INSERT INTO RESCUING (rsc_id,rscing_ptcp,rscing_btime,rscing_sta,rscing_cdes,rscing_ctime,rscing_etime,rscing_lat,rscing_lon,rscing_rv_des) VALUES (?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_id,rscing_ptcp,to_char(rscing_btime,'yyyy-mm-dd hh24:mi:ss') rscing_btime,rscing_sta,rscing_cdes,to_char(rscing_ctime,'yyyy-mm-dd hh24:mi:ss') rscing_ctime,to_char(rscing_etime,'yyyy-mm-dd hh24:mi:ss') rscing_etime,rscing_lat,rscing_lon,rscing_rv_des FROM RESCUING order by rsc_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_id,rscing_ptcp,to_char(rscing_btime,'yyyy-mm-dd hh24:mi:ss') rscing_btime,rscing_sta,rscing_cdes,to_char(rscing_ctime,'yyyy-mm-dd hh24:mi:ss') rscing_ctime,to_char(rscing_etime,'yyyy-mm-dd hh24:mi:ss') rscing_etime,rscing_lat,rscing_lon,rscing_rv_des FROM RESCUING where rsc_id = ?";
	private static final String DELETE = 
			"DELETE FROM RESCUING where rsc_id = ? AND rscing_ptcp = ?";
	private static final String UPDATE = 
			"UPDATE RESCUING set rscing_btime = ?,rscing_sta = ?,rscing_cdes = ?,rscing_ctime = ?,rscing_etime = ?,rscing_lat = ?,rscing_lon = ?,rscing_rv_des = ? where rsc_id = ? AND rscing_ptcp = ?";
	
	

	@Override
	public void insert(RescuingVO rescuingVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
	
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rescuingVO.getRsc_id());
			pstmt.setString(2, rescuingVO.getRscing_ptcp());
			pstmt.setTimestamp(3, rescuingVO.getRscing_btime());
			pstmt.setString(4, rescuingVO.getRscing_sta());
			pstmt.setString(5, rescuingVO.getRscing_cdes());
			pstmt.setTimestamp(6, rescuingVO.getRscing_ctime());
			pstmt.setTimestamp(7, rescuingVO.getRscing_etime());
			pstmt.setDouble(8, rescuingVO.getRscing_lat());
			pstmt.setDouble(9, rescuingVO.getRscing_lon());
			pstmt.setString(10, rescuingVO.getRscing_rv_des());

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
	public void update(RescuingVO rescuingVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setTimestamp(1, rescuingVO.getRscing_btime());
			pstmt.setString(2, rescuingVO.getRscing_sta());
			pstmt.setString(3, rescuingVO.getRscing_cdes());
			pstmt.setTimestamp(4, rescuingVO.getRscing_ctime());
			pstmt.setTimestamp(5, rescuingVO.getRscing_etime());
			pstmt.setDouble(6, rescuingVO.getRscing_lat());
			pstmt.setDouble(7, rescuingVO.getRscing_lon());
			pstmt.setString(8, rescuingVO.getRscing_rv_des());
			pstmt.setString(9, rescuingVO.getRsc_id());
			pstmt.setString(10, rescuingVO.getRscing_ptcp());

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
	public void delete(String rsc_id, String rscing_ptcp) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,rsc_id);
			pstmt.setString(2,rscing_ptcp);

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
	public RescuingVO findByPrimaryKey(String rsc_id) {
		RescuingVO rescuingVO = null;
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
				// rescuingVo 也稱為 Domain objects
				rescuingVO = new RescuingVO();
				rescuingVO.setRsc_id(rs.getString("rsc_id"));
				rescuingVO.setRscing_ptcp(rs.getString("rscing_ptcp"));
				rescuingVO.setRscing_btime(rs.getTimestamp("rscing_btime"));
				rescuingVO.setRscing_sta(rs.getString("rscing_sta"));
				rescuingVO.setRscing_cdes(rs.getString("rscing_cdes"));
				rescuingVO.setRscing_ctime(rs.getTimestamp("rscing_ctime"));
				rescuingVO.setRscing_etime(rs.getTimestamp("rscing_etime"));
				rescuingVO.setRscing_lat(rs.getDouble("rscing_lat"));
				rescuingVO.setRscing_lon(rs.getDouble("rscing_lon"));
				rescuingVO.setRscing_rv_des(rs.getString("rscing_rv_des"));
				
				
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
		return rescuingVO;
	}

	@Override
	public List<RescuingVO> getAll() {
		List<RescuingVO> list = new ArrayList<RescuingVO>();
		RescuingVO rescuingVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				rescuingVO = new RescuingVO();
				rescuingVO.setRsc_id(rs.getString("rsc_id"));
				rescuingVO.setRscing_ptcp(rs.getString("rscing_ptcp"));
				rescuingVO.setRscing_btime(rs.getTimestamp("rscing_btime"));
				rescuingVO.setRscing_sta(rs.getString("rscing_sta"));
				rescuingVO.setRscing_cdes(rs.getString("rscing_cdes"));
				rescuingVO.setRscing_ctime(rs.getTimestamp("rscing_ctime"));
				rescuingVO.setRscing_etime(rs.getTimestamp("rscing_etime"));
				rescuingVO.setRscing_lat(rs.getDouble("rscing_lat"));
				rescuingVO.setRscing_lon(rs.getDouble("rscing_lon"));
				rescuingVO.setRscing_rv_des(rs.getString("rscing_rv_des"));
				list.add(rescuingVO); // Store the row in the list
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
	public static void main(String[] args) {

		RescuingJDBCDAO dao = new RescuingJDBCDAO();

		// 新增
//		RescuingVO rescuingVO1 = new RescuingVO();
//
//		rescuingVO1.setRsc_id("R000000005");
//		rescuingVO1.setRscing_ptcp("M000000003");
//		rescuingVO1.setRscing_lat(new Double(24.9460628));
//		rescuingVO1.setRscing_lon(new Double(121.1992745));
//		rescuingVO1.setRscing_btime(new Timestamp(new Date().getTime()));
//		dao.insert(rescuingVO1);

//		// 修改
//		RescuingVO rescuingVO2 = new RescuingVO();
//		rescuingVO2.setRsc_id("R000000005");
//		rescuingVO2.setRscing_ptcp("M000000003");
//		rescuingVO2.setRscing_lat(new Double(24));
//		rescuingVO2.setRscing_lon(new Double(121));
//		rescuingVO2.setRscing_btime(new Timestamp(new Date().getTime()));
//		dao.update(rescuingVO2);

		// 刪除
//		dao.delete("R000000005","M000000003");

		// 查詢
//		RescuingVO rescuingVO3 = dao.findByPrimaryKey("R000000001");
//		System.out.print(rescuingVO3.getRsc_id() + ",");
//		System.out.print(rescuingVO3.getRscing_ptcp() + ",");
//		System.out.print(rescuingVO3.getRscing_sta() + ",");
//		System.out.print(rescuingVO3.getRscing_lat() + ",");
//		System.out.println(rescuingVO3.getRscing_lon() + ",");
//		System.out.println("---------------------");
//
		// 查詢
//		List<RescuingVO> list = dao.getAll();
//		for (RescuingVO aRscing : list) {
//			System.out.print(aRscing.getRsc_id() + ",");
//			System.out.print(aRscing.getRscing_ptcp() + ",");
//			System.out.print(aRscing.getRscing_sta() + ",");
//			System.out.print(aRscing.getRscing_lat() + ",");
//			System.out.print(aRscing.getRscing_lon() + ",");
//			System.out.println();
//		}
	}
}