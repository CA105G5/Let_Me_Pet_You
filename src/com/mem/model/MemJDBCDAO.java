package com.mem.model;

import java.sql.*;
import java.util.*;

public class MemJDBCDAO implements MemDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456"; 
	
	private static final String INSERT_STMT="INSERT INTO MEMBER "
			+ "(memb_id,memb_acc,memb_psw,memb_name,memb_nick,memb_email,memb_cellphone,memb_gender,memb_cre_type,memb_cre_name,memb_cre_year,memb_cre_month) "
			+ "VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 9, '0'),?,?,?,?,?,?,?,?,?,?,?)";
	private static final 
	String UPDATE_STMT="UPDATE MEMBER set memb_sta=?, memb_acc=?, memb_psw=?, memb_name=?, memb_nick=?, memb_email=?, memb_cellphone=?, memb_gender=?, memb_balance=?, memb_cre_type=?, memb_cre_name=?, memb_cre_year=?, memb_cre_month=?, memb_vio_times=? where memb_id=?";
	private static final 
	String CLIENT_UPDATE_STMT="UPDATE MEMBER set memb_psw=?, memb_name=?, memb_nick=?, memb_email=?, memb_cellphone=?, memb_gender=?, memb_cre_type=?, memb_cre_name=?, memb_cre_year=?, memb_cre_month=? where memb_id=?";
	private static final 
	String MANAGER_UPDATE_STMT="UPDATE MEMBER set memb_sta=?, memb_vio_times=? where memb_id=?";
	private static final String DELETE_STMT="DELETE FROM MEMBER where memb_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM MEMBER where memb_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM MEMBER order by memb_id";

	public static void main(String[] args) {
		MemJDBCDAO dao = new MemJDBCDAO();
		
		//insert
		MemVO memVO1 = new MemVO();
		memVO1.setMemb_acc("abcde");
		memVO1.setMemb_psw("12345");
		memVO1.setMemb_name("許修豪");
		memVO1.setMemb_nick("豪豪");
		memVO1.setMemb_email("w121212w00@gmail.com");
		dao.insert(memVO1);
		System.out.println("新增成功");
		System.out.println("===========");
		
		//update
		MemVO memVO1_5 = new MemVO();
		memVO1_5.setMemb_id("M000000011");
		memVO1_5.setMemb_psw("33333");
		memVO1_5.setMemb_name("許許");
		memVO1_5.setMemb_nick("許許");
		
		memVO1_5.setMemb_sta("停權1");
		memVO1_5.setMemb_acc("edcba");
		memVO1_5.setMemb_balance(100);
		memVO1_5.setMemb_vio_times(2);
		
		memVO1_5.setMemb_email("xxx@gmail.com");
		dao.update(memVO1_5);
		System.out.println("修改成功");
		System.out.println("===========");
		
		
		//updateFromClient
		MemVO memVO2 = new MemVO();
		memVO2.setMemb_id("M000000011");
		memVO2.setMemb_psw("54321");
		memVO2.setMemb_name("修豪許");
		memVO2.setMemb_nick("修修");
		memVO2.setMemb_email("yyy@gmail.com");
		dao.updateFromClient(memVO2);
		System.out.println("客戶修改成功");
		System.out.println("===========");
	
		//updateFromManager
		MemVO memVO3 = new MemVO();
		memVO3.setMemb_id("M000000011");
		memVO3.setMemb_vio_times(3);
		memVO3.setMemb_sta("停權2");
		dao.updateFromManager(memVO3);
		System.out.println("管理員修改成功");
		System.out.println("===========");
		
		//delete
		dao.delete("M000000011");
		System.out.println("刪除成功");
		System.out.println("===========");
		
		//findByPrimaryKey
		MemVO memVO4 = dao.findByPrimaryKey("M000000001");
		System.out.println(memVO4.getMemb_acc());
		System.out.println(memVO4.getMemb_psw());
		System.out.println(memVO4.getMemb_name());
		System.out.println(memVO4.getMemb_nick());
		System.out.println(memVO4.getMemb_email());
		System.out.println("==========================");
		System.out.println("單一資料查詢成功");
		System.out.println("===========");
		
		//getAll
		List <MemVO> list = dao.getAll();
		for(MemVO aMem : list) {
			System.out.println(aMem.getMemb_acc());
			System.out.println(aMem.getMemb_psw());
			System.out.println(aMem.getMemb_name());
			System.out.println(aMem.getMemb_nick());
			System.out.println(aMem.getMemb_email());
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
		}
		System.out.println("多筆資料查詢成功");
		System.out.println("===========");
	}

	@Override
	public void insert(MemVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,memVO.getMemb_acc());
			pstmt.setString(2,memVO.getMemb_psw());
			pstmt.setString(3,memVO.getMemb_name());
			pstmt.setString(4,memVO.getMemb_nick());
			pstmt.setString(5,memVO.getMemb_email());
			pstmt.setString(6,memVO.getMemb_cellphone());
			pstmt.setString(7,memVO.getMemb_gender());
			pstmt.setString(8,memVO.getMemb_cre_type());
			pstmt.setString(9,memVO.getMemb_cre_name());
			pstmt.setString(10,memVO.getMemb_cre_year());
			pstmt.setString(11,memVO.getMemb_cre_month());
			
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
	public void update(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,memVO.getMemb_sta());
			pstmt.setString(2,memVO.getMemb_acc());
			pstmt.setString(3,memVO.getMemb_psw());
			pstmt.setString(4,memVO.getMemb_name());
			pstmt.setString(5,memVO.getMemb_nick());
			pstmt.setString(6,memVO.getMemb_email());
			pstmt.setString(7,memVO.getMemb_cellphone());
			pstmt.setString(8,memVO.getMemb_gender());
			pstmt.setInt(9,memVO.getMemb_balance());
			pstmt.setString(10,memVO.getMemb_cre_type());
			pstmt.setString(11,memVO.getMemb_cre_name());
			pstmt.setString(12,memVO.getMemb_cre_year());
			pstmt.setString(13,memVO.getMemb_cre_month());
			pstmt.setInt(14,memVO.getMemb_vio_times());
			pstmt.setString(15,memVO.getMemb_id());
			
			
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
	public void updateFromClient(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(CLIENT_UPDATE_STMT);
			
			
			pstmt.setString(1,memVO.getMemb_psw());
			pstmt.setString(2,memVO.getMemb_name());
			pstmt.setString(3,memVO.getMemb_nick());
			pstmt.setString(4,memVO.getMemb_email());
			pstmt.setString(5,memVO.getMemb_cellphone());
			pstmt.setString(6,memVO.getMemb_gender());
			pstmt.setString(7,memVO.getMemb_cre_type());
			pstmt.setString(8,memVO.getMemb_cre_name());
			pstmt.setString(9,memVO.getMemb_cre_year());
			pstmt.setString(10,memVO.getMemb_cre_month());
			pstmt.setString(11,memVO.getMemb_id());
			
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
	public void updateFromManager(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(MANAGER_UPDATE_STMT);
			
			pstmt.setString(1,memVO.getMemb_sta());
			pstmt.setInt(2,memVO.getMemb_vio_times());
			pstmt.setString(3,memVO.getMemb_id());
			
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
	public void delete(String memb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,memb_id);
			
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
	public MemVO findByPrimaryKey(String memb_id) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,memb_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memVO = new MemVO();
				memVO.setMemb_id(rs.getString("memb_id"));
				memVO.setMemb_sta(rs.getString("memb_sta"));
				memVO.setMemb_acc(rs.getString("memb_acc"));
				memVO.setMemb_psw(rs.getString("memb_psw"));
				memVO.setMemb_name(rs.getString("memb_name"));
				memVO.setMemb_nick(rs.getString("memb_nick"));
				memVO.setMemb_email(rs.getString("memb_email"));
				memVO.setMemb_cellphone(rs.getString("memb_cellphone"));
				memVO.setMemb_gender(rs.getString("memb_gender"));
				memVO.setMemb_balance(rs.getInt("memb_balance"));
				memVO.setMemb_cre_type(rs.getString("memb_cre_type"));
				memVO.setMemb_cre_name(rs.getString("memb_cre_name"));
				memVO.setMemb_cre_year(rs.getString("memb_cre_year"));
				memVO.setMemb_cre_month(rs.getString("memb_cre_month"));
				memVO.setMemb_vio_times(rs.getInt("memb_vio_times"));
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
		return memVO;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memVO = new MemVO();
				memVO.setMemb_id(rs.getString("memb_id"));
				memVO.setMemb_sta(rs.getString("memb_sta"));
				memVO.setMemb_acc(rs.getString("memb_acc"));
				memVO.setMemb_psw(rs.getString("memb_psw"));
				memVO.setMemb_name(rs.getString("memb_name"));
				memVO.setMemb_nick(rs.getString("memb_nick"));
				memVO.setMemb_email(rs.getString("memb_email"));
				memVO.setMemb_cellphone(rs.getString("memb_cellphone"));
				memVO.setMemb_gender(rs.getString("memb_gender"));
				memVO.setMemb_balance(rs.getInt("memb_balance"));
				memVO.setMemb_cre_type(rs.getString("memb_cre_type"));
				memVO.setMemb_cre_name(rs.getString("memb_cre_name"));
				memVO.setMemb_cre_year(rs.getString("memb_cre_year"));
				memVO.setMemb_cre_month(rs.getString("memb_cre_month"));
				memVO.setMemb_vio_times(rs.getInt("memb_vio_times"));
				list.add(memVO);
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
}
