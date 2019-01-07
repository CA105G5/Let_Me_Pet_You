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
import java.util.Map;
import java.util.TreeMap;

import com.mem.model.MemJDBCDAO;
import com.ntf.model.NtfJDBCDAO;
import com.ntf.model.NtfVO;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;
import com.volunteer.model.VolunteerJDBCDAO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Rescuing;
import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Volunteer;

 



public class RescuingJDBCDAO implements RescuingDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	

	private static final String INSERT_STMT = 
			"INSERT INTO RESCUING (rsc_id,rscing_ptcp,rscing_btime,rscing_sta) VALUES (?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_id,rscing_ptcp,to_char(rscing_btime,'yyyy-mm-dd hh24:mi:ss') rscing_btime,rscing_sta,rscing_cdes,to_char(rscing_ctime,'yyyy-mm-dd hh24:mi:ss') rscing_ctime,to_char(rscing_etime,'yyyy-mm-dd hh24:mi:ss') rscing_etime,rscing_lat,rscing_lon,rscing_rv_des FROM RESCUING order by rsc_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_id,rscing_ptcp,to_char(rscing_btime,'yyyy-mm-dd hh24:mi:ss') rscing_btime,rscing_sta,rscing_cdes,to_char(rscing_ctime,'yyyy-mm-dd hh24:mi:ss') rscing_ctime,to_char(rscing_etime,'yyyy-mm-dd hh24:mi:ss') rscing_etime,rscing_lat,rscing_lon,rscing_rv_des FROM RESCUING where rsc_id = ?";
	private static final String GET_ONE_SELF = 
			"SELECT rsc_id,rscing_ptcp,to_char(rscing_btime,'yyyy-mm-dd hh24:mi:ss') rscing_btime,rscing_sta,rscing_cdes,to_char(rscing_ctime,'yyyy-mm-dd hh24:mi:ss') rscing_ctime,to_char(rscing_etime,'yyyy-mm-dd hh24:mi:ss') rscing_etime,rscing_lat,rscing_lon,rscing_rv_des FROM RESCUING where rsc_id = ? AND rscing_ptcp = ?";
	private static final String DELETE = 
			"DELETE FROM RESCUING where rsc_id = ? AND rscing_ptcp = ?";
	private static final String UPDATE = 
			"UPDATE RESCUING set rscing_btime = ?,rscing_sta = ?,rscing_cdes = ?,rscing_etime = ?,rscing_lat = ?,rscing_lon = ?,rscing_rv_des = ? where rsc_id = ? AND rscing_ptcp = ?";
	private static final String UPDATE_BY_VOLUNTEER = 
			"update RESCUING set rscing_sta=? where rsc_id = ?";
	private static final String GET_ALL_MEM =
			"SELECT rscing_ptcp FROM Rescuing where rsc_id = ?";
	private static final String GET_PASS_MEM =
			"SELECT rscing_ptcp FROM Rescuing where rsc_id = ? AND rscing_sta = ?";
	private static final String UPDATE_PASS_MEM = 
			"UPDATE RESCUING set rscing_sta = ?,rscing_etime = ? where rsc_id = ? AND rscing_ptcp = ?";
	
	@Override
	public void insert(RescuingVO rescuingVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
	
			con = DriverManager.getConnection(url, userid, passwd);
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
    		
    		//先新增rescuing
    		
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rescuingVO.getRsc_id());
			pstmt.setString(2, rescuingVO.getRscing_ptcp());
			pstmt.setTimestamp(3, rescuingVO.getRscing_btime());
			pstmt.setString(4, rescuingVO.getRscing_sta());
//			pstmt.setString(5, rescuingVO.getRscing_cdes());
//			pstmt.setTimestamp(6, rescuingVO.getRscing_ctime());
//			pstmt.setTimestamp(7, rescuingVO.getRscing_etime());
//			pstmt.setDouble(8, rescuingVO.getRscing_lat());
//			pstmt.setDouble(9, rescuingVO.getRscing_lon());
//			pstmt.setString(10, rescuingVO.getRscing_rv_des());

			int rowsUpdated =pstmt.executeUpdate();
