package com.rscMsgRt.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.rscRt.model.RscRtJDBCDAO;
import com.rscRt.model.RscRtVO;

public class RscMsgRtJDBCDAO implements RscMsgRtDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO RSC_MSG_RT (rsc_msg_rt_id,rsc_msg_id,memb_id,rsc_msg_rt_time,rsc_msg_rt_comm,rsc_msg_rv_des,rsc_msg_rt_status) VALUES ('RMR'||LPAD(to_char(rsc_rt_seq.NEXTVAL), 12, '0'),?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_msg_rt_id,rsc_msg_id,memb_id,to_char(rsc_msg_rt_time,'yyyy-mm-dd hh24:mi:ss') rsc_msg_rt_time,rsc_msg_rt_comm,rsc_msg_rv_des,rsc_msg_rt_status FROM RSC_MSG_RT order by rsc_msg_rt_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_msg_rt_id,rsc_msg_id,memb_id,to_char(rsc_msg_rt_time,'yyyy-mm-dd hh24:mi:ss') rsc_msg_rt_time,rsc_msg_rt_comm,rsc_msg_rv_des,rsc_msg_rt_status FROM RSC_MSG_RT where rsc_msg_rt_id = ?";
	private static final String DELETE = 
			"DELETE FROM RSC_MSG_RT where rsc_msg_rt_id = ?";
	private static final String UPDATE = 
			"UPDATE RSC_MSG_RT set rsc_msg_id = ?,memb_id = ?,rsc_msg_rt_time = ?,rsc_msg_rt_comm = ?,rsc_msg_rv_des = ?,rsc_msg_rt_status = ? where rsc_msg_rt_id = ?";
	
	@Override
	public void insert(RscMsgRtVO rscMsgRtVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rscMsgRtVO.getRsc_msg_id());
			pstmt.setString(2, rscMsgRtVO.getMemb_id());
			pstmt.setTimestamp(3, rscMsgRtVO.getRsc_msg_rt_time());
			pstmt.setString(4, rscMsgRtVO.getRsc_msg_rt_comm());
			pstmt.setString(5, rscMsgRtVO.getRsc_msg_rv_des());
			pstmt.setString(6, rscMsgRtVO.getRsc_msg_rt_status());
		

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
	public void update(RscMsgRtVO rscMsgRtVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, rscMsgRtVO.getRsc_msg_id());
			pstmt.setString(2, rscMsgRtVO.getMemb_id());
			pstmt.setTimestamp(3, rscMsgRtVO.getRsc_msg_rt_time());
			pstmt.setString(4, rscMsgRtVO.getRsc_msg_rt_comm());
			pstmt.setString(5, rscMsgRtVO.getRsc_msg_rv_des());
			pstmt.setString(6, rscMsgRtVO.getRsc_msg_rt_status());
			pstmt.setString(7, rscMsgRtVO.getRsc_msg_rt_id());
			

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
	public void delete(String rsc_msg_rt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,rsc_msg_rt_id);

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
	public RscMsgRtVO findByPrimaryKey(String rsc_msg_rt_id) {
		RscMsgRtVO rscMsgRtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,rsc_msg_rt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// regionVo 嘿 Domain objects
				rscMsgRtVO = new RscMsgRtVO();
				rscMsgRtVO.setRsc_msg_rt_id(rs.getString("rsc_msg_rt_id"));
				rscMsgRtVO.setRsc_msg_id(rs.getString("rsc_msg_id"));
				rscMsgRtVO.setMemb_id(rs.getString("memb_id"));
				rscMsgRtVO.setRsc_msg_rt_time(rs.getTimestamp("rsc_msg_rt_time"));
				rscMsgRtVO.setRsc_msg_rt_comm(rs.getString("rsc_msg_rt_comm"));
				rscMsgRtVO.setRsc_msg_rv_des(rs.getString("rsc_msg_rv_des"));
				rscMsgRtVO.setRsc_msg_rt_status(rs.getString("rsc_msg_rt_status"));
				
				
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
		return rscMsgRtVO;
	}

	@Override
	public List<RscMsgRtVO> getAll() {
		List<RscMsgRtVO> list = new ArrayList<RscMsgRtVO>();
		RscMsgRtVO rscMsgRtVO = null;

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
				rscMsgRtVO = new RscMsgRtVO();
				rscMsgRtVO.setRsc_msg_rt_id(rs.getString("rsc_msg_rt_id"));
				rscMsgRtVO.setRsc_msg_id(rs.getString("rsc_msg_id"));
				rscMsgRtVO.setMemb_id(rs.getString("memb_id"));
				rscMsgRtVO.setRsc_msg_rt_time(rs.getTimestamp("rsc_msg_rt_time"));
				rscMsgRtVO.setRsc_msg_rt_comm(rs.getString("rsc_msg_rt_comm"));
				rscMsgRtVO.setRsc_msg_rv_des(rs.getString("rsc_msg_rv_des"));
				list.add(rscMsgRtVO); // Store the row in the list
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

		RscMsgRtJDBCDAO dao = new RscMsgRtJDBCDAO();

		 //新增
//		RscMsgRtVO rscMsgRtVO1 = new RscMsgRtVO();
//
//		rscMsgRtVO1.setRsc_msg_id("RM0000000000003");
//		rscMsgRtVO1.setMemb_id("M000000001");
//		rscMsgRtVO1.setRsc_msg_rt_time(new Timestamp(new Date().getTime()));
//		rscMsgRtVO1.setRsc_msg_rt_comm("XXX");
//		rscMsgRtVO1.setRsc_msg_rv_des("XXX");
//		rscMsgRtVO1.setRsc_msg_rt_status("XXX");
//		dao.insert(rscMsgRtVO1);

		// 修改
//		RscMsgRtVO rscMsgRtVO2 = new RscMsgRtVO();
//		rscMsgRtVO2.setRsc_msg_rt_id("RMR000000000003");
//		rscMsgRtVO2.setRsc_msg_id("RM0000000000003");
//		rscMsgRtVO2.setMemb_id("M000000008");
//		rscMsgRtVO2.setRsc_msg_rt_comm("XXXX");
//		rscMsgRtVO2.setRsc_msg_rv_des("XXXX");
//		rscMsgRtVO2.setRsc_msg_rt_status("XXXX");
//		dao.update(rscMsgRtVO2);

		// 刪除
//		dao.delete("RMR000000000003");

		// 查詢
		RscMsgRtVO rscMsgRtVO3 = dao.findByPrimaryKey("RMR000000000001");
		System.out.print(rscMsgRtVO3.getRsc_msg_rt_id() + ",");
		System.out.print(rscMsgRtVO3.getMemb_id() + ",");
		System.out.print(rscMsgRtVO3.getRsc_msg_rt_time() + ",");
		System.out.print(rscMsgRtVO3.getRsc_msg_rt_comm() + ",");
		System.out.print(rscMsgRtVO3.getRsc_msg_rv_des() + ",");
		System.out.print(rscMsgRtVO3.getRsc_msg_rt_status() + ",");
		System.out.println(rscMsgRtVO3.getRsc_msg_rt_id()+ ",");
		System.out.println("---------------------");

		// 查詢
		List<RscMsgRtVO> list = dao.getAll();
		for (RscMsgRtVO aRscMsgRt : list) {
			System.out.print(aRscMsgRt.getRsc_msg_rt_id() + ",");
			System.out.print(aRscMsgRt.getRsc_msg_id()+ ",");
			System.out.print(aRscMsgRt.getMemb_id() + ",");
			System.out.print(aRscMsgRt.getRsc_msg_rt_time() + ",");
			System.out.print(aRscMsgRt.getRsc_msg_rt_comm() + ",");
			System.out.print(aRscMsgRt.getRsc_msg_rv_des() + ",");
			System.out.print(aRscMsgRt.getRsc_msg_rt_status() + ",");
			
			System.out.println();
			
		}
	}

}
