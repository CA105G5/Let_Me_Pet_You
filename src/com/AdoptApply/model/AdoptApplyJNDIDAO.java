package com.AdoptApply.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.AdoptMsg.model.AdoptMsgVO;
import com.Adoption.model.AdoptionJDBCDAO;
import com.Adoption.model.AdoptionVO;
import com.donate.model.DonateVO;

public class AdoptApplyJNDIDAO implements AdoptApplyDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_ADOPT_APPLY =
			"INSERT INTO ADOPT_APPLY (MEMB_ID,ADOPT_ID,ADOPT_DES) values (?,?,?)";
	private static final String UPDATE_STATUS =
			"UPDATE ADOPT_APPLY SET ADOPT_ID_STATUS=? WHERE ADOPT_ID=? AND MEMB_ID=?";
	
	private static final String DELETE =
			"DELETE FROM ADOPT_APPLY WHERE ADOPT_ID=? AND MEMB_ID=?";
	
	private static final String GET_ONE_ADOPT_APPLY =
			"SELECT * FROM ADOPT_APPLY WHERE MEMB_ID=? AND ADOPT_ID=?";
	
	private static final String GET_ALL_ADOPT_APPLY =
			"SELECT * FROM ADOPT_APPLY ORDER BY ADOPT_ID";
	
	private static final String FIND_BY_ADOPT =
			"SELECT memb_id FROM ADOPT_APPLY WHERE ADOPT_ID=?";
	private static final String OTHER_STATUS = "UPDATE ADOPT_APPLY SET ADOPT_ID_STATUS='未通過' WHERE ADOPT_ID_STATUS='未審核' AND ADOPT_ID=?";

	
	//新增
	@Override
	public void insert(AdoptApplyVO adoptApplyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ADOPT_APPLY);
			
			pstmt.setString(1, adoptApplyVO.getMemb_id());
			pstmt.setString(2, adoptApplyVO.getAdopt_id());
			pstmt.setString(3, adoptApplyVO.getAdopt_des());
			
			pstmt.executeUpdate();
				
			
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
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ADOPT_APPLY);
		
			pstmt.setString(1, memb_id);
			pstmt.setString(2, adopt_id);
			
			

			pstmt.executeUpdate();
					
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
	// 修改
	@Override
	public void update(AdoptApplyVO adoptApplyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);

			// 1●設定於 pstm.executeUpdate()之前
			con.setAutoCommit(false);

			pstmt.setString(1, adoptApplyVO.getAdopt_id_status());
			pstmt.setString(2, adoptApplyVO.getAdopt_id());
			pstmt.setString(3, adoptApplyVO.getMemb_id());
			pstmt.executeUpdate();

			pstmt2 = con.prepareStatement(OTHER_STATUS);
			pstmt2.setString(1, adoptApplyVO.getAdopt_id());
			
			pstmt2.executeUpdate();
			
			AdoptionJDBCDAO dao = new AdoptionJDBCDAO();
			dao.updateStatus(adoptApplyVO, con);
			
			// 2●設定於 pstm.executeUpdate()之後
			con.commit();


		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-dept");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(2, memb_id);
			pstmt.setString(1, adopt_id);
			
			pstmt.executeUpdate();
			
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
		public List<AdoptApplyVO> findByAdopt(String adopt_id) {
			List<AdoptApplyVO> list = new ArrayList<>();
			AdoptApplyVO adoptApplyVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(FIND_BY_ADOPT);
				
				pstmt.setString(1, adopt_id);
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					adoptApplyVO = new AdoptApplyVO();
					adoptApplyVO.setMemb_id(rs.getString("memb_id"));
					list.add(adoptApplyVO);
					
				}
				
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
	
	
	//查單筆資料
	@Override
	public List<AdoptApplyVO> findByPrimaryKey(String memb_id, String adopt_id) {
		List<AdoptApplyVO> list = new ArrayList<>();
		AdoptApplyVO adoptApplyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ADOPT_APPLY);
			
			pstmt.setString(1, memb_id);
			pstmt.setString(2, adopt_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setMemb_id(rs.getString("memb_id"));
				adoptApplyVO.setAdopt_id(rs.getString("adopt_id"));
				adoptApplyVO.setAdopt_des(rs.getString("adopt_des"));
				adoptApplyVO.setAdopt_id_status(rs.getString("adopt_id_status"));
				list.add(adoptApplyVO);
						
			}
			
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
	public List<AdoptApplyVO> getAll() {
		List<AdoptApplyVO> list = new ArrayList<AdoptApplyVO>();
		AdoptApplyVO adoptApplyVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		ResultSet rs =null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_ADOPT_APPLY);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setMemb_id(rs.getString("memb_id"));
				adoptApplyVO.setAdopt_id(rs.getString("adopt_id"));
				adoptApplyVO.setAdopt_des(rs.getString("adopt_des"));
				adoptApplyVO.setAdopt_id_status(rs.getString("adopt_id_status"));
				list.add(adoptApplyVO);
			}
			
			
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
}


