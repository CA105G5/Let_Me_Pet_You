package com.Adoption.model;

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

public class AdoptionJNDIDAO implements AdoptionDAO_Interface{

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_ADOPT = 
			"INSERT INTO ADOPTION (ADOPT_ID,ADOPT_SPECIES,ADOPT_SPONSOR,ADOPT_DES,ADPOT_IMG) values ('A'||LPAD(to_char(adoption_seq.NEXTVAL),9,'0'),?,?,?,?)";
	private static final String GET_ONE_ADOPT =
			"SELECT * FROM ADOPTION WHERE ADOPT_ID=?";
	private static final String GET_ALL_ADOPT =
			"SELECT * FROM ADOPTION ORDER BY ADOPT_ID";
	private static final String UPDATE =
			"UPDATE ADOPTION SET ADOPT_SPECIES=?,ADOPT_SPONSOR=?,ADOPT_STATUS=?,ADOPT_APPLY_STATUS=?,ADOPT_BTIME=?,ADOPT_ETIME=?,ADOPT_DES=?,ADOPT_IMG=? WHERE ADOPT_ID=?";
	
	
	
	
	
	public AdoptionJNDIDAO() {
		
	}
	//新增
	@Override
	public void insert(AdoptionVO adoptionVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ADOPT);
		
			
			pstmt.setString(1, adoptionVO.getAdopt_species());
			pstmt.setString(2, adoptionVO.getAdopt_sponsor());
			pstmt.setString(3, adoptionVO.getAdopt_des());
			pstmt.setBytes(4, adoptionVO.getAdopt_img());
			
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
		
	//修改
	@Override
	public void update(AdoptionVO adoptionVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
		
			pstmt.setString(1, adoptionVO.getAdopt_species());
			pstmt.setString(2, adoptionVO.getAdopt_sponsor());
			pstmt.setString(3, adoptionVO.getAdopt_status());
			pstmt.setString(4, adoptionVO.getAdopt_apply_status());
			pstmt.setTimestamp(5, adoptionVO.getAdopt_btime());
			pstmt.setTimestamp(6, adoptionVO.getAdopt_etime());
			pstmt.setString(7, adoptionVO.getAdopt_des());
			pstmt.setBytes(8, adoptionVO.getAdopt_img());
			pstmt.setString(9, adoptionVO.getAdopt_id());

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
	public AdoptionVO findByPrimaryKey(String adopt_id) {
		AdoptionVO adoptionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ADOPT);
			
			pstmt.setString(1, adopt_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adoptionVO = new AdoptionVO();
				adoptionVO.setAdopt_id(rs.getString("adopt_id"));
				adoptionVO.setAdopt_species(rs.getString("adopt_species"));
				adoptionVO.setAdopt_sponsor(rs.getString("adopt_sponsor"));
				adoptionVO.setAdopt_status(rs.getString("adopt_status"));
				adoptionVO.setAdopt_apply_status(rs.getString("adopt_apply_status"));
				adoptionVO.setAdopt_btime(rs.getTimestamp("adopt_btime"));
				adoptionVO.setAdopt_etime(rs.getTimestamp("adopt_etime"));
				adoptionVO.setAdopt_des(rs.getString("adopt_des"));
				adoptionVO.setAdopt_img(rs.getBytes("adopt_img"));
						
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
		return adoptionVO;
	}
		

	//查全部
	@Override
	public List<AdoptionVO> getAll() {
		
		List<AdoptionVO> list = new ArrayList<AdoptionVO>();
		AdoptionVO adoptionVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_ADOPT);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				
				adoptionVO = new AdoptionVO();
				adoptionVO.setAdopt_id(rs.getString("adopt_id"));
				adoptionVO.setAdopt_species(rs.getString("adopt_species"));
				adoptionVO.setAdopt_sponsor(rs.getString("adopt_sponsor"));
				adoptionVO.setAdopt_status(rs.getString("adopt_status"));
				adoptionVO.setAdopt_apply_status(rs.getString("adopt_apply_status"));
				adoptionVO.setAdopt_btime(rs.getTimestamp("adopt_btime"));
				adoptionVO.setAdopt_etime(rs.getTimestamp("adopt_etime"));
				adoptionVO.setAdopt_des(rs.getString("adopt_des"));
				adoptionVO.setAdopt_img(rs.getBytes("adopt_img"));
				list.add(adoptionVO);
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
