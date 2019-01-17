package com.volunteer.model;

import java.util.*;

import com.mem.model.MemVO;
import com.ntf.model.NtfJDBCDAO;
import com.ntf.model.NtfVO;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingJDBCDAO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Volunteer;

import java.sql.*;


public class VolunteerJDBCDAO implements VolunteerDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO VOLUNTEER (vlt_id,vlt_name,vlt_mail,vlt_pw,vlt_gender,vlt_tel,vlt_img,vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg) VALUES ('V'||LPAD(to_char(volunteer_seq.NEXTVAL), 9, '0'),?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT vlt_id,vlt_name,vlt_mail,vlt_pw,vlt_gender,vlt_tel,vlt_img,to_char(vlt_registerdate,'yyyy-mm-dd') vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg FROM VOLUNTEER order by vlt_id";
	private static final String GET_ONE_STMT = 
			"SELECT vlt_id,vlt_name,vlt_mail,vlt_pw,vlt_gender,vlt_tel,vlt_img,to_char(vlt_registerdate,'yyyy-mm-dd') vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg FROM VOLUNTEER where vlt_id = ?";
	private static final String DELETE = 
			"DELETE FROM VOLUNTEER where vlt_id = ?";
	private static final String MANAGER_UPDATE_STMT = 
			"UPDATE VOLUNTEER set vlt_name =?,vlt_mail =?,vlt_gender =?,vlt_tel =?,vlt_duty_day =?,vlt_sta =?,vlt_reg =? where vlt_id = ?";
	private static final String VOLUNTEER_UPDATE_STMT = 
			"UPDATE VOLUNTEER set vlt_pw =?,vlt_tel =?,vlt_img =?,vlt_duty_day =? where vlt_id = ?";
	private static final String VOLUNTEER_SEARCH_STMT="SELECT * FROM VOLUNTEER where vlt_mail=?";
	private static final String VOLUNTEER_CHECK_OUT="SELECT * FROM RESCUE where vlt_id = ? AND rsc_sta = '分派給志工'";
	private static final String UPDATE_STA_BY_MANGER = "UPDATE VOLUNTEER set vlt_sta = ? WHERE vlt_id = ?";
	//安卓指令
	private static final String FIND_BY_EMAIL_PASWD = "SELECT * FROM VOLUNTEER WHERE vlt_mail = ? AND vlt_pw = ?";
	private static final String CHECK_EMAIL_EXIST = "SELECT vlt_mail FROM VOLUNTEER WHERE vlt_mail = ?";
	
	

	@Override
	public void insert(VolunteerVO volunteerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, volunteerVO.getVlt_name());
			pstmt.setString(2, volunteerVO.getVlt_mail());
			pstmt.setString(3, volunteerVO.getVlt_pw());
			pstmt.setString(4, volunteerVO.getVlt_gender());
			pstmt.setString(5, volunteerVO.getVlt_tel());
			pstmt.setBytes(6, volunteerVO.getVlt_img());
			pstmt.setDate(7, volunteerVO.getVlt_registerdate());
			pstmt.setString(8, volunteerVO.getVlt_duty_day());
			pstmt.setString(9, volunteerVO.getVlt_sta());
			pstmt.setString(10, volunteerVO.getVlt_reg());
			

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
	public void updateForManager(VolunteerVO volunteerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(MANAGER_UPDATE_STMT);

			pstmt.setString(1, volunteerVO.getVlt_name());
			pstmt.setString(2, volunteerVO.getVlt_mail());
			pstmt.setString(3, volunteerVO.getVlt_gender());
			pstmt.setString(4, volunteerVO.getVlt_tel());
			pstmt.setString(5, volunteerVO.getVlt_duty_day());
			pstmt.setString(6, volunteerVO.getVlt_sta());
			pstmt.setString(7, volunteerVO.getVlt_reg());
			pstmt.setString(8, volunteerVO.getVlt_id());

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
	public void updateForVolunteer(VolunteerVO volunteerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(VOLUNTEER_UPDATE_STMT);

			pstmt.setString(1, volunteerVO.getVlt_pw());
			pstmt.setString(2, volunteerVO.getVlt_tel());
			pstmt.setBytes(3, volunteerVO.getVlt_img());
			pstmt.setString(4, volunteerVO.getVlt_duty_day());
			pstmt.setString(5, volunteerVO.getVlt_id());

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
	public void delete(String vlt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,vlt_id);

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
	public VolunteerVO findByPrimaryKey(String vlt_id) {
		VolunteerVO volunteerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, vlt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// regionVo 嘿 Domain objects
				volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(rs.getString("vlt_id"));
				volunteerVO.setVlt_name(rs.getString("vlt_name"));
				volunteerVO.setVlt_mail(rs.getString("vlt_mail"));
				volunteerVO.setVlt_pw(rs.getString("vlt_pw"));
				volunteerVO.setVlt_gender(rs.getString("vlt_gender"));
				volunteerVO.setVlt_tel(rs.getString("vlt_tel"));
				volunteerVO.setVlt_img(rs.getBytes("vlt_img"));
				volunteerVO.setVlt_registerdate(rs.getDate("vlt_registerdate"));
				volunteerVO.setVlt_duty_day(rs.getString("vlt_duty_day"));
				volunteerVO.setVlt_sta(rs.getString("vlt_sta"));
				volunteerVO.setVlt_reg(rs.getString("vlt_reg"));
				
				
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
		return volunteerVO;
	}

	@Override
	public List<VolunteerVO> getAll() {
		List<VolunteerVO> list = new ArrayList<VolunteerVO>();
		VolunteerVO volunteerVO = null;

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
				volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(rs.getString("vlt_id"));
				volunteerVO.setVlt_name(rs.getString("vlt_name"));
				volunteerVO.setVlt_mail(rs.getString("vlt_mail"));
				volunteerVO.setVlt_pw(rs.getString("vlt_pw"));
				volunteerVO.setVlt_gender(rs.getString("vlt_gender"));
				volunteerVO.setVlt_tel(rs.getString("vlt_tel"));
				volunteerVO.setVlt_img(rs.getBytes("vlt_img"));
				volunteerVO.setVlt_registerdate(rs.getDate("vlt_registerdate"));
				volunteerVO.setVlt_duty_day(rs.getString("vlt_duty_day"));
				volunteerVO.setVlt_sta(rs.getString("vlt_sta"));
				volunteerVO.setVlt_reg(rs.getString("vlt_reg"));
				list.add(volunteerVO); // Store the row in the list
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
	public List<VolunteerVO> getAll(Map<String, String[]> map) {
		List<VolunteerVO> list = new ArrayList<VolunteerVO>();
		VolunteerVO volunteerVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			String finalSQL = "select * from volunteer "
			          + jdbcUtil_CompositeQuery_Volunteer.get_WhereCondition(map)
			          + "order by vlt_id";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(rs.getString("vlt_id"));
				volunteerVO.setVlt_name(rs.getString("vlt_name"));
				volunteerVO.setVlt_mail(rs.getString("vlt_mail"));
				volunteerVO.setVlt_pw(rs.getString("vlt_pw"));
				volunteerVO.setVlt_gender(rs.getString("vlt_gender"));
				volunteerVO.setVlt_tel(rs.getString("vlt_tel"));
				volunteerVO.setVlt_img(rs.getBytes("vlt_img"));
				volunteerVO.setVlt_registerdate(rs.getDate("vlt_registerdate"));
				volunteerVO.setVlt_duty_day(rs.getString("vlt_duty_day"));
				volunteerVO.setVlt_sta(rs.getString("vlt_sta"));
				volunteerVO.setVlt_reg(rs.getString("vlt_reg"));
				list.add(volunteerVO); // Store the row in the List
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
	public VolunteerVO findByAccount(String vlt_mail) {
		
		VolunteerVO volunteerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(VOLUNTEER_SEARCH_STMT);
			
			pstmt.setString(1,vlt_mail);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(rs.getString("vlt_id"));
				volunteerVO.setVlt_name(rs.getString("vlt_name"));
				volunteerVO.setVlt_mail(rs.getString("vlt_mail"));
				volunteerVO.setVlt_pw(rs.getString("vlt_pw"));
				volunteerVO.setVlt_gender(rs.getString("vlt_gender"));
				volunteerVO.setVlt_tel(rs.getString("vlt_tel"));
				volunteerVO.setVlt_img(rs.getBytes("vlt_img"));
				volunteerVO.setVlt_registerdate(rs.getDate("vlt_registerdate"));
				volunteerVO.setVlt_duty_day(rs.getString("vlt_duty_day"));
				volunteerVO.setVlt_sta(rs.getString("vlt_sta"));
				volunteerVO.setVlt_reg(rs.getString("vlt_reg"));
			}
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
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
		return volunteerVO;
		
	}
	@Override
	public RescueVO volunteerCheckOut(String vlt_id) {
		RescueVO rescueVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(VOLUNTEER_CHECK_OUT);
			
			pstmt.setString(1,vlt_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rescueVO = new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_img(rs.getBytes("rsc_img"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
			}
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
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
		return rescueVO;
	}
	@Override
	public void updateStaByManager(String vlt_id,Connection con) {
		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement(UPDATE_STA_BY_MANGER);
			
			pstmt.setString(1,new String("救援中"));
			pstmt.setString(2,vlt_id);

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
	public void rescue_done_by_volunteer(String rsc_id, String vlt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
			//改變志工狀態
    		pstmt = con.prepareStatement(UPDATE_STA_BY_MANGER);
			
			pstmt.setString(1, "在職志工");
			pstmt.setString(2, vlt_id);
			
			pstmt.executeUpdate();

			//改變救援
			RescueService dao1 = new RescueService();
		    dao1.updateByDoneVolunteer(rsc_id, con);
			
			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("志工已成功救援");
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
		
		//安卓
		@Override
		public boolean rescueByVlt(String rsc_id, String vlt_id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			boolean isRescueByVlt = false;
			
			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				// 1●設定於 pstm.executeUpdate()之前
	    		con.setAutoCommit(false);
				//改變志工狀態
	    		pstmt = con.prepareStatement(UPDATE_STA_BY_MANGER);
				
				pstmt.setString(1, "在職志工");
				pstmt.setString(2, vlt_id);
				
				int rowsUpdated = pstmt.executeUpdate();
				if(rowsUpdated>0) {
					isRescueByVlt = true;
//					RescuingJDBCDAO rescuingJDBCDAO = new RescuingJDBCDAO();
//					rescuingJDBCDAO.joinRescuing(rsc_id, rscing_ptcp, con);
				}

				//改變救援
				RescueService dao1 = new RescueService();
			    dao1.updateByDoneVolunteer(rsc_id, con);
				
				
				con.commit();
				con.setAutoCommit(true);
				System.out.println("志工已成功救援");
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
		return isRescueByVlt;
	}
		
		
	public static void main(String[] args) {

		VolunteerJDBCDAO dao = new VolunteerJDBCDAO();

		//安卓Test
//		System.out.println(dao.isVltExist("s8780015@gmail.com"));
//		System.out.println(dao.isVltMail("s8780015@gmail.com", "123"));
		
		
		// 
		VolunteerVO volunteerVO1 = new VolunteerVO();

		
//		volunteerVO1.setVlt_name("豪豪");
//		volunteerVO1.setVlt_mail("w121212w00@gmail.com");
//		volunteerVO1.setVlt_pw("123");
//		volunteerVO1.setVlt_gender("M");
//		volunteerVO1.setVlt_tel("0958-514661");
//		volunteerVO1.setVlt_registerdate(new java.sql.Date(new Date().getTime()));
//		volunteerVO1.setVlt_duty_day("每日");
//		volunteerVO1.setVlt_sta("在職志工");
//		volunteerVO1.setVlt_reg("REG0000004");
//		dao.insert(volunteerVO1);
//
//		// 
//		VolunteerVO volunteerVO2 = new VolunteerVO();
//		volunteerVO2.setVlt_id("V000000006");
//		volunteerVO2.setVlt_name("豪豪");
//		volunteerVO2.setVlt_mail("w121212w00@gmail.com");
//		
//		volunteerVO1.setVlt_gender("M");
//		volunteerVO2.setVlt_tel("0958-514661");
//		volunteerVO2.setVlt_duty_day("每日");
//		volunteerVO2.setVlt_sta("在職志工");
//		volunteerVO2.setVlt_reg("REG0000003");
//		dao.updateForManager(volunteerVO2);

		//
//		VolunteerVO volunteerVO3 = new VolunteerVO();
//		volunteerVO3.setVlt_id("V000000001");
//		volunteerVO3.setVlt_pw("123456");
//		volunteerVO3.setVlt_tel("0958-514661");
//		volunteerVO3.setVlt_duty_day("每日");
//		dao.updateForVolunteer(volunteerVO3);

//		// 
//		dao.delete("V000000006");
//
//		// 
//		VolunteerVO volunteerVO3 = dao.findByPrimaryKey("V000000001");
//		System.out.print(volunteerVO3.getVlt_id() + ",");
//		System.out.print(volunteerVO3.getVlt_name() + ",");
//		System.out.print(volunteerVO3.getVlt_mail() + ",");
//		System.out.print(volunteerVO3.getVlt_pw() + ",");
//		System.out.print(volunteerVO3.getVlt_tel() + ",");
//		System.out.print(volunteerVO3.getVlt_duty_day() + ",");
//		System.out.print(volunteerVO3.getVlt_sta()+ ",");
//		System.out.println(volunteerVO3.getVlt_reg());
//		System.out.println("---------------------");
//
//		// 
//		List<VolunteerVO> list = dao.getAll();
//		for (VolunteerVO aVol : list) {
//			System.out.print(aVol.getVlt_id() + ",");
//			System.out.print(aVol.getVlt_name() + ",");
//			System.out.print(aVol.getVlt_mail() + ",");
//			System.out.print(aVol.getVlt_gender() + ",");
//			System.out.print(aVol.getVlt_pw() + ",");
//			System.out.print(aVol.getVlt_tel() + ",");
//			System.out.print(aVol.getVlt_img() + ",");			
//			System.out.print(aVol.getVlt_registerdate() + ",");			
//			System.out.print(aVol.getVlt_duty_day() + ",");
//			System.out.print(aVol.getVlt_sta()+ ",");
//			System.out.print(aVol.getVlt_reg());
//			System.out.println();
//		}
		
//		複合查詢
//		Map<String, String[]> map = new TreeMap<String, String[]>();
//		map.put("vlt_id", new String[] { "V000000001" });
//		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key
//		List<VolunteerVO> list = dao.getAll(map);
//		for (VolunteerVO aVol : list) {
//			System.out.print(aVol.getVlt_id() + ",");
//			System.out.print(aVol.getVlt_name() + ",");
//			System.out.print(aVol.getVlt_mail() + ",");
//			System.out.print(aVol.getVlt_gender() + ",");
//			System.out.print(aVol.getVlt_pw() + ",");
//			System.out.print(aVol.getVlt_tel() + ",");
//			System.out.print(aVol.getVlt_img() + ",");			
//			System.out.print(aVol.getVlt_registerdate() + ",");			
//			System.out.print(aVol.getVlt_duty_day() + ",");
//			System.out.print(aVol.getVlt_sta()+ ",");
//			System.out.print(aVol.getVlt_reg());
//			System.out.println();
//		}
		
		//志工查待救援案例
		RescueVO rescueVO = dao.volunteerCheckOut("V000000001");
		System.out.println(rescueVO.getRsc_id());
		System.out.println(rescueVO.getRsc_name());
		System.out.println(rescueVO.getRsc_add());
		System.out.println(rescueVO.getRsc_des());
		System.out.println(rescueVO.getRsc_img());
		System.out.println(rescueVO.getRsc_lat());
		System.out.println(rescueVO.getRsc_lon());
		System.out.println(rescueVO.getRsc_btime());
		
		
	}

	@Override
	public boolean isVltMail(String vlt_mail, String vlt_psw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isVolunteer = false;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_EMAIL_PASWD);
			pstmt.setString(1,vlt_mail);
			pstmt.setString(2,vlt_psw);
			ResultSet rs = pstmt.executeQuery();
			isVolunteer = rs.next();
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
		}return isVolunteer;
	}

	@Override
	public boolean isVltExist(String vlt_mail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isVolunteerExist = false;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CHECK_EMAIL_EXIST);
			pstmt.setString(1,vlt_mail);
			
			ResultSet rs = pstmt.executeQuery();
			isVolunteerExist = rs.next();
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
		}return isVolunteerExist;
	}

	

	

	



	
}
