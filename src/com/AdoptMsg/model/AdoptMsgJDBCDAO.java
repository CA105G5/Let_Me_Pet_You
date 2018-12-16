package com.AdoptMsg.model;

import java.util.*;

import com.AdoptMsg.*;
import com.Adoption.model.AdoptionJDBCDAO;
import com.Adoption.model.AdoptionVO;
import com.mysql.jdbc.Driver;
import java.sql.*;

public class AdoptMsgJDBCDAO implements AdoptMsgDAO_Interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "CA105G5"; 
	String password = "123456";
	
	private static final String INSERT_ADOPT_MSG = 
			"INSERT INTO ADOPT_MSG (ADOPT_MSG_ID,ADOPT_ID,ADOPT_MSG_SPER,ADOPT_MSG_COMM) values ('AM'||LPAD(to_char(adopt_msg_seq.NEXTVAL),8,'0'),?,?,?)";
	private static final String GET_ONE_ADOPT_MSG =
			"SELECT * FROM ADOPT_MSG WHERE ADOPT_MSG_ID=?";
	private static final String GET_ALL_ADOPT_MSG =
			"SELECT * FROM ADOPT_MSG ORDER BY ADOPT_MSG_ID";
	private static final String DELETE = 
			"DELETE FROM ADOPT_MSG WHERE ADOPT_MSG_ID=?";
	private static final String UPDATE =
			"UPDATE ADOPT_MSG SET ADOPT_ID=?,ADOPT_MSG_SPER=?,ADOPT_MSG_TIME=?,ADOPT_MSG_COMM=? WHERE ADOPT_MSG_ID=?";

	public AdoptMsgJDBCDAO() {
		
	}
	
	//新增
	@Override
	public void insert(AdoptMsgVO adoptMsgVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT_MSG);
			
			pstmt.setString(1, adoptMsgVO.getAdopt_id());
			pstmt.setString(2, adoptMsgVO.getAdopt_msg_sper());
			pstmt.setString(3, adoptMsgVO.getAdopt_msg_comm());
			
			pstmt.executeUpdate();
				
		} catch (ClassNotFoundException c) {
			throw new RuntimeException("Couldn't load database driver. " + c.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured" + se.getMessage());
			
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
	//修改
	@Override
	public void update(AdoptMsgVO adoptMsgVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE);
		
			pstmt.setString(1, adoptMsgVO.getAdopt_id());
			pstmt.setString(2, adoptMsgVO.getAdopt_msg_sper());
			pstmt.setTimestamp(3, adoptMsgVO.getAdopt_msg_time());
			pstmt.setString(4, adoptMsgVO.getAdopt_msg_comm());
			pstmt.setString(5, adoptMsgVO.getAdopt_msg_id());
		
			

			pstmt.executeUpdate();
					
		} catch (ClassNotFoundException c) {
			throw new RuntimeException("Couldn't load database driver. " + c.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured" + se.getMessage());
			
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
	//刪除
	@Override
	public void delete(String adopt_msg_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, adopt_msg_id);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException c) {
			throw new RuntimeException("Couldn't load database driver. " + c.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured" + se.getMessage());
			
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
	//查單筆資料
	@Override
	public AdoptMsgVO findByPrimaryKey(String adopt_msg_id) {
		AdoptMsgVO adoptMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_ADOPT_MSG);
			
			pstmt.setString(1, adopt_msg_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adoptMsgVO = new AdoptMsgVO();
				adoptMsgVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgVO.setAdopt_id(rs.getString("adopt_id"));
				adoptMsgVO.setAdopt_msg_sper(rs.getString("adopt_msg_sper"));
				adoptMsgVO.setAdopt_msg_time(rs.getTimestamp("adopt_msg_time"));
				adoptMsgVO.setAdopt_msg_comm(rs.getString("adopt_msg_comm"));
				
						
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
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
		return adoptMsgVO;
	}
	//查全部
	@Override
	public List<AdoptMsgVO> getAll() {
		
		List<AdoptMsgVO> list = new ArrayList<AdoptMsgVO>();
		AdoptMsgVO adoptMsgVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_ADOPT_MSG);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				
				adoptMsgVO = new AdoptMsgVO();
				adoptMsgVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgVO.setAdopt_id(rs.getString("adopt_id"));
				adoptMsgVO.setAdopt_msg_sper(rs.getString("adopt_msg_sper"));
				adoptMsgVO.setAdopt_msg_time(rs.getTimestamp("adopt_msg_time"));
				adoptMsgVO.setAdopt_msg_comm(rs.getString("adopt_msg_comm"));
				list.add(adoptMsgVO);
			}
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			
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
		
		AdoptMsgJDBCDAO dao = new AdoptMsgJDBCDAO();
		
//		//新增
//		AdoptMsgVO adoptMsgVO1 = new AdoptMsgVO();
//		adoptMsgVO1.setAdopt_id("A000000007");
//		adoptMsgVO1.setAdopt_msg_sper("M000000002");
//		adoptMsgVO1.setAdopt_msg_comm("留言描述");
//		dao.insert(adoptMsgVO1);
//		System.out.println("新增成功");
		
//		//刪除
//		dao.delete("AM00000007");
	
//		//查一筆
//		AdoptMsgVO adoptMsgVO2 = dao.findByPrimaryKey("AM00000001");
//		System.out.println(adoptMsgVO2.getAdopt_msg_id() + ",");
//		System.out.println(adoptMsgVO2.getAdopt_id() + ",");
//		System.out.println(adoptMsgVO2.getAdopt_msg_sper() + ",");
//		System.out.println(adoptMsgVO2.getAdopt_msg_time() + ",");
//		System.out.println(adoptMsgVO2.getAdopt_msg_comm() + ",");
//		System.out.println("---------------------------");
//		System.out.println("查一筆成功");
	
		
//		//查全部
//		List<AdoptMsgVO> list = dao.getAll();
//		for (AdoptMsgVO mymsg : list) {
//			System.out.println(mymsg.getAdopt_msg_id() + ",");
//			System.out.println(mymsg.getAdopt_id() + ",");
//			System.out.println(mymsg.getAdopt_msg_sper() + ",");
//			System.out.println(mymsg.getAdopt_msg_time() + ",");
//			System.out.println(mymsg.getAdopt_msg_comm() + ",");
//			System.out.println("---------------------------");
//		}
//		
	}	

}
