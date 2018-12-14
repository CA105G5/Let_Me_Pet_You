package com.AdoptTrack.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.AdoptMsg.model.AdoptMsgJDBCDAO;
import com.AdoptMsg.model.AdoptMsgVO;

public class AdoptTrackJDBCDAO implements AdoptTrackDAO_Interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "CA105G5";
	String password = "123456";
	
	private static final String INSERT_ADOPT_TRACK = "INSERT INTO ADOPT_TRACK (ADOPT_ID,MEMB_ID) values (?,?)";
	private static final String GET_ALL_ADOPT_TRACK = "SELECT * FROM ADOPT_TRACK ORDER BY MEMB_ID";
	private static final String DELETE = "DELETE FROM ADOPT_TRACK where ADOPT_ID = ? AND MEMB_ID = ?";

	public AdoptTrackJDBCDAO() {
		// TODO Auto-generated constructor stub
	}
	//新增
	@Override
	public void insert(AdoptTrackVO adoptTrackVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT_TRACK);

			pstmt.setString(1, adoptTrackVO.getAdopt_id());
			pstmt.setString(2, adoptTrackVO.getMemb_id());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void insert(String adopt_id, String memb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_ADOPT_TRACK);

			pstmt.setString(1, adopt_id);
			pstmt.setString(2, memb_id);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(String adopt_id, String memb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, adopt_id);
			pstmt.setString(2, memb_id);
			
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
	//查詢
	@Override
	public List<AdoptTrackVO> getAll() {
		List<AdoptTrackVO> list =  new ArrayList<AdoptTrackVO>();
		AdoptTrackVO adoptTrackVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_ADOPT_TRACK);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adoptTrackVO = new AdoptTrackVO();
				adoptTrackVO.setAdopt_id(rs.getString("adopt_id"));
				adoptTrackVO.setMemb_id(rs.getString("memb_id"));
				list.add(adoptTrackVO);
				
						
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
		
		AdoptTrackJDBCDAO dao = new AdoptTrackJDBCDAO();
		
//		//新增
//		AdoptTrackVO adoptTrackVO1 = new AdoptTrackVO();
//		adoptTrackVO1.setAdopt_id("A000000004");
//		adoptTrackVO1.setMemb_id("M000000004");
//		dao.insert(adoptTrackVO1);
//		System.out.println("新增成功");
		
//		//刪除
//		dao.delete("A000000003","M000000003");
//		System.out.println("刪除成功");
	
		
//		//查全部
//		List<AdoptTrackVO> list = dao.getAll();
//		for (AdoptTrackVO adoptTrack : list) {
//			System.out.println(adoptTrack.getAdopt_id() + ",");
//			System.out.println(adoptTrack.getMemb_id() + ",");
//			System.out.println("---------------------------");
//		}	
	}
}
	

	

	