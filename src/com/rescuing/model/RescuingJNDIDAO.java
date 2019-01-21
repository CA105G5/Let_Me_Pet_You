package com.rescuing.model;

import java.security.spec.DSAGenParameterSpec;
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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.CurrencyDetail.model.CurDtJDBCDAO;
import com.mem.model.MemJDBCDAO;
import com.ntf.model.NtfJDBCDAO;
import com.ntf.model.NtfVO;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;
import com.volunteer.model.VolunteerJDBCDAO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Rescuing;
import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Volunteer;
import sun.nio.cs.ext.ISCII91;

 



public class RescuingJNDIDAO implements RescuingDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String userid = "CA105G5";
//	String passwd = "123456";
//	

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
	private static final String UPDATE_NO_PASS_MEM = 
			"UPDATE RESCUING set rscing_sta = ? where rsc_id = ? AND rscing_ptcp = ?";
	private static final String UPDATE_DONE_REPORT = 
			"UPDATE RESCUING set rscing_sta = ?,rscing_ctime = ?,rscing_cdes = ? where rsc_id = ? AND rscing_ptcp = ?";
			
	
	
	
	
	@Override
	public void insert(RescuingVO rescuingVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			
	
			con = ds.getConnection();
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

			
			con = ds.getConnection();
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
		}catch (SQLException se) {
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

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,rsc_id);
			pstmt.setString(2,rscing_ptcp);

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
			// Handle any driver errors
		}catch (SQLException se) {
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

			
			con = ds.getConnection();
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
		}catch (SQLException se) {
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

			
			con = ds.getConnection();
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
		}catch (SQLException se) {
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
			
			
			
			con = ds.getConnection();

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
		}catch (SQLException se) {
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

			
			con = ds.getConnection();
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
		}catch (SQLException se) {
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
	public void updateNoPassMem(String rsc_id, String rsc_ptcp, Connection con) {
		PreparedStatement pstmt = null;
		
		try {

			pstmt = con.prepareStatement(UPDATE_NO_PASS_MEM);
			//改成不通過
			pstmt.setString(1,new String("不通過"));
			pstmt.setString(2,rsc_id);
			pstmt.setString(3,rsc_ptcp);

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
	public void updateNoPass(String rsc_id, String rsc_ptcp, Connection con) {
		PreparedStatement pstmt = null;
		
		try {

			pstmt = con.prepareStatement(UPDATE_NO_PASS_MEM);
			//改成不通過
			pstmt.setString(1,new String("救援中"));
			pstmt.setString(2,rsc_id);
			pstmt.setString(3,rsc_ptcp);

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
		
		ResultSet rs = null;
		List<String> passmem = new ArrayList<String>();
		List<String> nopassmem = new ArrayList<String>();
		
		try {

			
			con = ds.getConnection();
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
		    rs.close();
		    //完成的會員狀態改變、會員愛心幣、通知
		    MemJDBCDAO dao2 = new MemJDBCDAO();
		    CurDtJDBCDAO dao3 = new CurDtJDBCDAO();
		    NtfJDBCDAO dao4 = new NtfJDBCDAO();
		    for(String i:passmem) {
		    	updatePassMem(rescueVO.getRsc_id(),i,con);
		    	dao2.updateBalance(i,rescueVO.getRsc_coin(), con);
		    	dao3.insert(i,rescueVO,con);
		    	NtfVO ntfVO = new NtfVO();
				ntfVO.setMemb_id(i);
				ntfVO.setNtf_src_id(rescueVO.getRsc_id());
				ntfVO.setNtf_dt("救援編號:"+rescueVO.getRsc_id()+"，通過審核，已發送愛心幣!");
				dao4.insert(ntfVO,con);
		    }
		   //未完成的會員狀態改變、通知
		    for(String j:nopassmem) {
		    	updateNoPassMem(rescueVO.getRsc_id(),j,con);
		    	NtfVO ntfVO2 = new NtfVO();
		    	ntfVO2.setMemb_id(j);
		    	ntfVO2.setNtf_src_id(rescueVO.getRsc_id());
		    	ntfVO2.setNtf_dt("救援編號:"+rescueVO.getRsc_id()+"未通過!，已有會員通過審核!");
		    	dao4.insert(ntfVO2, con);
		    }

			con.commit();
			con.setAutoCommit(true);
			System.out.println("已成功發送愛心幣");
//			// Handle any driver errors
		}catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-rscuing");
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
	public void updateByManagerNoPass(String rsc_id,String rscing_rv_des) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> nopassmem = new ArrayList<String>();
		try {

			
			con = ds.getConnection();
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
    		//救援改狀態
    		RescueJDBCDAO dao = new RescueJDBCDAO();
    		dao.updateByNoPass(rsc_id, con);
    		//查所有完成救援送審的人
    		pstmt = con.prepareStatement(GET_PASS_MEM);
 			pstmt.setString(1,rsc_id);
 		    pstmt.setString(2,"完成救援送審中");
 		    rs = pstmt.executeQuery();
 		    while(rs.next()) {
 		    	nopassmem.add(rs.getString(1));
 		    }
 		    //改變狀態救援中
 		   NtfJDBCDAO dao2 = new NtfJDBCDAO();
 		   for(String j:nopassmem) {
		    	updateNoPass(rsc_id,j,con);
		    	NtfVO ntfVO2 = new NtfVO();
		    	ntfVO2.setMemb_id(j);
		    	ntfVO2.setNtf_src_id(rsc_id);
		    	ntfVO2.setNtf_dt("救援編號:"+rsc_id+"未通過!"+rscing_rv_des);
		    	dao2.insert(ntfVO2, con);
		    }
 		    
			con.commit();
			con.setAutoCommit(true);
			System.out.println("已成功發通知給會員");
			// Handle any driver errors
		}catch (SQLException se) {
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
	
	public void updateByJoinRsc(String rsc_id, String rsc_ptcp, Connection con) {
		PreparedStatement pstmt = null;
		
		try {

			pstmt = con.prepareStatement(UPDATE_NO_PASS_MEM);
			//改成不通過
			pstmt.setString(1,new String("完成救援送審中"));
			pstmt.setString(2,rsc_id);
			pstmt.setString(3,rsc_ptcp);

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
	public void updateDoneReport(RescuingVO rescuingVO, List<String> doneRescueMemslist) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		PreparedStatement pstmt2 = null;
		
		try {

			
			con = ds.getConnection();
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
    		//救援改狀態
    		RescueJDBCDAO dao = new RescueJDBCDAO();
    		dao.updateByDoneReport(rescuingVO.getRsc_id(), con);
    		//報告者的資料改變
    		pstmt = con.prepareStatement(UPDATE_DONE_REPORT);
			pstmt.setString(1,new String("完成救援送審中"));
			pstmt.setTimestamp(2,rescuingVO.getRscing_ctime());
		    pstmt.setString(3, rescuingVO.getRscing_cdes());
			pstmt.setString(4,rescuingVO.getRsc_id());
			pstmt.setString(5,rescuingVO.getRscing_ptcp());

			pstmt.executeUpdate();
	       //參與者改變狀態
 		   for(String i:doneRescueMemslist) {
 			  updateByJoinRsc(rescuingVO.getRsc_id(),i,con);
		    }
 		    
			con.commit();
			con.setAutoCommit(true);
			System.out.println("已送審中");
			// Handle any driver errors
		}catch (SQLException se) {
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}
	
	//安卓查餐與救援會員之方法
	public List<String> getRescuingMember(String rsc_id) {
		List<String> memblist = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MEM);
			
			pstmt.setString(1, rsc_id);
			
			rs = pstmt.executeQuery();
			
			System.out.println("===========DAO==============");
			
			while(rs.next()) {
				String mem = rs.getString("rscing_ptcp");
				memblist.add(mem);
			}
			 
			System.out.println("size = " + memblist.size());
			
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return memblist;
		
	}
	
	
	
	@Override
	public boolean updateDoneReport(String rsc_id, String rscing_ptcp, String rscing_cdes, List<String> doneRescueMemslist) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		boolean isupdateDoneReport = false;
		
		try {

			
			con = ds.getConnection();
			// 1●設定於 pstm.executeUpdate()之前 
    		con.setAutoCommit(false);
    		//救援改狀態
    		RescueJDBCDAO dao = new RescueJDBCDAO();
    		dao.updateByDoneReport(rsc_id, con);
    		//報告者的資料改變
    		pstmt = con.prepareStatement(UPDATE_DONE_REPORT);
			pstmt.setString(1,new String("完成救援送審中"));
			pstmt.setTimestamp(2,new Timestamp(new Date().getTime()));
		    pstmt.setString(3, rscing_cdes);
			pstmt.setString(4, rsc_id);
			pstmt.setString(5, rscing_ptcp);

			
			if(pstmt.executeUpdate()>0) {
				isupdateDoneReport = true;				
			}
	       //參與者改變狀態
 		   for(String i:doneRescueMemslist) {
 			  updateByJoinRsc(rsc_id,i,con);
		    }
 		    
			con.commit();
			con.setAutoCommit(true);
			System.out.println("已送審中");
			// Handle any driver errors
		}catch (SQLException se) {
			try {
				con.rollback();
				
			}catch (Exception ex) {
				ex.printStackTrace();
			}
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return isupdateDoneReport;
	}

	
	@Override
	public boolean joinRescuing(String rsc_id, String rscing_ptcp, Connection con) {
		PreparedStatement pstmt = null;
		boolean isjoinRescuing = false;
		try {

			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rsc_id);
			pstmt.setString(2, rscing_ptcp);
			pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
			pstmt.setString(4, "救援中");
			
			int rowsUpdated =pstmt.executeUpdate();
//			System.out.println("Changed " + rowsUpdated + "rows");
			
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-rescing");
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
		return isjoinRescuing;
		
	}

	@Override
	public boolean joinRescuing(String rsc_id, String rscing_ptcp) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isjoinRescuing = false;
		try { 
			
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rsc_id);
			pstmt.setString(2, rscing_ptcp);
			pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
			pstmt.setString(4, "救援中");
			
			int rowsUpdated =pstmt.executeUpdate();
			if(rowsUpdated>0) {
				isjoinRescuing = true;
				RescueJDBCDAO rescueJDBCDAO = new RescueJDBCDAO();
				rescueJDBCDAO.updateCase(rsc_id, rscing_ptcp, con);
			}
			con.commit();
			System.out.println("Changed " + rowsUpdated + "rows");
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
		}finally {
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
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} 

		}
		return isjoinRescuing;
		
	}




	

	
	



}