//			System.out.println("Changed " + rowsUpdated + "rows");
			
			//同時改變rescue的rsc_sta為救援中
			RescueJDBCDAO dao = new RescueJDBCDAO();
			dao.updateRscSta(rescuingVO.getRsc_id(), con);
			// 2●設定於 pstm.executeUpdate()之後
			con.commit();
			con.setAutoCommit(true);
			System.out.println("新增"+rowsUpdated+"筆rescuing，同時改變rescue為救援中");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-dept");
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
			pstmt.setTimestamp(4, rescuingVO.getRscing_etime());
			pstmt.setDouble(5, rescuingVO.getRscing_lat());
			pstmt.setDouble(6, rescuingVO.getRscing_lon());
			pstmt.setString(7, rescuingVO.getRscing_rv_des());
			pstmt.setString(8, rescuingVO.getRsc_id());
			pstmt.setString(9, rescuingVO.getRscing_ptcp());

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
	
	@Override
	public List<RescuingVO> getAll(Map<String, String[]> map) {
		List<RescuingVO> list = new ArrayList<RescuingVO>();
		RescuingVO rescuingVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			String finalSQL = "select * from rescuing "
			          + jdbcUtil_CompositeQuery_Rescuing.get_WhereCondition(map)
			          + "order by rsc_id";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
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
				list.add(rescuingVO); // Store the row in the List
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
	
	@Override
	public RescuingVO findself(String rsc_id, String rscing_ptcp) {
		RescuingVO rescuingVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_SELF);

			pstmt.setString(1, rsc_id);
			pstmt.setString(2,rscing_ptcp);

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
	public List updateByVolunteer(String rsc_id, Connection con) {
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		List memlist = new ArrayList();
		
		try {

			pstmt = con.prepareStatement(UPDATE_BY_VOLUNTEER);
			//改成不通過
			pstmt.setString(1,new String("不通過"));
			pstmt.setString(2,rsc_id);

			pstmt.executeUpdate();
//			System.out.println("Changed " + rowsUpdated + "rows");
			//查出不通過的那些會員
			pstmt2 = con.prepareStatement(GET_ALL_MEM);
			pstmt2.setString(1, rsc_id);
			rs = pstmt2.executeQuery();
			while (rs.next()) {
				memlist.add(rs.getString(1));
			}
			
			rs.close();
			

			// Handle any driver errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-rescue");
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
			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
			return memlist;
	}
public void updatePassMem(String rsc_id,String rsc_ptcp, Connection con) {
		
		PreparedStatement pstmt = null;
		
		try {

			pstmt = con.prepareStatement(UPDATE_PASS_MEM);
			//改成不通過
			pstmt.setString(1,new String("完成救援"));
			pstmt.setTimestamp(2,new Timestamp(new Date().getTime()));
			pstmt.setString(3,rsc_id);
			pstmt.setString(4,rsc_ptcp);

			pstmt.executeUpdate();
//			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-rescue");
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
	public void updateByManagerPass(RescueVO rescueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		ResultSet rs = null;
		List<String> passmem = new ArrayList<String>();
		List<String> nopassmem = new ArrayList<String>();
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
    		//先改救援表
    		RescueJDBCDAO dao = new RescueJDBCDAO();
    		dao.updateByPass(rescueVO.getRsc_id(), con);
			//查有完成的會員
    		pstmt = con.prepareStatement(GET_PASS_MEM);

			pstmt.setString(1,rescueVO.getRsc_id());
		    pstmt.setString(2,"完成救援送審中");
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	passmem.add(rs.getString(1));
		    }
		    //查未完成的會員
		    pstmt2 = con.prepareStatement(GET_PASS_MEM);

			pstmt2.setString(1,rescueVO.getRsc_id());
		    pstmt2.setString(2,"救援中");
		    rs = pstmt2.executeQuery();
		    while(rs.next()) {
		    	nopassmem.add(rs.getString(1));
		    }
		    //完成的會員狀態改變,會員愛心幣
		    MemJDBCDAO dao2 = new MemJDBCDAO();
		    
		    for(String i:passmem) {
		    	updatePassMem(rescueVO.getRsc_id(),i,con);
		    	dao2.updateBalance(i,rescueVO.getRsc_coin(), con);
		    }
		   
		    
		    //愛心幣明細
			//新增通知
//			NtfJDBCDAO dao2 = new NtfJDBCDAO();
//			for (String i :passmem) {
//				NtfVO ntfVO = new NtfVO();
//				ntfVO.setMemb_id(i);
//				ntfVO.setNtf_src_id(rsc_id);
//				ntfVO.setNtf_dt("救援編號:"+rsc_id+"，通過審核，已發送愛心幣!");
//				dao2.insert(ntfVO,con);
//			}
//			con.commit();
//			con.setAutoCommit(true);
//			System.out.println("已成功分派救援給志工");
//			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-dept");
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
			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt3 != null) {
				try {
					pstmt3.close();
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
	public void updateByManagerNoPass(String rsc_id) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			// 1●設定於 pstm.executeUpdate()之前
//    		con.setAutoCommit(false);
//			//修改rescue
//    		pstmt = con.prepareStatement(UPDATE_BY_MANAGER);
//
//			
//			pstmt.setString(1, rescueVO.getVlt_id());
//		    pstmt.setString(2, rescueVO.getRsc_sta());
//			pstmt.setString(3, rescueVO.getNtf_vlt_dt());
//			pstmt.setString(4, rescueVO.getNtf_vlt_sta());
//			pstmt.setTimestamp(5, rescueVO.getNtf_vlt_time());
//			pstmt.setString(6, rescueVO.getRsc_id());
//
//			pstmt.executeUpdate();
////			System.out.println("Changed " + rowsUpdated + "rows");
//			//改變志工狀態
//			VolunteerJDBCDAO dao1 = new VolunteerJDBCDAO();
//		    dao1.updateStaByManager(rescueVO.getVlt_id(), con);
//			//同時改變rescueing的人 得到參與的會員編號
//			
//			RescuingJDBCDAO dao2 = new RescuingJDBCDAO();
//			List<String> list = dao2.updateByVolunteer(rescueVO.getRsc_id(), con);
//			//新增通知
//			NtfJDBCDAO dao3 = new NtfJDBCDAO();
//			for (String i :list) {
//				NtfVO ntfVO = new NtfVO();
//				ntfVO.setMemb_id(i);
//				ntfVO.setNtf_src_id(rescueVO.getRsc_id());
//				ntfVO.setNtf_dt("救援編號:"+rescueVO.getRsc_id()+"，救援逾時，已派志工前往。");
//				dao3.insert(ntfVO,con);
//			}
//			con.commit();
//			con.setAutoCommit(true);
//			System.out.println("已成功分派救援給志工");
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			if (con != null) {
//				try {
//					// 3●設定於當有exception發生時之catch區塊內
//					System.err.print("Transaction is being ");
//					System.err.println("rolled back-由-dept");
//					con.rollback();
//				} catch (SQLException excep) {
//					throw new RuntimeException("rollback error occured. "
//							+ excep.getMessage());
//				}
//			}
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
		
		
	}

	public static void main(String[] args) {

		RescuingJDBCDAO dao = new RescuingJDBCDAO();

		// 新增
		RescuingVO rescuingVO1 = new RescuingVO();

		rescuingVO1.setRsc_id("R000000006");
		rescuingVO1.setRscing_ptcp("M000000003");
		rescuingVO1.setRscing_sta("救援中");
//		rescuingVO1.setRscing_lat(new Double(24.9460628));
//		rescuingVO1.setRscing_lon(new Double(121.1992745));
		rescuingVO1.setRscing_btime(new Timestamp(new Date().getTime()));
		dao.insert(rescuingVO1);

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
		
//		RescuingVO rescuingVO4 = dao.findself("R000000002","M000000005");
//		System.out.print(rescuingVO4.getRsc_id() + ",");
//		System.out.print(rescuingVO4.getRscing_ptcp() + ",");
//		System.out.print(rescuingVO4.getRscing_sta() + ",");
//		System.out.print(rescuingVO4.getRscing_lat() + ",");
//		System.out.println(rescuingVO4.getRscing_lon() + ",");
//		System.out.println("---------------------");
		
//		複合查詢
		
//		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("rsc_id", new String[] { "R000000001" });
//		map.put("action", new String[] { "getXXX" });
//		List<RescuingVO> list = dao.getAll(map);
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
