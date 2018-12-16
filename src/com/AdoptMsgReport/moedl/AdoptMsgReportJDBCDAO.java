package com.AdoptMsgReport.moedl;

import java.sql.*;
import java.util.*;

import com.AdoptApply.model.AdoptApplyVO;
import com.AdoptMsg.model.AdoptMsgJDBCDAO;

public class AdoptMsgReportJDBCDAO implements AdoptMsgReportDAO_Interface{ 
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "CA105G5"; 
	String password = "123456";
	
	private static final String INSERT_ADOPT_MSG_RT = "INSERT INTO ADOPT_MSG_RT (ADOPT_MSG_RT_ID,ADOPT_MSG_ID,MEMB_ID,ADOPT_MSG_RT_COMM) values ('AMR'||LPAD(to_char(adopt_msg_rt_seq.NEXTVAL),7,'0'),?,?,?)";
	private static final String UPDATE = "SELECT * FROM ADOPT_MSG_RT WHERE ADOPT_MSG_ID=?";
	private static final String GET_ONE_ADOPT_MSG_RT =	"SELECT * FROM ADOPT_MSG_RT WHERE ADOPT_MSG_RT_ID=?";
	private static final String GET_ALL_ADOPT_MSG_RT = "SELECT * FROM ADOPT_MSG_RT ORDER BY ADOPT_MSG_RT_ID";
	private static final String DELETE = "DELETE FROM ADOPT_MSG_RT WHERE ADOPT_MSG_RT_ID=?";


	public AdoptMsgReportJDBCDAO() {
		// TODO Auto-generated constructor stub
	}

	//新增
	@Override
	public void insert(AdoptMsgReportVO adoptMsgReportVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT_MSG_RT);
			
			pstmt.setString(1, adoptMsgReportVO.getAdopt_msg_id());
			pstmt.setString(2, adoptMsgReportVO.getMemb_id());
			pstmt.setString(3, adoptMsgReportVO.getAdopt_msg_rt_comm());
			
			
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
	public void update(AdoptMsgReportVO adoptMsgReportVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, adoptMsgReportVO.getAdopt_msg_rt_id());
			pstmt.setString(2, adoptMsgReportVO.getMemb_id());
			pstmt.setTimestamp(3, adoptMsgReportVO.getAdopt_msg_rt_time());
			pstmt.setString(4, adoptMsgReportVO.getAdopt_msg_rt_comm());
			pstmt.setString(5, adoptMsgReportVO.getAdopt_msg_rv_des());
			pstmt.setString(6, adoptMsgReportVO.getAdopt_msg_rt_status());
			
			
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
	public void delete(String adopt_msg_rt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, adopt_msg_rt_id);
			
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

	//查一個
	@Override
	public List<AdoptMsgReportVO> findByPrimaryKey(String adopt_msg_rt_id) {
		List<AdoptMsgReportVO> list = new ArrayList<AdoptMsgReportVO>();
		AdoptMsgReportVO adoptMsgReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
			
		ResultSet rs =null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_ADOPT_MSG_RT);
			pstmt.setString(1, adopt_msg_rt_id);  
			
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				
				adoptMsgReportVO = new AdoptMsgReportVO();
				adoptMsgReportVO.setAdopt_msg_rt_id(rs.getString("adopt_msg_rt_id"));
				adoptMsgReportVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgReportVO.setMemb_id(rs.getString("memb_id"));
				adoptMsgReportVO.setAdopt_msg_rt_time(rs.getTimestamp("adopt_msg_rt_time"));
				adoptMsgReportVO.setAdopt_msg_rt_comm(rs.getString("adopt_msg_rt_comm"));
				adoptMsgReportVO.setAdopt_msg_rv_des(rs.getString("adopt_msg_rv_des"));
				adoptMsgReportVO.setAdopt_msg_rt_status(rs.getString("adopt_msg_rt_status"));
				list.add(adoptMsgReportVO);
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


	@Override
	public List<AdoptMsgReportVO> getAll() {
		List<AdoptMsgReportVO> list = new ArrayList<AdoptMsgReportVO>();
		AdoptMsgReportVO adoptMsgReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
			
		ResultSet rs =null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_ADOPT_MSG_RT);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				
				adoptMsgReportVO = new AdoptMsgReportVO();
				adoptMsgReportVO.setAdopt_msg_rt_id(rs.getString("adopt_msg_rt_id"));
				adoptMsgReportVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgReportVO.setMemb_id(rs.getString("memb_id"));
				adoptMsgReportVO.setAdopt_msg_rt_time(rs.getTimestamp("adopt_msg_rt_time"));
				adoptMsgReportVO.setAdopt_msg_rt_comm(rs.getString("adopt_msg_rt_comm"));
				adoptMsgReportVO.setAdopt_msg_rv_des(rs.getString("adopt_msg_rv_des"));
				adoptMsgReportVO.setAdopt_msg_rt_status(rs.getString("adopt_msg_rt_status"));
				list.add(adoptMsgReportVO);
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
		
		AdoptMsgReportJDBCDAO dao = new AdoptMsgReportJDBCDAO();
		
//		//新增
//		AdoptMsgReportVO adoptMsgReportVO1 = new AdoptMsgReportVO();
//		adoptMsgReportVO1.setAdopt_msg_id("AM00000003");
//		adoptMsgReportVO1.setMemb_id("M000000002");
//		adoptMsgReportVO1.setAdopt_msg_rt_comm("檢舉內容");
//		dao.insert(adoptMsgReportVO1);
//		System.out.println("新增成功");
		
//		//刪除
//		dao.delete("AMR0000002");
//		System.out.println("刪除成功");
	
//		//查一筆
//		List<AdoptMsgReportVO> list = dao.findByPrimaryKey("AMR0000001");
//		for (AdoptMsgReportVO reportmsg : list) {
//		System.out.println(reportmsg.getAdopt_msg_rt_id() + ",");
//		System.out.println(reportmsg.getAdopt_msg_id() + ",");
//		System.out.println(reportmsg.getMemb_id() + ",");
//		System.out.println(reportmsg.getAdopt_msg_rt_time() + ",");
//		System.out.println(reportmsg.getAdopt_msg_rt_comm() + ",");
//		System.out.println(reportmsg.getAdopt_msg_rv_des() + ",");
//		System.out.println(reportmsg.getAdopt_msg_rt_status() + ",");
//		System.out.println("---------------------------");
//		System.out.println("查一筆成功");
//		}
	
		
//		//查全部
//		List<AdoptMsgReportVO> list = dao.getAll();
//		for (AdoptMsgReportVO reportmsg : list) {
//			System.out.println(reportmsg.getAdopt_msg_rt_id() + ",");
//			System.out.println(reportmsg.getAdopt_msg_id() + ",");
//			System.out.println(reportmsg.getMemb_id() + ",");
//			System.out.println(reportmsg.getAdopt_msg_rt_time() + ",");
//			System.out.println(reportmsg.getAdopt_msg_rt_comm() + ",");
//			System.out.println(reportmsg.getAdopt_msg_rv_des() + ",");
//			System.out.println(reportmsg.getAdopt_msg_rt_status() + ",");
//			System.out.println("---------------------------");
//		}
		
	}	

	
}
