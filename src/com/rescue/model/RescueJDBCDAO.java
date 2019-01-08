package com.rescue.model;

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

import com.ntf.model.NtfJDBCDAO;
import com.ntf.model.NtfVO;
import com.rescueCoin.model.RescueCoinVO;
import com.rescuing.model.RescuingJDBCDAO;
import com.volunteer.model.VolunteerJDBCDAO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Rescue;
import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Volunteer;

 
public class RescueJDBCDAO implements RescueDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO RESCUE (rsc_id,rsc_name,rsc_add,rsc_des,rsc_img,rsc_sponsor,vlt_id,rsc_lat,rsc_lon,rsc_sta,rsc_stm_time,rsc_stm_url,rsc_stm_sta,rsc_btime,rsc_coin,rsc_etime,rsc_reg,rsc_rt_status,ntf_vlt_dt,ntf_vlt_link,ntf_vlt_sta,ntf_vlt_time) VALUES ('R'||LPAD(to_char(volunteer_seq.NEXTVAL), 9, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT rsc_id,rsc_name,rsc_add,rsc_des,rsc_img,rsc_sponsor,vlt_id,rsc_lat,rsc_lon,rsc_sta,to_char(rsc_stm_time,'yyyy-mm-dd hh24:mi:ss') rsc_stm_time,rsc_stm_url,rsc_stm_sta,to_char(rsc_btime,'yyyy-mm-dd hh24:mi:ss') rsc_btime,rsc_coin,to_char(rsc_etime,'yyyy-mm-dd hh24:mi:ss') rsc_etime,rsc_reg,rsc_rt_status,ntf_vlt_dt,ntf_vlt_link,ntf_vlt_sta,to_char(ntf_vlt_time,'yyyy-mm-dd hh24:mi:ss') ntf_vlt_time FROM Rescue order by rsc_id";
	private static final String GET_ALL_DELAY_STMT = 
			"SELECT * FROM RESCUE where sysdate-2/24 >= rsc_btime order by rsc_id";
	private static final String GET_ONE_STMT = 
			"SELECT rsc_id,rsc_name,rsc_add,rsc_des,rsc_img,rsc_sponsor,vlt_id,rsc_lat,rsc_lon,rsc_sta,to_char(rsc_stm_time,'yyyy-mm-dd hh24:mi:ss') rsc_stm_time,rsc_stm_url,rsc_stm_sta,to_char(rsc_btime,'yyyy-mm-dd hh24:mi:ss') rsc_btime,rsc_coin,to_char(rsc_etime,'yyyy-mm-dd hh24:mi:ss') rsc_etime,rsc_reg,rsc_rt_status,ntf_vlt_dt,ntf_vlt_link,ntf_vlt_sta,to_char(ntf_vlt_time,'yyyy-mm-dd hh24:mi:ss') ntf_vlt_time FROM Rescue where rsc_id = ?";
	private static final String DELETE = 
			"DELETE FROM RESCUE where rsc_id = ?";
	private static final String UPDATE = 
			"UPDATE RESCUE set rsc_name=?,rsc_add=?,rsc_des=?,rsc_img=?,rsc_sponsor=?,vlt_id=?,rsc_lat=?,rsc_lon=?,rsc_sta=?,rsc_stm_time=?,rsc_stm_url=?,rsc_stm_sta=?,rsc_btime=?,rsc_coin=?,rsc_etime=?,rsc_reg=?,rsc_rt_status=?,ntf_vlt_dt=?,ntf_vlt_link=?,ntf_vlt_sta=?,ntf_vlt_time=? where rsc_id = ?";
	private static final String UPDATE_RSC_STA =
			"UPDATE RESCUE set rsc_sta=? where rsc_id = ?";
	private static final String UPDATE_BY_MANAGER =
			"UPDATE RESCUE set vlt_id=?,rsc_sta=?,ntf_vlt_dt=?,ntf_vlt_sta=?,ntf_vlt_time=? where rsc_id = ?";
	private static final String UPDATE_NTF_VLT_STA =
			"UPDATE RESCUE set ntf_vlt_sta=? where rsc_id = ?";
    private static final String UPDATE_BY_PASS = 
    		"UPDATE RESCUE set rsc_sta=?,rsc_etime= ? where rsc_id = ?";
	
	//安卓指令
	private static final String FIND_PHOTO_BY_RSCID = 
			"SELECT rsc_img FROM Rescue WHERE rsc_id = ?";
	private static final String UPDATE_RESCUE_CASE =
			"UPDATE Rescue SET rsc_name=?,rsc_add=?,rsc_des=?,rsc_img=?,rsc_sponsor=?,vlt_id=?,rsc_lat=?,rsc_lon=?,rsc_sta=?,rsc_stm_time=?,rsc_stm_url=?,rsc_stm_sta=?,rsc_btime=?,rsc_coin=?,rsc_etime=?,rsc_reg=?,rsc_rt_status=?,ntf_vlt_dt=?,ntf_vlt_link=?,ntf_vlt_sta=?,ntf_vlt_time=? WHERE rsc_id = ?";
	private static final String INSERT_RESCUE_CASE = 
			"INSERT INTO RESCUE (rsc_id,rsc_name,rsc_add,rsc_des,rsc_img,rsc_sponsor,vlt_id,rsc_lat,rsc_lon,rsc_sta,rsc_stm_time,rsc_stm_url,rsc_stm_sta,rsc_btime,rsc_coin,rsc_etime,rsc_reg,rsc_rt_status,ntf_vlt_dt,ntf_vlt_link,ntf_vlt_sta,ntf_vlt_time) VALUES ('R'||LPAD(to_char(volunteer_seq.NEXTVAL), 9, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_RESCUE = 
			"SELECT rsc_id,rsc_name,rsc_add,rsc_des,rsc_sponsor,vlt_id,rsc_lat,rsc_lon,rsc_sta,to_char(rsc_stm_time,'yyyy-mm-dd hh24:mi:ss') rsc_stm_time,rsc_stm_url,rsc_stm_sta,to_char(rsc_btime,'yyyy-mm-dd hh24:mi:ss') rsc_btime,rsc_coin,to_char(rsc_etime,'yyyy-mm-dd hh24:mi:ss') rsc_etime,rsc_reg,rsc_rt_status,ntf_vlt_dt,ntf_vlt_link,ntf_vlt_sta,to_char(ntf_vlt_time,'yyyy-mm-dd hh24:mi:ss') ntf_vlt_time FROM Rescue order by rsc_id";


	
	
	
	@Override
	public void insert(RescueVO rescueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
	
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rescueVO.getRsc_name());
			pstmt.setString(2, rescueVO.getRsc_add());
			pstmt.setString(3, rescueVO.getRsc_des());
			pstmt.setBytes(4, rescueVO.getRsc_img());
			pstmt.setString(5, rescueVO.getRsc_sponsor());
			pstmt.setString(6, rescueVO.getVlt_id());
			pstmt.setDouble(7, rescueVO.getRsc_lat());
			pstmt.setDouble(8, rescueVO.getRsc_lon());
			pstmt.setString(9, rescueVO.getRsc_sta());
			pstmt.setTimestamp(10, rescueVO.getRsc_stm_time());
			pstmt.setString(11, rescueVO.getRsc_stm_url());
			pstmt.setString(12, rescueVO.getRsc_stm_sta());
			pstmt.setTimestamp(13, rescueVO.getRsc_btime());
			pstmt.setInt(14, rescueVO.getRsc_coin());
			pstmt.setTimestamp(15, rescueVO.getRsc_etime());
			pstmt.setString(16, rescueVO.getRsc_reg());
			pstmt.setString(17, rescueVO.getRsc_rt_status());
			pstmt.setString(18, rescueVO.getNtf_vlt_dt());
			pstmt.setString(19, rescueVO.getNtf_vlt_link());
			pstmt.setString(20, rescueVO.getNtf_vlt_sta());
			pstmt.setTimestamp(21, rescueVO.getNtf_vlt_time());

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
	public void update(RescueVO rescueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, rescueVO.getRsc_name());
			pstmt.setString(2, rescueVO.getRsc_add());
			pstmt.setString(3, rescueVO.getRsc_des());
			pstmt.setBytes(4, rescueVO.getRsc_img());
			pstmt.setString(5, rescueVO.getRsc_sponsor());
			pstmt.setString(6, rescueVO.getVlt_id());
			pstmt.setDouble(7, rescueVO.getRsc_lat());
			pstmt.setDouble(8, rescueVO.getRsc_lon());
			pstmt.setString(9, rescueVO.getRsc_sta());
			pstmt.setTimestamp(10, rescueVO.getRsc_stm_time());
			pstmt.setString(11, rescueVO.getRsc_stm_url());
			pstmt.setString(12, rescueVO.getRsc_stm_sta());
			pstmt.setTimestamp(13, rescueVO.getRsc_btime());
			pstmt.setInt(14, rescueVO.getRsc_coin());
			pstmt.setTimestamp(15, rescueVO.getRsc_etime());
			pstmt.setString(16, rescueVO.getRsc_reg());
			pstmt.setString(17, rescueVO.getRsc_rt_status());
			pstmt.setString(18, rescueVO.getNtf_vlt_dt());
			pstmt.setString(19, rescueVO.getNtf_vlt_link());
			pstmt.setString(20, rescueVO.getNtf_vlt_sta());
			pstmt.setTimestamp(21, rescueVO.getNtf_vlt_time());
			pstmt.setString(22, rescueVO.getRsc_id());

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
	public void delete(String rsc_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,rsc_id);

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
	public RescueVO findByPrimaryKey(String rsc_id) {
		RescueVO rescueVO = null;
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
				// regionVo 也稱為 Domain objects
				rescueVO = new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_img(rs.getBytes("rsc_img"));
				rescueVO.setRsc_sponsor(rs.getString("rsc_sponsor"));
				rescueVO.setVlt_id(rs.getString("vlt_id"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_sta(rs.getString("rsc_sta"));
				rescueVO.setRsc_stm_time(rs.getTimestamp("rsc_stm_time"));
				rescueVO.setRsc_stm_url(rs.getString("rsc_stm_url"));
				rescueVO.setRsc_stm_sta(rs.getString("rsc_stm_sta"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
				rescueVO.setRsc_coin(rs.getInt("rsc_coin"));
				rescueVO.setRsc_etime(rs.getTimestamp("rsc_etime"));
				rescueVO.setRsc_reg(rs.getString("rsc_reg"));
				rescueVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				rescueVO.setNtf_vlt_dt(rs.getString("ntf_vlt_dt"));
				rescueVO.setNtf_vlt_link(rs.getString("ntf_vlt_link"));
				rescueVO.setNtf_vlt_sta(rs.getString("ntf_vlt_sta"));
				rescueVO.setNtf_vlt_time(rs.getTimestamp("ntf_vlt_time"));

				
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
		return rescueVO;
		
	}

	@Override
	public List<RescueVO> getAll() {
		List<RescueVO> list = new ArrayList<RescueVO>();
		RescueVO rescueVO = null;

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
				rescueVO = new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_img(rs.getBytes("rsc_img"));
				rescueVO.setRsc_sponsor(rs.getString("rsc_sponsor"));
				rescueVO.setVlt_id(rs.getString("vlt_id"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_sta(rs.getString("rsc_sta"));
				rescueVO.setRsc_stm_time(rs.getTimestamp("rsc_stm_time"));
				rescueVO.setRsc_stm_url(rs.getString("rsc_stm_url"));
				rescueVO.setRsc_stm_sta(rs.getString("rsc_stm_sta"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
				rescueVO.setRsc_coin(rs.getInt("rsc_coin"));
				rescueVO.setRsc_etime(rs.getTimestamp("rsc_etime"));
				rescueVO.setRsc_reg(rs.getString("rsc_reg"));
				rescueVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				rescueVO.setNtf_vlt_dt(rs.getString("ntf_vlt_dt"));
				rescueVO.setNtf_vlt_link(rs.getString("ntf_vlt_link"));
				rescueVO.setNtf_vlt_sta(rs.getString("ntf_vlt_sta"));
				rescueVO.setNtf_vlt_time(rs.getTimestamp("ntf_vlt_time"));
				list.add(rescueVO); // Store the row in the list
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
	public List<RescueVO> getAll(Map<String, String[]> map) {
		List<RescueVO> list = new ArrayList<RescueVO>();
		RescueVO rescueVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			String finalSQL = "select * from rescue "
			          + jdbcUtil_CompositeQuery_Rescue.get_WhereCondition(map)
			          + "order by rsc_id";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				rescueVO = new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_img(rs.getBytes("rsc_img"));
				rescueVO.setRsc_sponsor(rs.getString("rsc_sponsor"));
				rescueVO.setVlt_id(rs.getString("vlt_id"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_sta(rs.getString("rsc_sta"));
				rescueVO.setRsc_stm_time(rs.getTimestamp("rsc_stm_time"));
				rescueVO.setRsc_stm_url(rs.getString("rsc_stm_url"));
				rescueVO.setRsc_stm_sta(rs.getString("rsc_stm_sta"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
				rescueVO.setRsc_coin(rs.getInt("rsc_coin"));
				rescueVO.setRsc_etime(rs.getTimestamp("rsc_etime"));
				rescueVO.setRsc_reg(rs.getString("rsc_reg"));
				rescueVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				rescueVO.setNtf_vlt_dt(rs.getString("ntf_vlt_dt"));
				rescueVO.setNtf_vlt_link(rs.getString("ntf_vlt_link"));
				rescueVO.setNtf_vlt_sta(rs.getString("ntf_vlt_sta"));
				rescueVO.setNtf_vlt_time(rs.getTimestamp("ntf_vlt_time"));
				list.add(rescueVO); // Store the row in the List
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
	public void updateRscSta(String rsc_id,Connection con) {
		
		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement(UPDATE_RSC_STA);
			
			pstmt.setString(1,new String("救援中"));
			pstmt.setString(2,rsc_id);

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

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
	public void updateByManager(RescueVO rescueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
			//修改rescue
    		pstmt = con.prepareStatement(UPDATE_BY_MANAGER);

			
			pstmt.setString(1, rescueVO.getVlt_id());
		    pstmt.setString(2, rescueVO.getRsc_sta());
			pstmt.setString(3, rescueVO.getNtf_vlt_dt());
			pstmt.setString(4, rescueVO.getNtf_vlt_sta());
			pstmt.setTimestamp(5, rescueVO.getNtf_vlt_time());
			pstmt.setString(6, rescueVO.getRsc_id());

			pstmt.executeUpdate();
//			System.out.println("Changed " + rowsUpdated + "rows");
			//改變志工狀態
			VolunteerJDBCDAO dao1 = new VolunteerJDBCDAO();
		    dao1.updateStaByManager(rescueVO.getVlt_id(), con);
			//同時改變rescueing的人 得到參與的會員編號
			
			RescuingJDBCDAO dao2 = new RescuingJDBCDAO();
			List<String> list = dao2.updateByVolunteer(rescueVO.getRsc_id(), con);
			//新增通知
			NtfJDBCDAO dao3 = new NtfJDBCDAO();
			for (String i :list) {
				NtfVO ntfVO = new NtfVO();
				ntfVO.setMemb_id(i);
				ntfVO.setNtf_src_id(rescueVO.getRsc_id());
				ntfVO.setNtf_dt("救援編號:"+rescueVO.getRsc_id()+"，救援逾時，已派志工前往。");
				dao3.insert(ntfVO,con);
			}
			con.commit();
			con.setAutoCommit(true);
			System.out.println("已成功分派救援給志工");
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
	public void updateByPass(String rsc_id,Connection con) {
		
		PreparedStatement pstmt = null;

		try {

			//修改rescue
            pstmt = con.prepareStatement(UPDATE_BY_PASS);
			
			pstmt.setString(1,new String("完成救援"));
			pstmt.setTimestamp(2,new Timestamp(new Date().getTime()));
			pstmt.setString(3,rsc_id);
     		pstmt.executeUpdate();

			
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
	public void updateByNoPass(String rsc_id,Connection con) {
	
		PreparedStatement pstmt = null;

		try {

			
			//修改rescue
            pstmt = con.prepareStatement(UPDATE_RSC_STA);
			
			pstmt.setString(1,new String("救援中"));
			pstmt.setString(2,rsc_id);
			pstmt.executeUpdate();
			
			
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
	public List<RescueVO> getAllDelay() {
		List<RescueVO> list = new ArrayList<RescueVO>();
		RescueVO rescueVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_DELAY_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				rescueVO = new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_img(rs.getBytes("rsc_img"));
				rescueVO.setRsc_sponsor(rs.getString("rsc_sponsor"));
				rescueVO.setVlt_id(rs.getString("vlt_id"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_sta(rs.getString("rsc_sta"));
				rescueVO.setRsc_stm_time(rs.getTimestamp("rsc_stm_time"));
				rescueVO.setRsc_stm_url(rs.getString("rsc_stm_url"));
				rescueVO.setRsc_stm_sta(rs.getString("rsc_stm_sta"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
				rescueVO.setRsc_coin(rs.getInt("rsc_coin"));
				rescueVO.setRsc_etime(rs.getTimestamp("rsc_etime"));
				rescueVO.setRsc_reg(rs.getString("rsc_reg"));
				rescueVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				rescueVO.setNtf_vlt_dt(rs.getString("ntf_vlt_dt"));
				rescueVO.setNtf_vlt_link(rs.getString("ntf_vlt_link"));
				rescueVO.setNtf_vlt_sta(rs.getString("ntf_vlt_sta"));
				rescueVO.setNtf_vlt_time(rs.getTimestamp("ntf_vlt_time"));
				list.add(rescueVO); // Store the row in the list
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

		RescueJDBCDAO dao = new RescueJDBCDAO();

		// 新增
		RescueVO rescueVO1 = new RescueVO();
//
//		rescueVO1.setRsc_name("有貓卡樹上");
//		rescueVO1.setRsc_add("326桃園市楊梅區中山北路一段390巷41號");
//		rescueVO1.setRsc_sponsor("M000000003");
//		rescueVO1.setRsc_lat(new Double(24.9460628));
//		rescueVO1.setRsc_lon(new Double(121.1992745));
//		rescueVO1.setRsc_btime(new Timestamp(new Date().getTime()));
//		rescueVO1.setRsc_coin(new Integer(500));
//		rescueVO1.setRsc_reg("REG0000004");
//		dao.insert(rescueVO1);

//		// 修改
//		RescueVO rescueVO2 = new RescueVO();
//		rescueVO2.setRsc_id("R000000007");
//		rescueVO2.setRsc_name("有貓卡樹上");
//		rescueVO2.setRsc_add("326桃園市楊梅區中山北路一段390巷41號");
//		rescueVO2.setRsc_sponsor("M000000003");
//		rescueVO2.setRsc_lat(new Double(24.9460628));
//		rescueVO2.setRsc_lon(new Double(121.1992745));
//		rescueVO2.setRsc_coin(new Integer(1000));
//		rescueVO2.setRsc_reg("REG0000004");
//		dao.update(rescueVO2);

		// 刪除
//		dao.delete("R000000007");

		// 查詢
//		RescueVO rescueVO3 = dao.findByPrimaryKey("R000000001");
//		System.out.print(rescueVO3.getRsc_id() + ",");
//		System.out.print(rescueVO3.getRsc_name() + ",");
//		System.out.print(rescueVO3.getRsc_add() + ",");
//		System.out.print(rescueVO3.getRsc_sponsor() + ",");
//		System.out.print(rescueVO3.getRsc_lat() + ",");
//		System.out.print(rescueVO3.getRsc_lon() + ",");
//		System.out.print(rescueVO3.getRsc_coin()+ ",");
//		System.out.println(rescueVO3.getRsc_reg());
//		System.out.println("---------------------");
//
		// 查詢
//		List<RescueVO> list = dao.getAll();
//		for (RescueVO aRsc : list) {
//			System.out.print(aRsc.getVlt_id() + ",");
//			System.out.print(aRsc.getRsc_name() + ",");
//			System.out.print(aRsc.getRsc_add() + ",");
//			System.out.print(aRsc.getRsc_sponsor() + ",");
//			System.out.print(aRsc.getRsc_lat() + ",");
//			System.out.print(aRsc.getRsc_lon() + ",");
//			System.out.print(aRsc.getRsc_coin()+ ",");
//			System.out.print(aRsc.getRsc_reg());
//			System.out.println();
//		}
		List<RescueVO> list = dao.getAllDelay();
		for (RescueVO aRsc : list) {
			System.out.print(aRsc.getRsc_id() + ",");
			System.out.print(aRsc.getRsc_name() + ",");
			System.out.print(aRsc.getRsc_add() + ",");
			System.out.print(aRsc.getRsc_sponsor() + ",");
			System.out.print(aRsc.getRsc_lat() + ",");
			System.out.print(aRsc.getRsc_lon() + ",");
			System.out.print(aRsc.getRsc_coin()+ ",");
			System.out.print(aRsc.getRsc_reg());
			System.out.println();
		}
		
		
//		複合查詢
		
//		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("rsc_id", new String[] { "R000000001" });
//		map.put("action", new String[] { "getXXX" });
//		List<RescueVO> list = dao.getAll(map);
//		for (RescueVO aRsc : list) {
//			System.out.print(aRsc.getVlt_id() + ",");
//			System.out.print(aRsc.getRsc_name() + ",");
//			System.out.print(aRsc.getRsc_add() + ",");
//			System.out.print(aRsc.getRsc_sponsor() + ",");
//			System.out.print(aRsc.getRsc_lat() + ",");
//			System.out.print(aRsc.getRsc_lon() + ",");
//			System.out.print(aRsc.getRsc_coin()+ ",");
//			System.out.print(aRsc.getRsc_reg());
//			System.out.println();
//		}
	}

	//安卓
	@Override
	public byte[] getImage(String rsc_id) {
		byte[] picture = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_PHOTO_BY_RSCID);
			
			pstmt.setString(1,rsc_id);
			rs = pstmt.executeQuery();
			
		if (rs.next()) {
			picture = rs.getBytes(1); 
		}
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
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
		} return picture;
	}

	@Override
	public boolean updateCase(RescueVO rescueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isRescueCase = false;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_RESCUE_CASE);

			pstmt.setString(1, rescueVO.getRsc_name());
			pstmt.setString(2, rescueVO.getRsc_add());
			pstmt.setString(3, rescueVO.getRsc_des());
			pstmt.setBytes(4, rescueVO.getRsc_img());
			pstmt.setString(5, rescueVO.getRsc_sponsor());
			pstmt.setString(6, rescueVO.getVlt_id());
			pstmt.setDouble(7, rescueVO.getRsc_lat());
			pstmt.setDouble(8, rescueVO.getRsc_lon());
			pstmt.setString(9, rescueVO.getRsc_sta());
			pstmt.setTimestamp(10, rescueVO.getRsc_stm_time());
			pstmt.setString(11, rescueVO.getRsc_stm_url());
			pstmt.setString(12, rescueVO.getRsc_stm_sta());
			pstmt.setTimestamp(13, rescueVO.getRsc_btime());
			pstmt.setInt(14, rescueVO.getRsc_coin());
			pstmt.setTimestamp(15, rescueVO.getRsc_etime());
			pstmt.setString(16, rescueVO.getRsc_reg());
			pstmt.setString(17, rescueVO.getRsc_rt_status());
			pstmt.setString(18, rescueVO.getNtf_vlt_dt());
			pstmt.setString(19, rescueVO.getNtf_vlt_link());
			pstmt.setString(20, rescueVO.getNtf_vlt_sta());
			pstmt.setTimestamp(21, rescueVO.getNtf_vlt_time());
			pstmt.setString(22, rescueVO.getRsc_id());

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
		return isRescueCase;

	}

	@Override
	public boolean addCase(RescueVO rescueVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isAddRescueCase = false;
		
		try {

			Class.forName(driver);
	 
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_RESCUE_CASE);

			pstmt.setString(1, rescueVO.getRsc_name());
			pstmt.setString(2, rescueVO.getRsc_add());
			pstmt.setString(3, rescueVO.getRsc_des());
			pstmt.setBytes(4, rescueVO.getRsc_img());
			pstmt.setString(5, rescueVO.getRsc_sponsor());
			pstmt.setString(6, rescueVO.getVlt_id());
			pstmt.setDouble(7, rescueVO.getRsc_lat());
			pstmt.setDouble(8, rescueVO.getRsc_lon());
			pstmt.setString(9, rescueVO.getRsc_sta());
			pstmt.setTimestamp(10, rescueVO.getRsc_stm_time());
			pstmt.setString(11, rescueVO.getRsc_stm_url());
			pstmt.setString(12, rescueVO.getRsc_stm_sta());
			pstmt.setTimestamp(13, rescueVO.getRsc_btime());
			pstmt.setInt(14, rescueVO.getRsc_coin());
			pstmt.setTimestamp(15, rescueVO.getRsc_etime());
			pstmt.setString(16, rescueVO.getRsc_reg());
			pstmt.setString(17, rescueVO.getRsc_rt_status());
			pstmt.setString(18, rescueVO.getNtf_vlt_dt());
			pstmt.setString(19, rescueVO.getNtf_vlt_link());
			pstmt.setString(20, rescueVO.getNtf_vlt_sta());
			pstmt.setTimestamp(21, rescueVO.getNtf_vlt_time());

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
		return isAddRescueCase;
	}

	@Override
	public List<RescueVO> getAllRescue() {
		List<RescueVO> list = new ArrayList<>();
		RescueVO rescueVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_RESCUE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rescueVO = new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_sponsor(rs.getString("rsc_sponsor"));
				rescueVO.setVlt_id(rs.getString("vlt_id"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_sta(rs.getString("rsc_sta"));
				rescueVO.setRsc_stm_time(rs.getTimestamp("rsc_stm_time"));
				rescueVO.setRsc_stm_sta(rs.getString("rsc_stm_sta"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
				rescueVO.setRsc_coin(rs.getInt("rsc_coin"));
				rescueVO.setRsc_etime(rs.getTimestamp("rsc_etime"));
				rescueVO.setRsc_reg(rs.getString("rsc_reg"));
				rescueVO.setNtf_vlt_dt(rs.getString("ntf_vlt_dt"));
				list.add(rescueVO); 
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



}



