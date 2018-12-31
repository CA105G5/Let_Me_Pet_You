package com.CurrencyDetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CurDtJDBCDAO implements CurDtDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456";
	
	private static final String INSERT_STMT="INSERT INTO CURRENCY_DETAIL (cur_dt_id,memb_id,cur_src_id,cur_dt) VALUES ('CD'||lpad(to_char(currency_detail_seq.nextval), 8, '0'),?,?,?)";
	private static final String UPDATE_STMT="UPDATE CURRENCY_DETAIL set memb_id=?, cur_src_id=?, cur_dt=? where cur_dt_id=?";
	private static final String DELETE_STMT="DELETE FROM CURRENCY_DETAIL where cur_dt_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM CURRENCY_DETAIL where cur_dt_id=?"; 
	private static final String GET_ALL_STMT="SELECT * FROM CURRENCY_DETAIL order by cur_dt_id";
	
	public static void main(String[] args) {
		//checked
		CurDtJDBCDAO dao = new CurDtJDBCDAO();
		//insert
		CurDtVO curdtVO1 = new CurDtVO();
		curdtVO1.setMemb_id("M000000006");
		dao.insert(curdtVO1);
		System.out.println("新增成功");
		System.out.println("===========");
		
		//update
		CurDtVO curdtVO2 = new CurDtVO();
		curdtVO2.setCur_dt_id("CD00000006");
		curdtVO2.setMemb_id("M000000007");
		dao.update(curdtVO2);
		System.out.println("修改成功");
		System.out.println("===========");
		
		//delete
		dao.delete("CD00000006");
		System.out.println("刪除成功");
		System.out.println("===========");
		
		//findByPrimaryKey
		CurDtVO curdtVO3 = dao.findByPrimaryKey("CD00000001");
		System.out.println(curdtVO3.getCur_dt_id());
		System.out.println(curdtVO3.getMemb_id());
		System.out.println(curdtVO3.getCur_src_id());
		System.out.println(curdtVO3.getCur_dt());
		System.out.println("==========================");
		System.out.println("單一資料查詢成功");
		System.out.println("===========");
		
		//getAll
		List<CurDtVO> list = dao.getAll();
		for(CurDtVO aCurDt : list) {
			System.out.println(aCurDt.getCur_dt_id());
			System.out.println(aCurDt.getMemb_id());
			System.out.println(aCurDt.getCur_src_id());
			System.out.println(aCurDt.getCur_dt());
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
		}
		System.out.println("多筆資料查詢成功"); 
		System.out.println("===========");
	}

	@Override
	public void insert(CurDtVO curdtVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,curdtVO.getMemb_id());
			pstmt.setString(2,curdtVO.getCur_src_id());
			pstmt.setString(3,curdtVO.getCur_dt());
			
			
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
	
	public void insert(CurDtVO curdtVO, Connection con) {
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,curdtVO.getMemb_id());
			pstmt.setString(2,curdtVO.getCur_src_id());
			pstmt.setString(3,curdtVO.getCur_dt()); 
			
			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
		} catch (Exception se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-Product庫存量更新");
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
	public void update(CurDtVO curdtVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,curdtVO.getMemb_id());
			pstmt.setString(2,curdtVO.getCur_src_id());
			pstmt.setString(3,curdtVO.getCur_dt());
			pstmt.setString(4,curdtVO.getCur_dt_id());
					
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
	public void delete(String cur_dt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,cur_dt_id);
			
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
	public CurDtVO findByPrimaryKey(String cur_dt_id) {
		CurDtVO curdtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,cur_dt_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				curdtVO = new CurDtVO();
				curdtVO.setCur_dt_id(rs.getString("cur_dt_id"));
				curdtVO.setMemb_id(rs.getString("memb_id"));
				curdtVO.setCur_src_id(rs.getString("cur_src_id"));
				curdtVO.setCur_dt(rs.getString("cur_dt"));
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
		return curdtVO;
		
	}

	@Override
	public List<CurDtVO> getAll() {
		List<CurDtVO> list = new ArrayList<CurDtVO>();
		CurDtVO curdtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				curdtVO = new CurDtVO();
				curdtVO.setCur_dt_id(rs.getString("cur_dt_id"));
				curdtVO.setMemb_id(rs.getString("memb_id"));
				curdtVO.setCur_src_id(rs.getString("cur_src_id"));
				curdtVO.setCur_dt(rs.getString("cur_dt"));
				list.add(curdtVO);
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
