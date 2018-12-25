package com.rscMsg.model;

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

import com.rscRt.model.RscRtVO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_RscMsg;





public class RscMsgJDBCDAO implements RscMsgDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";
	
	private static final String INSERT_STMT="INSERT INTO RSC_MSG (rsc_msg_id,rsc_id,rsc_msg_sper,rsc_msg_comm,rsc_msg_status) VALUES ('RM'||lpad(to_char(rsc_msg_seq.nextval), 13, '0'),?,?,?,?)";
	private static final String UPDATE_STMT="UPDATE RSC_MSG set rsc_id=?, rsc_msg_sper=?, rsc_msg_comm=?, rsc_msg_status=? where rsc_msg_id=?";
	private static final String DELETE_STMT="DELETE FROM RSC_MSG where rsc_msg_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM RSC_MSG where rsc_msg_id=?"; 
	private static final String GET_ALL_STMT="SELECT * FROM RSC_MSG order by rsc_msg_id";

	@Override
	public void insert(RscMsgVO rscMsgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,rscMsgVO.getRsc_id());
			pstmt.setString(2,rscMsgVO.getRsc_msg_sper());
			pstmt.setString(3,rscMsgVO.getRsc_msg_comm());
			pstmt.setString(4,rscMsgVO.getRsc_msg_status());
			
			pstmt.executeUpdate();
			
			
			
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
		}
		
	}

	@Override
	public void update(RscMsgVO rscMsgVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,rscMsgVO.getRsc_id());
			pstmt.setString(2,rscMsgVO.getRsc_msg_sper());
			pstmt.setString(3,rscMsgVO.getRsc_msg_comm());
			pstmt.setString(4,rscMsgVO.getRsc_msg_status());
			pstmt.setString(5,rscMsgVO.getRsc_msg_id());
					
			pstmt.executeUpdate();
			
	
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
		}
		
	}

	@Override
	public void delete(String rsc_msg_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,rsc_msg_id);
			
			pstmt.executeUpdate();
			
			
			
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
		}
		
	}

	@Override
	public RscMsgVO findByPrimaryKey(String rsc_msg_id) {
		RscMsgVO rscMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,rsc_msg_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rscMsgVO = new RscMsgVO();
				rscMsgVO.setRsc_msg_id(rs.getString("rsc_msg_id"));
				rscMsgVO.setRsc_id(rs.getString("rsc_id"));
				rscMsgVO.setRsc_msg_sper(rs.getString("rsc_msg_sper"));
				rscMsgVO.setRsc_msg_time(rs.getTimestamp("rsc_msg_time"));
				rscMsgVO.setRsc_msg_comm(rs.getString("rsc_msg_comm"));
				rscMsgVO.setRsc_msg_status(rs.getString("rsc_msg_status"));	
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
		return rscMsgVO;
	}

	@Override
	public List<RscMsgVO> getAll() {
		List<RscMsgVO> list = new ArrayList<RscMsgVO>();
		RscMsgVO rscMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rscMsgVO = new RscMsgVO();
				rscMsgVO.setRsc_msg_id(rs.getString("rsc_msg_id"));
				rscMsgVO.setRsc_id(rs.getString("rsc_id"));
				rscMsgVO.setRsc_msg_sper(rs.getString("rsc_msg_sper"));
				rscMsgVO.setRsc_msg_time(rs.getTimestamp("rsc_msg_time"));
				rscMsgVO.setRsc_msg_comm(rs.getString("rsc_msg_comm"));
				rscMsgVO.setRsc_msg_status(rs.getString("rsc_msg_status"));
				list.add(rscMsgVO);
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
		return list; 
	}
	
	@Override
	public List<RscMsgVO> getAll(Map<String, String[]> map) {
		List<RscMsgVO> list = new ArrayList<RscMsgVO>();
		RscMsgVO rscMsgVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			String finalSQL = "select * from rsc_msg "
			          + jdbcUtil_CompositeQuery_RscMsg.get_WhereCondition(map)
			          + "order by rsc_msg_id";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				rscMsgVO = new RscMsgVO();
				rscMsgVO.setRsc_msg_id(rs.getString("rsc_msg_id"));
				rscMsgVO.setRsc_id(rs.getString("rsc_id"));
				rscMsgVO.setRsc_msg_sper(rs.getString("rsc_msg_sper"));
				rscMsgVO.setRsc_msg_time(rs.getTimestamp("rsc_msg_time"));
				rscMsgVO.setRsc_msg_comm(rs.getString("rsc_msg_comm"));
				rscMsgVO.setRsc_msg_status(rs.getString("rsc_msg_status"));
				list.add(rscMsgVO); // Store the row in the List
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
		RscMsgJDBCDAO dao = new RscMsgJDBCDAO();

		 //新增
//		RscMsgVO rscMsgVO1 = new RscMsgVO();
//		rscMsgVO1.setRsc_id("R000000002");
//		rscMsgVO1.setRsc_msg_sper("M000000003");
//		rscMsgVO1.setRsc_msg_time(new Timestamp(new Date().getTime()));
//		rscMsgVO1.setRsc_msg_comm("XXX");
//		rscMsgVO1.setRsc_msg_status("XXX");
//		dao.insert(rscMsgVO1);

		// 修改
//		RscMsgVO rscMsgVO2 = new RscMsgVO();
//		rscMsgVO2.setRsc_msg_id("RM0000000000006");
//		rscMsgVO2.setRsc_id("R000000002");
//		rscMsgVO2.setRsc_msg_sper("M000000008");
//		rscMsgVO2.setRsc_msg_comm("XXXX");
//		rscMsgVO2.setRsc_msg_status("XXXX");
//		dao.update(rscMsgVO2);

		// 刪除
//		dao.delete("RM0000000000006");

		// 查詢
//		RscMsgVO rscMsgVO3 = dao.findByPrimaryKey("RM0000000000001");
//		System.out.print(rscMsgVO3.getRsc_msg_id() + ",");
//		System.out.print(rscMsgVO3.getRsc_id()+ ",");
//		System.out.print(rscMsgVO3.getRsc_msg_sper() + ",");
//		System.out.print(rscMsgVO3.getRsc_msg_time() + ",");
//		System.out.print(rscMsgVO3.getRsc_msg_comm() + ",");
//		System.out.println(rscMsgVO3.getRsc_msg_status() + ",");
//		
//		System.out.println("---------------------");

		// 查詢
//		List<RscMsgVO> list = dao.getAll();
//		for (RscMsgVO aRscMsgRt : list) {
//			System.out.print(aRscMsg.getRsc_msg_id() + ",");
//			System.out.print(aRscMsg.getRsc_id()+ ",");
//			System.out.print(aRscMsg.getRsc_msg_sper() + ",");
//			System.out.print(aRscMsg.getRsc_msg_time() + ",");
//			System.out.print(aRscMsg.getRsc_msg_comm() + ",");
//			System.out.print(aRscMsg.getRsc_msg_status() + ",");
//			
//			System.out.println();
//			
//		}
		
	//複合查詢
		
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("rsc_msg_id", new String[] { "RM0000000000001" });
		map.put("rsc_id", new String[] { "R000000001" });
		map.put("rsc_msg_sper", new String[] { "M000000006" });
		map.put("action", new String[] { "getXXX" });
		List<RscMsgVO> list = dao.getAll(map);
		for (RscMsgVO aRscMsg : list) {
			System.out.print(aRscMsg.getRsc_msg_id() + ",");
			System.out.print(aRscMsg.getRsc_id()+ ",");
			System.out.print(aRscMsg.getRsc_msg_sper() + ",");
			System.out.print(aRscMsg.getRsc_msg_time() + ",");
			System.out.print(aRscMsg.getRsc_msg_comm() + ",");
			System.out.print(aRscMsg.getRsc_msg_status() + ",");
			
			System.out.println();
		}
	}

}
