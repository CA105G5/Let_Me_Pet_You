package com.AdoptApply.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.AdoptMsg.model.AdoptMsgVO;
import com.donate.model.DonateVO;

public class AdoptApplyJDBCDAO implements AdoptApplyDAO_Interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "G5";
	String password = "g5";
	
	private static final String INSERT_ADOPT_APPLY =
			"INSERT INTO ADOPT_APPLY (MEMB_ID,ADOPT_ID,ADOPT_DES,ADOPT_ID_STATUS) values (?,?,?,?)";
	private static final String UPDATE_STATUS =
			"UPDATE ADOPT_APPLY SET ADOPT_ID_STATUS=? WHERE ADOPT_ID=?";
	
	private static final String DELETE =
			"DELETE FROM ADOPT_APPLY WHERE ADOPT_ID=? AND MEMB_ID=?";
	
	private static final String GET_ONE_ADOPT_APPLY =
			"SELECT * FROM ADOPT_APPLY WHERE MEMB_ID=? AND ADOPT_ID=?";
	
	private static final String GET_ALL_ADOPT_APPLY =
			"SELECT * FROM ADOPT_APPLY WHERE MEMB_ID =?";
	
	public AdoptApplyJDBCDAO() {
		
	}
	//新增
	@Override
	public void insert(AdoptApplyVO adoptApplyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT_APPLY);
			
			pstmt.setString(1, adoptApplyVO.getMemb_id());
			pstmt.setString(2, adoptApplyVO.getAdopt_id());
			pstmt.setString(3, adoptApplyVO.getAdopt_des());
			pstmt.setString(4, adoptApplyVO.getAdopt_id_status());
			
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
	//新增2
	@Override
	public void insert(String memb_id, String adopt_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT_APPLY);
		
			pstmt.setString(1, memb_id);
			pstmt.setString(2, adopt_id);
			
			

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
	public void update(AdoptApplyVO adoptApplyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE_STATUS);
		
			pstmt.setString(2, adoptApplyVO.getAdopt_id());
			pstmt.setString(1, adoptApplyVO.getAdopt_id_status());
			

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
	public void delete(String memb_id, String adopt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(2, memb_id);
			pstmt.setString(1, adopt_id);
			
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
	public List<AdoptApplyVO> findByPrimaryKey(String memb_id, String adopt_id) {
		List<AdoptApplyVO> list = new ArrayList<>();
		AdoptApplyVO adoptApplyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_ADOPT_APPLY);
			
			pstmt.setString(1, memb_id);
			pstmt.setString(2, adopt_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setMemb_id(rs.getString("memb_id"));
				adoptApplyVO.setAdopt_id(rs.getString("adopt_id"));
				adoptApplyVO.setAdopt_des(rs.getString("adopt_des"));
				adoptApplyVO.setAdopt_id_status(rs.getString("adiot_id_status"));
				list.add(adoptApplyVO);
						
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
	//查全部
	@Override
	public List<AdoptApplyVO> FindbyMember(String memb_id) {
		List<AdoptApplyVO> list = new ArrayList<AdoptApplyVO>();
		AdoptApplyVO adoptApplyVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		ResultSet rs =null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_ADOPT_APPLY);
			
			pstmt.setString(1, memb_id);
			System.out.println(memb_id);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			
			while (rs.next()) {
				adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setMemb_id(rs.getString("memb_id"));
				adoptApplyVO.setAdopt_id(rs.getString("adopt_id"));
				adoptApplyVO.setAdopt_des(rs.getString("adopt_des"));
				adoptApplyVO.setAdopt_id_status(rs.getString("adiot_id_status"));
				System.out.println(rs.getString("memb_id"));
				list.add(adoptApplyVO);
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
		
		AdoptApplyJDBCDAO dao = new AdoptApplyJDBCDAO();
		
		// 新增
//		AdoptApplyVO adoptApplyVO1 = new AdoptApplyVO();
//		adoptApplyVO1.setMemb_id("M000000003");
//		adoptApplyVO1.setAdopt_id("A000000003");
//		adoptApplyVO1.setAdopt_des("我愛寵物給 全心全意無時無刻");
//		adoptApplyVO1.setAdopt_id_status("未審核");
//		dao.insert(adoptApplyVO1);

//		// 修改
//		AdoptApplyVO adoptApplyVO2 = new AdoptApplyVO();
//		adoptApplyVO2.setAdopt_id("A000000003");
//		adoptApplyVO2.setAdopt_id_status("已審核");
//		dao.update(adoptApplyVO2);
//
//		// 刪除
//		dao.delete("A000000003","M000000003");

		// 查詢
//		List<AdoptApplyVO> adpotvo = dao.findByPrimaryKey("M000000003", "A000000003");
//		for(AdoptApplyVO listfindone : adpotvo) {
//		System.out.print(listfindone.getAdopt_id() + ",");
//		System.out.print(listfindone.getMemb_id() + ",");
//		System.out.print(listfindone.getAdopt_des() + ",");
//		System.out.print(listfindone.getAdopt_id_status() + ",");
//		System.out.println("---------------------");
//		}
		// 查詢
		List<AdoptApplyVO> list = dao.FindbyMember("M000000001");
		for (AdoptApplyVO aApply : list) {
			System.out.print(aApply.getAdopt_id() + ",");
			System.out.print(aApply.getMemb_id() + ",");
			System.out.print(aApply.getAdopt_des() + ",");
			System.out.print(aApply.getAdopt_id_status() + ",");
			System.out.println("---------------------");
		}
		
	}

}


