package com.ntf.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;





public class NtfJDBCDAO implements NtfDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456"; 
	
	private static final String INSERT_STMT="INSERT INTO NOTIFICATIONS (ntf_id,memb_id,ntf_src_id,ntf_dt,ntf_link) VALUES ('NM'||lpad(to_char(notification_seq.nextval), 8, '0'),?,?,?,?)";
	private static final String UPDATE_STMT="UPDATE NOTIFICATIONS set memb_id=?, ntf_src_id=?, ntf_dt=?, ntf_link=?, ntf_sta=?, ntf_time=? where ntf_id=?";
	private static final String UPDATE_STA_STMT="UPDATE NOTIFICATIONS set ntf_sta='已讀' where ntf_id=?";
	private static final String DELETE_STMT="DELETE FROM NOTIFICATIONS where ntf_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM NOTIFICATIONS where ntf_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM NOTIFICATIONS order by ntf_id";
	private static final String MEMBER_GET_ALL_STMT="SELECT * FROM NOTIFICATIONS where memb_id =? AND ntf_sta = '未讀'  order by ntf_id desc";
	private static final String CHECK_MEMBER_NTF="SELECT * FROM NOTIFICATIONS where memb_id =? AND ntf_id=? order by ntf_id";
	public static void main(String[] args) {
		//checked
		NtfJDBCDAO dao = new NtfJDBCDAO();
//		//insert
//		NtfVO ntfVO1 = new NtfVO();
//		ntfVO1.setMemb_id("M000000008");
//		ntfVO1.setNtf_dt("詳情");
//		dao.insert(ntfVO1);
//		System.out.println("新增成功");
//		System.out.println("===========");
		
//		//update
//		NtfVO ntfVO2 = new NtfVO();
//		ntfVO2.setNtf_id("NM00000007");
//		ntfVO2.setMemb_id("M000000009");
//		ntfVO2.setNtf_link("http://a");
//		dao.update(ntfVO2);
//		System.out.println("修改成功");
//		System.out.println("===========");
		
		//update
		
		
		dao.updateNtf_sta("NM00000004");
		System.out.println("修改狀態成功");
		System.out.println("===========");

//		//delete
//		dao.delete("NM00000007");
//		System.out.println("刪除成功");
//		System.out.println("===========");
		
//		//findByPrimaryKey
//		NtfVO ntfVO2 = dao.findByPrimaryKey("NM00000001");
//		System.out.println(ntfVO2.getNtf_id());
//		System.out.println(ntfVO2.getMemb_id());
//		System.out.println(ntfVO2.getNtf_src_id());
//		System.out.println(ntfVO2.getNtf_dt());
//		System.out.println(ntfVO2.getNtf_link());
//		System.out.println(ntfVO2.getNtf_sta());
//		System.out.println(ntfVO2.getNtf_time());
//		
//		System.out.println("單一資料查詢成功");
//		System.out.println("===========");
		
//		//getAll
//		List<NtfVO> list = dao.getAll();
//		for(NtfVO aNtf : list) {
//			System.out.println(aNtf.getNtf_id());
//			System.out.println(aNtf.getMemb_id());
//			System.out.println(aNtf.getNtf_src_id());
//			System.out.println(aNtf.getNtf_dt());
//			System.out.println(aNtf.getNtf_link());
//			System.out.println(aNtf.getNtf_sta());
//			System.out.println(aNtf.getNtf_time());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		
//		//getAll
//		List<NtfVO> list2 = dao.getAllNtfsFromSameMember("M000000004");
//		for(NtfVO aNtf : list2) {
//			System.out.println(aNtf.getNtf_id());
//			System.out.println(aNtf.getMemb_id());
//			System.out.println(aNtf.getNtf_src_id());
//			System.out.println(aNtf.getNtf_dt());
//			System.out.println(aNtf.getNtf_link());
//			System.out.println(aNtf.getNtf_sta());
//			System.out.println(aNtf.getNtf_time());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		//getAll
//		List<NtfVO> list3 = dao.checkMemberNtf("M000000004","NM00000001");
//		for(NtfVO aNtf : list3) {
//			System.out.println(aNtf.getNtf_id());
//			System.out.println(aNtf.getMemb_id());
//			System.out.println(aNtf.getNtf_src_id());
//			System.out.println(aNtf.getNtf_dt());
//			System.out.println(aNtf.getNtf_link());
//			System.out.println(aNtf.getNtf_sta());
//			System.out.println(aNtf.getNtf_time());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		
		
	}

	@Override
	public void insert(NtfVO ntfVO,Connection con) {

	
		PreparedStatement pstmt = null;
		
		try {
			
			
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,ntfVO.getMemb_id());
			pstmt.setString(2,ntfVO.getNtf_src_id());
			pstmt.setString(3,ntfVO.getNtf_dt());
			pstmt.setString(4,ntfVO.getNtf_link());
		
			
			pstmt.executeUpdate();
			
			
			
		}catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-通知");
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
	public void update(NtfVO ntfVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,ntfVO.getMemb_id());
			pstmt.setString(2,ntfVO.getNtf_src_id());
			pstmt.setString(3,ntfVO.getNtf_dt());
			pstmt.setString(4,ntfVO.getNtf_link());
			pstmt.setString(5,ntfVO.getNtf_sta());
			pstmt.setTimestamp(6,ntfVO.getNtf_time());
			pstmt.setString(7,ntfVO.getNtf_id());
			
					
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
	public void delete(String ntf_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,ntf_id);
			
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
	public NtfVO findByPrimaryKey(String ntf_id) {
		NtfVO ntfVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,ntf_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ntfVO = new NtfVO();
				ntfVO.setNtf_id(rs.getString("ntf_id"));
				ntfVO.setMemb_id(rs.getString("memb_id"));
				ntfVO.setNtf_src_id(rs.getString("ntf_src_id"));
				ntfVO.setNtf_dt(rs.getString("ntf_dt"));
				ntfVO.setNtf_link(rs.getString("ntf_link"));
				ntfVO.setNtf_sta(rs.getString("ntf_sta"));
				ntfVO.setNtf_time(rs.getTimestamp("ntf_time"));
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
		return ntfVO;
	}

	@Override
	public List<NtfVO> getAll() {
		List<NtfVO> list = new ArrayList<NtfVO>();
		NtfVO ntfVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ntfVO = new NtfVO();
				ntfVO.setNtf_id(rs.getString("ntf_id"));
				ntfVO.setMemb_id(rs.getString("memb_id"));
				ntfVO.setNtf_src_id(rs.getString("ntf_src_id"));
				ntfVO.setNtf_dt(rs.getString("ntf_dt"));
				ntfVO.setNtf_link(rs.getString("ntf_link"));
				ntfVO.setNtf_sta(rs.getString("ntf_sta"));
				ntfVO.setNtf_time(rs.getTimestamp("ntf_time"));
				list.add(ntfVO);
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
	public List<NtfVO> getAllNtfsFromSameMember(String memb_id) {
		List<NtfVO> list = new ArrayList<NtfVO>();
		NtfVO ntfVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(MEMBER_GET_ALL_STMT);
			pstmt.setString(1,memb_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ntfVO = new NtfVO();
				ntfVO.setNtf_id(rs.getString("ntf_id"));
				ntfVO.setMemb_id(rs.getString("memb_id"));
				ntfVO.setNtf_src_id(rs.getString("ntf_src_id"));
				ntfVO.setNtf_dt(rs.getString("ntf_dt"));
				ntfVO.setNtf_link(rs.getString("ntf_link"));
				ntfVO.setNtf_sta(rs.getString("ntf_sta"));
				ntfVO.setNtf_time(rs.getTimestamp("ntf_time"));
				list.add(ntfVO);
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
	public List<NtfVO> checkMemberNtf(String memb_id, String ntf_id) {
		List<NtfVO> list = new ArrayList<NtfVO>();
		NtfVO ntfVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(CHECK_MEMBER_NTF);
			pstmt.setString(1,memb_id);
			pstmt.setString(2,ntf_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ntfVO = new NtfVO();
				ntfVO.setNtf_id(rs.getString("ntf_id"));
				ntfVO.setMemb_id(rs.getString("memb_id"));
				ntfVO.setNtf_src_id(rs.getString("ntf_src_id"));
				ntfVO.setNtf_dt(rs.getString("ntf_dt"));
				ntfVO.setNtf_link(rs.getString("ntf_link"));
				ntfVO.setNtf_sta(rs.getString("ntf_sta"));
				ntfVO.setNtf_time(rs.getTimestamp("ntf_time"));
				list.add(ntfVO);
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
	public void updateNtf_sta(String ntf_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STA_STMT);
			
			pstmt.setString(1,ntf_id);
		
			
					
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

}
