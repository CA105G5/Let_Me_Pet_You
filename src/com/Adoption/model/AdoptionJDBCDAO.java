package com.Adoption.model;

import java.util.*;
import com.mysql.jdbc.Driver;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;


public class AdoptionJDBCDAO implements AdoptionDAO_Interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "CA105G5";
	String password = "123456";
	
	private static final String INSERT_ADOPT = 
			"INSERT INTO ADOPTION (ADOPT_ID,ADOPT_SPECIES,ADOPT_SPONSOR,ADOPT_DES,ADOPT_IMG) values ('A'||LPAD(to_char(adoption_seq.NEXTVAL),9,'0'),?,?,?,?)";
	private static final String GET_ONE_ADOPT =
			"SELECT * FROM ADOPTION WHERE ADOPT_ID=?";
	private static final String GET_ALL_ADOPT =
			"SELECT * FROM ADOPTION ORDER BY ADOPT_ID";
	private static final String UPDATE =
			"UPDATE ADOPTION SET ADOPT_SPECIES=?,ADOPT_SPONSOR=?,ADOPT_STATUS=?,ADOPT_APPLY_STATUS=?,ADOPT_BTIME=?,ADOPT_ETIME=?,ADOPT_DES=?,ADOPT_IMG=? WHERE ADOPT_ID=?";
	
	
	
	
	
	public AdoptionJDBCDAO() {
		
	}
	//新增
	@Override
	public void insert(AdoptionVO adoptionVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT);
		
			
			pstmt.setString(1, adoptionVO.getAdopt_species());
			pstmt.setString(2, adoptionVO.getAdopt_sponsor());
			pstmt.setString(3, adoptionVO.getAdopt_des());
			pstmt.setBytes(4, adoptionVO.getAdopt_img());
			
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
	public void update(AdoptionVO adoptionVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
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
	public AdoptionVO findByPrimaryKey(String adopt_id) {
		AdoptionVO adoptionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
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
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
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
			
			AdoptionJDBCDAO dao = new AdoptionJDBCDAO();
			
	//		//新增
			AdoptionVO adoptionVO1 = new AdoptionVO();
			adoptionVO1.setAdopt_species("羊咩咩");
			adoptionVO1.setAdopt_sponsor("M000000009");
			adoptionVO1.setAdopt_des("認養案例描述");
			adoptionVO1.setAdopt_img(null);
//			try {
//				byte[] pic1 = getPictureByteArray("C:\\Project\\01.jpg");
//				adoptionVO1.setAdopt_img(pic1);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			dao.insert(adoptionVO1);
			System.out.println("新增成功");
			
//			//修改
//			AdoptionVO adoptionVO2 = new AdoptionVO();
//			adoptionVO2.setAdopt_id("A000000009");
//			adoptionVO2.setAdopt_species("羊咩咩");
//			adoptionVO2.setAdopt_sponsor("M000000009");
//			adoptionVO2.setAdopt_status("已上架");
//			adoptionVO2.setAdopt_apply_status("已審核");
//			adoptionVO2.setAdopt_btime(java.sql.Timestamp.valueOf("1995-03-15 16:00:00"));
//			adoptionVO2.setAdopt_etime(java.sql.Timestamp.valueOf("1998-03-15 16:00:00"));
//			adoptionVO2.setAdopt_des("認養案例描述");
//			adoptionVO2.setAdopt_img(null);
//			dao.update(adoptionVO2);
//			System.out.println("修改成功");
		
//			//查一筆
//			AdoptionVO adoptionVO3 = dao.findByPrimaryKey("A000000001");
//			System.out.println(adoptionVO3.getAdopt_id() + ",");
//			System.out.println(adoptionVO3.getAdopt_species() + ",");
//			System.out.println(adoptionVO3.getAdopt_sponsor() + ",");
//			System.out.println(adoptionVO3.getAdopt_status() + ",");
//			System.out.println(adoptionVO3.getAdopt_apply_status() + ",");
//			System.out.println(adoptionVO3.getAdopt_btime() + ",");
//			System.out.println(adoptionVO3.getAdopt_etime() + ",");
//			System.out.println(adoptionVO3.getAdopt_des() + ",");
//			System.out.println(adoptionVO3.getAdopt_img() + ",");
//			System.out.println("---------------------------");
//			System.out.println("查一筆成功");
		
			
			//查全部
//			List<AdoptionVO> list = dao.getAll();
//			for (AdoptionVO myadopt : list) {
//				System.out.println(myadopt.getAdopt_id() + ",");
//				System.out.println(myadopt.getAdopt_species() + ",");
//				System.out.println(myadopt.getAdopt_sponsor() + ",");
//				System.out.println(myadopt.getAdopt_status() + ",");
//				System.out.println(myadopt.getAdopt_apply_status() + ",");
//				System.out.println(myadopt.getAdopt_btime() + ",");
//				System.out.println(myadopt.getAdopt_etime() + ",");
//				System.out.println(myadopt.getAdopt_des() + ",");
//				System.out.println(myadopt.getAdopt_img() + ",");
//				System.out.println("---------------------------");
//				System.out.println("查全部成功");
//			}
			
		}
	public static byte[] getPictureByteArray(String path) throws IOException {
		
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];	//設定每次讀取的大小
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();	//將ByteArrayOutputStream轉成ByteArray
	
		}
	
	
	
}	
	
